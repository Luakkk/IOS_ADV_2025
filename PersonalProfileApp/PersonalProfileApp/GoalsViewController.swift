import UIKit
class GoalsViewController: UIViewController {
    @IBOutlet weak var goalsLabel: UILabel!
    @IBOutlet weak var editGoalsButton: UIButton!
    @IBOutlet weak var goalsImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        goalsLabel.numberOfLines = 0
        goalsLabel.font = UIFont.systemFont(ofSize: 18)
        goalsLabel.text = "- Become a professional iOS Developer\n- Contribute to open source projects\n- Build impactful mobile apps"
        view.backgroundColor = UIColor.systemBackground

        goalsImageView.image = UIImage(named: "profile_pic")

        editGoalsButton.setTitle("Edit Goals", for: .normal)
        editGoalsButton.backgroundColor = UIColor.systemBlue
        editGoalsButton.layer.cornerRadius = 8
    }
}
