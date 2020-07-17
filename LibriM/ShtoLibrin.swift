//
//  ShtoLibrin.swift
//  LibriM
//
//  Created by Flutura Haxhaj on 7/15/20.
//  Copyright © 2020 Endrit Bajrami. All rights reserved.
//

import UIKit

class ShtoLibrin: UIViewController ,UITableViewDelegate,UITableViewDataSource,buttonDeleget{

    @IBOutlet weak var tblTableview: UITableView!
    var GetAllDataInfo = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        GetAllDataInfo = FMDBDatabaseModel.getInstance().GetAllData()
        tblTableview.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func EditButton(sender: InfoTableViewCell) {
        let cell = sender.tag
        var l = Tbl_Info()
        l = GetAllDataInfo.object(at: sender.tag) as! Tbl_Info
        let MainStoryboard:UIStoryboard = UIStoryboard(name: "ShtoLibrin", bundle: nil)
        let DV = MainStoryboard.instantiateViewController(withIdentifier: "EditDataViewController") as! EditDataViewController
        DV.getId = l.Id
        DV.getLibri = l.Libri
        DV.getAutori = l.Autori
        self.navigationController?.pushViewController(DV, animated: true)
        
    }
    func DeleteButton(sender: InfoTableViewCell) {
        let cell = sender.tag
        var l = Tbl_Info()
        l = GetAllDataInfo.object(at: sender.tag) as! Tbl_Info
        _ = FMDBDatabaseModel.getInstance().deleteRecode(RecoreId: l.Id)
        
        GetAllDataInfo = FMDBDatabaseModel.getInstance().GetAllData()
        tblTableview.reloadData()
    }
    
    @IBAction func btnInsertTapped(_ sender: Any) {
        
        let MainStoryboard:UIStoryboard = UIStoryboard(name: "ShtoLibrin",bundle: nil)
        
        let DV = MainStoryboard.instantiateViewController(withIdentifier:"InsertDataViewController") as! InsertDataViewController
        self.navigationController?.pushViewController(DV, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GetAllDataInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell") as! InfoTableViewCell
        cell.editData = self
        cell.tag = indexPath.row
        var l = Tbl_Info()
        l = GetAllDataInfo.object(at: indexPath.row) as! Tbl_Info
        cell.lblLibri.text! = l.Libri
        cell.lblAutori.text! = l.Autori
        
        
        return cell
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
