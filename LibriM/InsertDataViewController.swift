//
//  InsertDataViewController.swift
//  LibriM
//
//  Created by Flutura Haxhaj on 7/15/20.
//  Copyright © 2020 Endrit Bajrami. All rights reserved.
//

import UIKit

class InsertDataViewController: UIViewController {
    @IBOutlet weak var txtLibri: UITextField!
    @IBOutlet weak var txtAutori: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnInsertDataTapped(_ sender: Any) {
        var FMDBInfo:Tbl_Info = Tbl_Info()
        FMDBInfo.Libri = txtLibri.text!
        FMDBInfo.Autori = txtAutori.text!
        
        
        let isInserted = FMDBDatabaseModel.getInstance().InsertData(FMDBInfo)
        if isInserted{
            Util.invokeAlertMethod(strTitle: "", strBody: "Insert data successfully", delegate: nil)
        }else
        {
            Util.invokeAlertMethod(strTitle: "", strBody: "Error in inserting record", delegate: nil)
        }
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
