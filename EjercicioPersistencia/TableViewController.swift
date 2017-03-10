//
//  TableViewController.swift
//  EjercicioPersistencia
//
//  Created by Miguel Cuellar on 3/9/17.
//  Copyright © 2017 Miguel Cuellar. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var arrDatosNuevo = NSDictionary()
    var listaArticulos : NSMutableArray!
    var index = Int()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        listaArticulos = NSArray(contentsOfFile: path!) as! NSMutableArray!
        if listaArticulos == nil{
            listaArticulos = NSMutableArray()
        }else{

        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaArticulos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaArticulos", for: indexPath)
        let lista = listaArticulos[indexPath.row] as? NSDictionary
        cell.textLabel?.text = lista?.value(forKey: "id") as? String
        cell.detailTextLabel?.text = lista?.value(forKey: "descripcion") as! String?
        // Configure the cell...

        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let viewDetalle = segue.destination as! ViewController
        
        if segue.identifier == "ver" {
            index = (tableView.indexPathForSelectedRow?.row)!
            let lista = listaArticulos[index] as? NSDictionary
                        viewDetalle.valores = lista!
            viewDetalle.status = "ver"
            viewDetalle.apuntador = self
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }else{
            viewDetalle.status = "agregar"
            viewDetalle.apuntador = self
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
           
        }
        
        
    }
    
    func agrega(arrDato : NSMutableDictionary){
        listaArticulos.add(arrDato)
        tableView.reloadData()
    }
    
    func modifica(arrDato :NSMutableDictionary){
        listaArticulos.replaceObject(at: index, with: arrDato)
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        

        listaArticulos.write(toFile: path!, atomically: true)
        
        
    }
    

}
