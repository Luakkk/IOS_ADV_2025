import UIKit
class ProfileViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLocationLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.image = UIImage(named: "profile_pic")
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.clipsToBounds = true
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        ageLocationLabel.textColor = UIColor.systemGray
        bioLabel.font = UIFont.italicSystemFont(ofSize: 16)
        view.backgroundColor = UIColor.systemBackground

        nameLabel.text = "Alua Smanova"
        ageLocationLabel.text = "19 years old, Kazakhstan"
        bioLabel.text = "Aspiring iOS Developer, beginner at piano, and loves drawing."
    }
}
