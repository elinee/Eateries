import UIKit

class RateViewController: UIViewController {

    @IBOutlet weak var brilliantButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var ratingStackView: UIStackView!
    
    var restRating: String?
    
    @IBAction func rateRestaurant(sender: UIButton){
        switch sender.tag {
        case 0:
            self.restRating = "bad"
        case 1:
            self.restRating = "good"
        case 2:
            self.restRating = "brilliant"
        default:
            break
        }
        performSegue(withIdentifier: "unwindSegueToDetailVC", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        badButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        goodButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        brilliantButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.insertSubview(blurEffectView, at: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 0.4) {
//            self.ratingStackView.transform = CGAffineTransform(scaleX: 1, y: 1)
//        }
        let buttonArray = [badButton, goodButton, brilliantButton]
        for (index, button) in buttonArray.enumerated() {
            let delay = Double(index) * 0.2
            UIView.animate(withDuration: 0.6, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                button?.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }

}
