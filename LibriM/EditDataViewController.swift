//
//  EditDataViewController.swift
//  LibriM
//
//  Created by Flutura Haxhaj on 7/15/20.
//  Copyright © 2020 Endrit Bajrami. All rights reserved.
//

import UIKit

class EditDataViewController: UIViewController {
    @IBOutlet weak var txtLibri: UITextField!
    @IBOutlet weak var txtAutori: UITextField!
    
    var getId:Int = Int()
    var getLibri = ""
    var getAutori = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        
        txtLibri.text! = getLibri
        txtAutori.text! = getAutori
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnUpdateTapped(_ sender: Any) {
        _ = FMDBDatabaseModel.getInstance().updateRecode(RecoreId: getId, Libri: txtLibri.text!,Autori: txtAutori.text!)
        Util.invokeAlertMethod(strTitle: "", strBody: "U ndryshua !!", delegate: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
