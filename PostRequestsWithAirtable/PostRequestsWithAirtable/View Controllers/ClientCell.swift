//
//  ClientCell.swift
//  PostRequestsWithAirtable
//
//  Created by Kelby Mittan on 12/18/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ClientCell: UITableViewCell {

    @IBOutlet var clientLogoImage: UIImageView!
    @IBOutlet var clientName: UILabel!
    
    
    func configureCell(for client: Client) {
        clientName.text = client.Name
        
    }

}
