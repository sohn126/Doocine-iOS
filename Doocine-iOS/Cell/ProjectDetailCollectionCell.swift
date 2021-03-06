//
//  projectDetailCollectionCell.swift
//  Doocine-iOS
//
//  Created by Sohn on 13/04/2017.
//  Copyright © 2017 Sohn. All rights reserved.
//

import UIKit
import SnapKit
import RealmSwift

class ProjectDetailCollectionCell: UICollectionViewCell {
    var scene: Scene!
    var sceneImage = UIImageView()
    var sceneNumberLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func initCell(scene: Scene, order: Int) -> Void {
        let realm = try! Realm()
        let cut = realm.objects(Cut.self).filter("sceneId == \(scene.id)").first
        
        if cut != nil {
            let cutImage = PhotoManager.loadImage(imageId: (cut?.id)!)
            
            if cutImage != nil {
                sceneImage.image = cutImage
            } else {
                sceneImage.image = UIImage(named: "icon_add_img")
            }
        } else {
            sceneImage.image = UIImage(named: "icon_add_img")
        }
        sceneImage.contentMode = .scaleAspectFill
        sceneImage.clipsToBounds = true
        sceneImage.layer.cornerRadius = 8
        
        self.addSubview(sceneImage)
        
        sceneImage.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.bottom.equalTo(self).offset(-24)
        }
        
        sceneNumberLabel.text = "SCENE #\(order)"
        sceneNumberLabel.textColor = UIColor.darkGray
        sceneNumberLabel.font = UIFont.systemFont(ofSize: 14)
        
        self.addSubview(sceneNumberLabel)
        
        sceneNumberLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).offset(0)
            
        }
    }
}
