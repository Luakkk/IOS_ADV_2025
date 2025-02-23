import UIKit
class HobbiesViewController: UIViewController, UITableViewDataSource {
    let hobbies = ["Drawing", "Piano", "Coding"]
    @IBOutlet weak var hobbiesTableView: UITableView!
    @IBOutlet weak var hobbiesTitleLabel: UILabel!
    @IBOutlet weak var addHobbyButton: UIButton!
    @IBOutlet weak var hobbiesImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        hobbiesTableView.dataSource = self
        hobbiesTableView.backgroundColor = UIColor.systemGroupedBackground

        hobbiesTitleLabel.text = "My Hobbies"
        hobbiesTitleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        hobbiesImageView.image = UIImage(named: "profile_pic")

        addHobbyButton.setTitle("Add Hobby", for: .normal)
        addHobbyButton.backgroundColor = UIColor.systemBlue
        addHobbyButton.layer.cornerRadius = 8
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hobbies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HobbyCell", for: indexPath)
        cell.textLabel?.text = hobbies[indexPath.row]
        cell.imageView?.image = UIImage(systemName: "star.fill")
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18)
        return cell
    }
}
