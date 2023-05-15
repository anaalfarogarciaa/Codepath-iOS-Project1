//
//  ViewController.swift
//  IOS_Project_1_My_Story
//
//  Created by  Ana Alfaro-Garcia on 05/07/23.
//

import UIKit

class ViewController: UIViewController {

    let backstory = Context(title: "Backstory", image: UIImage(named: "walt-disney")!, text: "Mickey Mouse was created by Walt Disney. Walt Disney got the inspiration for Mickey Mouse from a tame mouse at his desk at Laugh-O-Gram Studio in Kansas City, Missouri. In 1925, Hugh Harman drew some sketches of mice around a photograph of Walt Disney. These inspired Ub Iwerks to create a new mouse character for Disney.")
    let relationship = Context(title: "Relationship", image: UIImage(named: "mickey-minnie")!, text: "Mickey and Minnie first met in ‘Steamboat Willie’, wherein Minnie was a struggling musician trying to hitch a ride on the steamboat that Mickey was working on. They instantly hit it off when Mickey attempted to cheer Minnie up after a goat ate her music, followed by her guitar. Though they were never technically married, in 1933, Walt Disney released the statement that “In private life, Mickey is married to Minnie.")
    let fact = Context(title: "Fun Fact", image: UIImage(named: "mickey-disney")!, text: "Mickey was the first cartoon character to ever speak. Mickey first spoke in 1929 in the short “The Karnival Kid” saying, “Hot dog! Hot dog!”. Walt and other staff members voiced Minnie in her early cartoons until the early 1930s, when her voice switched over to ink & paint artist Marcellite Garner. Walt voiced Mickey starting with “Steamboat Willie” in 1928 all the way through 1946.")
    
    var contexts: [Context] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contexts = [backstory, relationship, fact]
    }

    @IBAction func didTapLabel(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view {
            performSegue(withIdentifier: "detailSegue", sender: tappedView)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "detailSegue",
            let tappedView = sender as? UIView,
            let detailViewController = segue.destination as? DetailViewController {

            if tappedView.tag == 0 {
                detailViewController.context = contexts[0]
            } else if tappedView.tag == 1 {
                detailViewController.context = contexts[1]
            } else if tappedView.tag == 2 {
                detailViewController.context = contexts[2]
            } else {
                print("no label was tapped, please check your selection.")
            }
        }
    }
    
}

