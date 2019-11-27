//
//  SampleTableViewController.swift
//  AnotherXIBCell
//
//  Created by Don Mag on 11/27/19.
//  Copyright © 2019 Don Mag. All rights reserved.
//

import UIKit

class TeamItemCell: UITableViewCell {
	
	@IBOutlet var cellBackgroundView: UIView!
	
	@IBOutlet var profilePictureImageView: UIImageView!
	@IBOutlet var soxCompliantImageView: UIImageView!
	
	@IBOutlet var personName: UILabel!
	@IBOutlet var designation: UILabel!
	
	@IBOutlet var messageButton: UIButton!
	
	@IBOutlet var fullProgressBar: UIView!
	@IBOutlet var achievedProgress: UIView!
	@IBOutlet var arrowFullImageViewAchieved: UIImageView!
	
	@IBOutlet var achievedLabel: UILabel!
	@IBOutlet var quotaLabel: UILabel!
	
	@IBOutlet var totalpipelineBar: UIView!
	@IBOutlet var wonProgress: UIView!
	@IBOutlet var arrowFullImageViewClosedWon: UIImageView!
	
	@IBOutlet var closedwonLabel: UILabel!
	@IBOutlet var totalpipelineLabel: UILabel!
	
	
	@IBOutlet var achievedWidth: NSLayoutConstraint!
	@IBOutlet var wonWidth: NSLayoutConstraint!
	
	@IBOutlet var arrowFullTrailingConstraintAchieved: NSLayoutConstraint!
	@IBOutlet var arrowFullTrailingConstraintClosedWon: NSLayoutConstraint!
	
	@IBOutlet var largeDealsButton: UIButton!
	@IBOutlet var largedealsLabel: UILabel!
	
}

class SampleTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.register(UINib(nibName: "TeamItemCell", bundle: nil), forCellReuseIdentifier: "TeamItemCell")

		tableView.estimatedRowHeight = 300
		
	}

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "TeamItemCell", for: indexPath) as! TeamItemCell
		return cell

	}

}
