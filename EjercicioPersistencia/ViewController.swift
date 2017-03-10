//
//  ViewController.swift
//  EjercicioPersistencia
//
//  Created by Miguel Cuellar on 3/9/17.
//  Copyright © 2017 Miguel Cuellar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arrDatos : NSMutableDictionary!

    @IBOutlet weak var tfExistencia: UITextField!

    @IBOutlet weak var tfDescripcion: UITextField!
    @IBOutlet weak var tfID: UITextField!
    var status : String!
    var valores = NSDictionary()
    var apuntador = TableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if status == "ver" {
            tfExistencia.text = valores.value(forKey: "exis") as! String?
            tfDescripcion.text = valores.value(forKey: "descripcion") as! String?
            tfID.text = valores.value(forKey: "id") as! String?
        }else{
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func PressedGuardar(_ sender: Any) {
        arrDatos = NSMutableDictionary()
        arrDatos.setValue(tfExistencia.text!, forKey: "exis")
        arrDatos.setValue(tfDescripcion.text!, forKey: "descripcion")
        arrDatos.setValue(tfID.text!, forKey: "id")
        if status == "ver" {
                apuntador.modifica(arrDato: arrDatos)
            _ = self.navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)

        }else{
            apuntador.agrega(arrDato: arrDatos)
             _ = self.navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)

        }
    }
    


}

