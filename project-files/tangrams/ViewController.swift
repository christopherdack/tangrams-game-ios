// Tangrams
// Christopher Dack
// 4/21/2016
// CITP 235, Spring 2016
// Final Project
// Copyright © 2016 CD. All rights reserved.

import UIKit

class ViewController: UIViewController
{

    // Outlet for background image
    @IBOutlet weak var imgBackground: UIImageView!
    
    // View and ImageView outlets for shapes
    @IBOutlet weak var viewTriangleLarge1: UIView!
    @IBOutlet weak var imgTriangleLarge1: UIImageView!
    
    @IBOutlet weak var viewSquare: UIView!
    @IBOutlet weak var imgSquare: UIImageView!
    
    @IBOutlet weak var viewTriangleMedium: UIView!
    @IBOutlet weak var imgTriangleMedium: UIImageView!
    
    @IBOutlet weak var viewTriangleLarge2: UIView!
    @IBOutlet weak var imgTriangleLarge2: UIImageView!
    
    @IBOutlet weak var viewTriangleSmall1: UIView!
    @IBOutlet weak var imgTriangleSmall1: UIImageView!
    
    @IBOutlet weak var viewTriangleSmall2: UIView!
    @IBOutlet weak var imgTriangleSmall2: UIImageView!
    
    @IBOutlet weak var viewRhombus: UIView!
    @IBOutlet weak var imgRhombus: UIImageView!
    
    /**** Outlets for views and image views that display
     silhouette (puzzle) and solution
     ****/
    @IBOutlet weak var viewSilhouette: UIView!
    @IBOutlet weak var imgSilhouette: UIImageView!
    
    @IBOutlet weak var viewSolution: UIView!
    @IBOutlet weak var imgSolution: UIImageView!
    
    // Initialize silhouetteSolutionArray and silhouetteSolutionIndex variable
    var silhouetteSolutions: [SilhouetteSolution] = []
    var silhouetteSolutionIndex = 0
    
/*
    // REVISIT THIS
    // Initialize silhouette and solution indices to zero
    var silhouetteNumber = 0
    var solutionNumber = 0
    
    // REVISIT THIS
    // Initialize silhouetteName and solutionName variables
    var silhouetteName: String = ""
    var solutionName: String = ""
*/
    
    /**** Function to create silhouette (puzzle) and solution image combinations based on SilhouetteSolution struct. Additional combinations could be added to game
        by importing new silhouette and solution images and then adding additional
        structs to this function.
     ****/
    func PopulateSilhouetteSolutionArray()
    {
        var puzzle1 = SilhouetteSolution()
        puzzle1.silhouetteImage = UIImage(named: "bunny")
        puzzle1.solutionImage = UIImage(named: "bunny-solution")
        
        var puzzle2 = SilhouetteSolution()
        puzzle2.silhouetteImage = UIImage(named: "candle")
        puzzle2.solutionImage = UIImage(named: "candle-solution")
        
        var puzzle3 = SilhouetteSolution()
        puzzle3.silhouetteImage = UIImage(named: "cat1")
        puzzle3.solutionImage = UIImage(named: "cat1-solution")
        
        var puzzle4 = SilhouetteSolution()
        puzzle4.silhouetteImage = UIImage(named: "reader")
        puzzle4.solutionImage = UIImage(named: "reader-solution")
        
        var puzzle5 = SilhouetteSolution()
        puzzle5.silhouetteImage = UIImage(named: "bird")
        puzzle5.solutionImage = UIImage(named: "bird-solution")
        
        var puzzle6 = SilhouetteSolution()
        puzzle6.silhouetteImage = UIImage(named: "bunny2")
        puzzle6.solutionImage = UIImage(named: "bunny2-solution")
        
        var puzzle7 = SilhouetteSolution()
        puzzle7.silhouetteImage = UIImage(named: "sailboat")
        puzzle7.solutionImage = UIImage(named: "sailboat-solution")
        
        var puzzle8 = SilhouetteSolution()
        puzzle8.silhouetteImage = UIImage(named: "cat2")
        puzzle8.solutionImage = UIImage(named: "cat2-solution")
        
        var puzzle9 = SilhouetteSolution()
        puzzle9.silhouetteImage = UIImage(named: "duck")
        puzzle9.solutionImage = UIImage(named: "duck-solution")
        
        var puzzle10 = SilhouetteSolution()
        puzzle10.silhouetteImage = UIImage(named: "teapot")
        puzzle10.solutionImage = UIImage(named: "teapot-solution")
        
        // Populate the silhouetteSolutions array with structs
        silhouetteSolutions = [puzzle1, puzzle2, puzzle3, puzzle4, puzzle5, puzzle6, puzzle7, puzzle8, puzzle9, puzzle10]
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Assign background image
        self.imgBackground.image = UIImage(named: "tangrams-background")
        
        // Assign shape images to Image Views
        self.imgTriangleLarge1.image = UIImage(named: "triangle-large1")
        self.imgSquare.image = UIImage(named: "square")
        self.imgTriangleMedium.image = UIImage(named: "triangle-medium")
        self.imgTriangleLarge2.image = UIImage(named: "triangle-large2")
        self.imgTriangleSmall1.image = UIImage(named: "triangle-small1")
        self.imgTriangleSmall2.image = UIImage(named: "triangle-small2")
        self.imgRhombus.image = UIImage(named: "rhombus")
        
        // Assign initial silhouette and solution images and hide solution image
        self.imgSilhouette.image = UIImage(named: "bunny")
        self.imgSolution.image = UIImage(named: "bunny-solution")
        self.imgSolution.hidden = true
        
        /**** Populate silhouetteSolution with puzzle structs
            (silhouette and solution image combinations)
          ****/
        PopulateSilhouetteSolutionArray()
    }
    
    /**** Handle click of Show Solution button. Displays solution image by setting
     the image view imgSolution hidden property to false.
     ****/
    @IBAction func ShowSolution(sender: UIButton)
    {
        
        self.imgSolution.hidden = false
    }
    
    /**** Handle click of Next button. Increments silhouetteSolutionIndex or resets
     back to beginning of array. Assigns new silhouette and solution images.
     Hides solution image by setting the image view (imgSolution) hidden
     property to true.
     ****/
    @IBAction func Next(sender: UIButton)
    {
        if silhouetteSolutionIndex < silhouetteSolutions.count - 1
        {
            silhouetteSolutionIndex++
        }
        else
        {
            silhouetteSolutionIndex = 0
        }

        self.imgSilhouette.image = silhouetteSolutions[silhouetteSolutionIndex].silhouetteImage
        self.imgSolution.hidden = true
        self.imgSolution.image = silhouetteSolutions[silhouetteSolutionIndex].solutionImage
    }
    
    // Pan gesture recognizer function for all shapes
    @IBAction func PanShape(sender: UIPanGestureRecognizer)
    {
        let translation = sender.translationInView(self.view)
        sender.view!.center = CGPointMake(sender.view!.center.x + translation.x, sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: self.view)
    }
    
    // Rotate gesture recognizer function for all shapes
    @IBAction func RotateShape(sender: UIRotationGestureRecognizer)
    {
        if let view = sender.view
        {
            view.transform = CGAffineTransformRotate(view.transform, sender.rotation)
            sender.rotation = 0
        }
    }
}
