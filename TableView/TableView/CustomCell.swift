//
//  CustomCell.swift
//  TableView
//
//  Created by Ekin Celebi on 24.04.2021.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    var cellHeight:CGFloat = 0
    
    let timestamp = UILabel()
    let latitude = UILabel()
    let longitude = UILabel()
    let depth = UILabel()
    let size = UILabel()
    let quality = UILabel()
    let humanReadableLocation = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(timestamp)
        contentView.addSubview(latitude)
        contentView.addSubview(longitude)
        contentView.addSubview(depth)
        contentView.addSubview(size)
        contentView.addSubview(quality)
        contentView.addSubview(humanReadableLocation)

        let edgeConstant:CGFloat = 8
        let topConstant:CGFloat = 4
        let heightConstant:CGFloat = 24
        
        humanReadableLocation.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: nil, right: nil, topConstant: topConstant, leftConstant: edgeConstant, bottomConstant: 0, rightConstant: 0, width: 0, height: heightConstant)
        latitude.anchor(top: humanReadableLocation.bottomAnchor, left: contentView.leftAnchor, bottom: nil, right: nil, topConstant: topConstant, leftConstant: edgeConstant, bottomConstant: 0, rightConstant: 0, width: 0, height: heightConstant)
        longitude.anchor(top: humanReadableLocation.bottomAnchor, left: nil, bottom: nil, right: contentView.rightAnchor, topConstant: topConstant, leftConstant: 0, bottomConstant: 0, rightConstant: edgeConstant, width: 0, height: heightConstant)
        timestamp.anchor(top: latitude.bottomAnchor, left: contentView.leftAnchor, bottom: nil, right: nil, topConstant: topConstant, leftConstant: edgeConstant, bottomConstant: 0, rightConstant: 0, width: 0, height: heightConstant)
        depth.anchor(top: timestamp.bottomAnchor, left: contentView.leftAnchor, bottom: nil, right: nil, topConstant: topConstant, leftConstant: edgeConstant, bottomConstant: 0, rightConstant: 0, width: 0, height: heightConstant)
        quality.anchor(top: timestamp.bottomAnchor, left: nil, bottom: nil, right: contentView.rightAnchor, topConstant: topConstant, leftConstant: 0, bottomConstant: 0, rightConstant: edgeConstant, width: 0, height: heightConstant)
        size.anchor(top: depth.bottomAnchor, left: contentView.leftAnchor, bottom: nil, right: nil, topConstant: topConstant, leftConstant: edgeConstant, bottomConstant: 0, rightConstant: 0, width: 0, height: heightConstant)
        

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
