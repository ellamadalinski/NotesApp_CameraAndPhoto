//
//  ViewController.swift
//  NotesApp_CameraAndPhoto
//
//  Created by ELLA MADALINSKI on 10/28/21.
//

import UIKit

class ViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func photoAction(_ sender: UIButton) {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func cameraAction(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            present(imagePicker, animated: true, completion: nil)
        }
        else{
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true) {
            self.imageViewOutlet.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        }
    }
    
    
}

