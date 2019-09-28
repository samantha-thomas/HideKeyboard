//
//  ViewController.swift
//  HideKeyboard
//
//  Created by Samantha Thomas on 9/27/19.
//  Copyright © 2019 Samantha Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    //Outlets.
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var txtFirst: UITextField!
    @IBOutlet weak var txtLast: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var btnBack: UIButton!
    
    //Actions.
    @IBAction func btnBack(_ sender: UIButton)
    {
        //Taken from code steps when following along with the instructions video.
        
        //hide keyboard
        DismissKeyboard()
        
        //declare CGPoint scrollPoint
        var scrollPoint:CGPoint
        
        //X = from Left, Y = from Top
        //get X = 0, Y = location of btnBack Y
        scrollPoint = CGPoint(x: 0, y: btnBack.frame.origin.y)
        
        //Set ScrollPoint and Go to animated
        ScrollView.setContentOffset(scrollPoint, animated: true)
    }
    
    @IBAction func bntSave(_ sender: UIButton)
    {
        //Taken from code steps when following along with the instructions video.
        
        //hide keyboard
        DismissKeyboard()
        
        //validation that all fields are entered
        if (txtFirst.text=="" || txtLast.text=="" || txtEmail.text=="")
        {
            //Call MessageBox if any fields are empty
            MsgBox("All fields required, please correct")
        }
        else
        {
            
            //Check if txtView (UITextView) is empty
            if (txtView.text=="")
            {
                //if empty then add text and newline
                txtView.text = "MyContacts \n"
            }
            //format text
            
            //existing contents of txtView, newline, txtFirst, newline, txtLast, newline, txtEmail, newline
            txtView.text = "\(txtView.text!) \n\(txtFirst.text!) \n\(txtLast.text!) \n\(txtEmail.text!)\n"
            //clear textboxes
            txtFirst.text = ""
            txtLast.text = ""
            txtEmail.text = ""
            //load scrollview
            
            //declare CGPoint scrollPoint
            
            var scrollPoint:CGPoint
            
            //X = from Left, Y = from Top
            //get X = 0, Y = location of btnBack Y
            scrollPoint = CGPoint(x:0, y:btnBack.frame.origin.y)
            //Set ScrollPoint and Go to animated
            ScrollView.setContentOffset(scrollPoint, animated: true)
            
        }
    }
    
    //Lines 88 to 177 are taken from code steps when following along with the instructions video.
    @IBAction func bntBack(_ sender: UIButton)
    {
        //Set ScrollPoint and Go to ZERO location (Top) of ScrollView - animated
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        //set txtFirst as firstresponder
        txtFirst.becomeFirstResponder()
    }
    
    func MsgBox(_ message:String)
    {
        //Create Alert
        let alert = UIAlertView()
        alert.title = "Alert"
        alert.message = message
        alert.addButton(withTitle: "OK")
        alert.show()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        //forces resign first responder and hides keyboard
        txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtEmail.endEditing(true)
    }
    
    @objc func DismissKeyboard()
    {
        //forces resign first responder and hides keyboard
        txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtEmail.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true;
    }
    
    func textFieldDidBeginEditing(_ textField:UITextField)
    {
        var scrollPoint:CGPoint
        scrollPoint = CGPoint(x:0, y:textField.frame.origin.y)
        ScrollView.setContentOffset(scrollPoint, animated: true)
    }
    
    func textFieldDidEndEditing(_ textField:UITextField)
    {
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    func textViewDidBeginEditing(_ textField:UITextView)
    {
        var scrollPoint:CGPoint
        scrollPoint = CGPoint(x:0, y:textField.frame.origin.y)
        
        ScrollView.setContentOffset(scrollPoint, animated: true)
    }
    
    func textViewDidEndEditing(_ textField:UITextView)
    {
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Looks for single or multiple taps
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.DismissKeyboard))
        
        //Adds tap gesture to ScrollView which will call DismissKeyboard and hide keyboard
        ScrollView.addGestureRecognizer(tap)
        
        //gets ScreenSize of current device
        let size: CGRect = UIScreen.main.bounds
        
        //Go to left  = 0 pixels, top = 50 pixels, width or device in pixels, height of device in pixels
        ScrollView.frame = CGRect(x:0, y:50, width:size.width, height:size.height)
        
        //Set focus on txtFirst
        txtFirst.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

