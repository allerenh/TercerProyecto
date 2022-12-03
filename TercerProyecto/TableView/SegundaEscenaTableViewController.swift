//
//  SegundaEscenaTableViewController.swift
//  TercerProyecto
//
//  Created by Ana Isabel Llerena Huayta on 1/12/22.
//

import UIKit


// paso 1: crear la interface
protocol SegundaEscenaTableViewControllerDelegate {
//    func cualquierNombre(_ newPerson: Person)
    func segundaEscenaTableViewController(_ viewController: SegundaEscenaTableViewController, didCreatePerson newPerson: Person )
}


class SegundaEscenaTableViewController: UITableViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
   
    @IBOutlet weak var lastnameTextField: UITextField!
    
//  paso 2:  crear la propiedad
    
    var data: [String] = []
    var delegate: SegundaEscenaTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.placeholder = "Nombres"
        lastnameTextField.placeholder = "Apellidos"
        
    }

    @IBAction func closeButtonAction(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true)
        
    }
    // MARK: - Table view data source
    @IBAction func saveButtonAction(_ sender: UIBarButtonItem) {
        
        let name = nameTextField.text
        let lastname = lastnameTextField.text
        
//        asegura que el usuario haya ingresado algo y no un espacio en blanco
        guard let n = name, !n.isEmpty else { return }
        guard let l = lastname, !l.isEmpty else { return }
        
        let newPerson = Person(name: n, lastname: l)
        
//        paso 3: llamar al método del protocolo
        delegate?.segundaEscenaTableViewController(self, didCreatePerson: newPerson)
        
        dismiss(animated: true)
        
    }
    

}
