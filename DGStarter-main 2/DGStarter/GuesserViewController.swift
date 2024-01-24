//
//  ViewController.swift
//  DGStarter
//
//  Created by Maribel Montejano on 12/13/22.
//

import UIKit

class GuesserViewController: UIViewController {

    // MARK: Models

    // Create individual Dinosaurs using Dinosaur model
    let about = HelloKitty(name: "Gallimimus", image: UIImage(named: "gallimimus")!, type: "ornithomimid")
    let friends = HelloKitty(name: "Stegosaurus", image: UIImage(named: "stegosaurus")!, type: "stegosaur")
    let story = HelloKitty(name: "Tyrannosaurus Rex", image: UIImage(named: "tyrannosaurus")!, type: "theropod")

    // Array for storing Dinosaurs
    var hello: [HelloKitty] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Store Dinosaur models
        hello = [about, friends, story]

        print("Here are the different facts:")
        for hello in HelloKitty {
            print(hello)
        }
    }

    @IBAction func didTapKat(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view {
            performSegue(withIdentifier: "aboutSegue", sender: tappedView)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "aboutSegue",
            let tappedView = sender as? UIView,
            let detailViewController = segue.destination as? AboutViewController {

            if tappedView.tag == 0 {
                detailViewController.hello = dinosaurs[0]
            } else if tappedView.tag == 1 {
                detailViewController.hello = dinosaurs[1]
            } else if tappedView.tag == 2 {
                detailViewController.hello = dinosaurs[2]
            } else {
                print("no Dinosaur was tapped, please check your selection.")
            }
        }
    }
    
}

