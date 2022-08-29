//
//  QuestionViewController.swift
//  ReadPiano
//
//  Created by Олег Стригунов on 01.08.2022.
//

import UIKit
import SnapKit





class QuestionViewController: UIViewController {
    
    var data: [Response] = [.do, .re, .mi, .fa, .sol, .ly, .si]
    var questionNow: String = ""
    
    let flow = UICollectionViewFlowLayout()
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        flow.scrollDirection = .horizontal
        
        let itemSize = CGSize(width: Int(view.bounds.width) / 7, height: 140)
        flow.itemSize = itemSize
        flow.minimumInteritemSpacing = 1
        flow.minimumLineSpacing = 1
        
        
        
        
        let collectionView = PianoKeyboardCollectionView(
            frame: CGRect(x: 0, y: 140, width: view.bounds.width, height: 140),
            collectionViewLayout: flow)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .gray
        collectionView.register(KeyboardCell.self, forCellWithReuseIdentifier: "default") // ??? это что вообще
        
        view.addSubview(collectionView)

        for (i, item) in data.enumerated() {
           
            guard item.needsBlackButton else {continue}
            
            
            let blackButton = UIButton()
            blackButton.tag = i
            blackButton.backgroundColor = UIColor.black
            blackButton.addTarget(self, action: #selector(blackButtonTouched(sender:)), for: .touchUpInside)
            collectionView.addSubview(blackButton)
            // Start SnapKit
            blackButton.snp.makeConstraints { make in
                make.width.equalTo(itemSize.width * (40.0 / 67.0))
                make.height.equalTo(80)
                make.top.equalToSuperview()
                make.centerX.equalTo(CGFloat(i) * itemSize.width + 1)
            }
            // End SnapKit
            

        }
        
        updateUI()
        
        
    }
    
    @objc func blackButtonTouched(sender: UIButton) {
        print("black i = \(sender.tag)")
    }
    
    
    
    func playMusic(response: Response) {
        if response.rawValue.uppercased() == questionNow {
           updateUI()
        } else {
            print(questionNow)
            print(response.rawValue)
        
        }
        
      }
    
    

    
    
    func updateUI() {
        
        let question = Question.all[Int.random(in: 0 ... Question.all.count - 1)]
        
        questionLabel.text = "Где нота \(question.text) ?"
       
        questionNow = question.text
        
    }
    

}


extension QuestionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "default", for: indexPath) as! KeyboardCell
        let item = data[indexPath.item]
        cell.titleLabel.text = item.rawValue // rawValue - string
        
//        if indexPath.row == 5 {
//            cell.backgroundColor = .blue
//        }
            
        
        //cell.blackButtonIsHidden = !item.needsBlackButton
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           let item = data[indexPath.item]
           playMusic(response: item)
           
        
          // if indexPath.row == 5 { flow.itemSize = CGSize(width: 100, height: 100)}
       }
}



