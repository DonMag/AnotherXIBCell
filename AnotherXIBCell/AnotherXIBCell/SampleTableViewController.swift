//
//  SampleTableViewController.swift
//  AnotherXIBCell
//
//  Created by Don Mag on 11/27/19.
//

import UIKit

extension NSLayoutConstraint {
	
	func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
		
		guard let fi = firstItem else {
			return self
		}
		NSLayoutConstraint.deactivate([self])
		
		let c = NSLayoutConstraint(
			item: fi,
			attribute: firstAttribute,
			relatedBy: relation,
			toItem: secondItem,
			attribute: secondAttribute,
			multiplier: multiplier,
			constant: constant)
		
		c.priority = priority
		c.shouldBeArchived = self.shouldBeArchived
		c.identifier = self.identifier
		
		NSLayoutConstraint.activate([c])
		return c
	}

}

class RoundedEndView: UIView {
	override func layoutSubviews() {
		super.layoutSubviews()
		layer.cornerRadius = bounds.size.height * 0.5
	}
}

class RoundedCornerView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commonInit()
	}
	func commonInit() -> Void {
		layer.shadowOffset = CGSize(width: 0, height: 1)
		layer.shadowOpacity = 0.6
		layer.shadowRadius = 1.0
		layer.shadowColor = UIColor.lightGray.cgColor
	}
	override func layoutSubviews() {
		super.layoutSubviews()
		layer.cornerRadius = 16.0
//		layer.masksToBounds = true
	}
}

class TeamItemCell: UITableViewCell {
	
	@IBOutlet var cellBackgroundView: RoundedCornerView!
	
	@IBOutlet var profilePictureImageView: UIImageView!
	@IBOutlet var soxCompliantImageView: UIImageView!
	
	@IBOutlet var personName: UILabel!
	@IBOutlet var designation: UILabel!
	
	@IBOutlet var messageButton: UIButton!
	
	@IBOutlet var fullProgressBar: RoundedEndView!
	@IBOutlet var achievedProgress: RoundedEndView!
	@IBOutlet var arrowFullImageViewAchieved: UIImageView!
	
	@IBOutlet var achievedLabel: UILabel!
	@IBOutlet var quotaLabel: UILabel!
	
	@IBOutlet var totalpipelineBar: RoundedEndView!
	@IBOutlet var wonProgress: RoundedEndView!
	@IBOutlet var arrowFullImageViewClosedWon: UIImageView!
	
	@IBOutlet var closedwonLabel: UILabel!
	@IBOutlet var totalpipelineLabel: UILabel!
	
	@IBOutlet var largeDealsButton: UIButton!
	@IBOutlet var largedealsLabel: UILabel!
	
	@IBOutlet var achievedWidth: NSLayoutConstraint!
	@IBOutlet var wonWidth: NSLayoutConstraint!
	
	// not used?
	//@IBOutlet var arrowFullTrailingConstraintAchieved: NSLayoutConstraint!
	//@IBOutlet var arrowFullTrailingConstraintClosedWon: NSLayoutConstraint!
	
	func updateAchievedWidth(_ val: CGFloat) -> Void {
		achievedWidth = achievedWidth.setMultiplier(multiplier: min(val, 1.0))
		arrowFullImageViewAchieved.isHidden = val <= 1.0
	}
	func updateWonWidth(_ val: CGFloat) -> Void {
		wonWidth = wonWidth.setMultiplier(multiplier: min(val, 1.0))
		arrowFullImageViewClosedWon.isHidden = val <= 1.0
	}
}

struct TeamItem {
	var person: String = "Person"
	var role: String = "Role"
	var achieved: Float = 1
	var quota: Float = 1
	var closedWon: Float = 1
	var totalPipeline: Float = 1
	var deals: Int = 0
}

class SampleTableViewController: UITableViewController {

	var theData: [TeamItem] = [TeamItem]()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		theData.append(TeamItem(person: "Hiroshi Koimai", role: "Senior Director, Sales GAM APJ", achieved: 12.42, quota: 11.42, closedWon: 5.71, totalPipeline: 11.42, deals: 4))
		theData.append(TeamItem(person: "Rocky Soper", role: "VP, Strategy, Planning & Operations", achieved: 56.8, quota: 124, closedWon: 0, totalPipeline: 0, deals: 0))
		theData.append(TeamItem(person: "Stephanie Barton", role: "Some Other Title", achieved: 6.8, quota: 14.7, closedWon: 3.4, totalPipeline: 14.7, deals: 2))

		tableView.register(UINib(nibName: "TeamItemCell", bundle: nil), forCellReuseIdentifier: "TeamItemCell")

		tableView.estimatedRowHeight = 300
		
		tableView.separatorStyle = .none
		
		tableView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
	}

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return theData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "TeamItemCell", for: indexPath) as! TeamItemCell
		
		let d = theData[indexPath.row]
		
		cell.personName.text = d.person
		cell.designation.text = d.role
		cell.achievedLabel.text = "$\(d.achieved)M"
		cell.quotaLabel.text = "$\(d.quota)M"
		cell.closedwonLabel.text = "$\(d.closedWon)M"
		cell.totalpipelineLabel.text = "$\(d.totalPipeline)M"
		cell.largedealsLabel.text = "\(d.deals) Large Deals"

		var w: CGFloat = 0.0
		if d.quota > 0.0 {
			w = CGFloat(d.achieved / d.quota)
		}
		cell.updateAchievedWidth(w)

		w = 0.0
		if d.totalPipeline > 0.0 {
			w = CGFloat(d.closedWon / d.totalPipeline)
		}
		cell.updateWonWidth(w)

		cell.backgroundColor = .clear
		
		return cell

	}

}
