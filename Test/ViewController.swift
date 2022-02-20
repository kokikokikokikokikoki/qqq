//
//  ViewController.swift
//  Test
//
//  Created by Buratsakorn Petchdee on 18/2/2565 BE.
//

import UIKit


struct CoffeeModel: Codable{
    
    let title : String
    let description : String
    
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffee.count
        
    }
   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.title?.text = coffee[indexPath.row].title
        cell.labeldesc?.text = coffee[indexPath.row].description
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    

    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var TableView: UITableView!
    
    var coffee = [CoffeeModel]()
    var showdata = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       getCoffee()
        TableView.isHidden = true
        TableView.delegate = self
        TableView.dataSource = self
        self.TableView.reloadData()
    }
        @IBAction func buttonPress(_ sender: Any) {
           
            TableView.isHidden = false
        }
    
    func getCoffee(){
        var request = URLRequest(url: URL(string: "https://api.sampleapis.com/coffee/hot")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            
            
            do {
               guard let data = data else{
                  return
                }
                let decoder = JSONDecoder()
                let coffee = try decoder.decode([CoffeeModel].self, from: data)
                self.coffee = coffee
                print(coffee)
                
//                for mainarr in self.coffee{
//                    print(mainarr.title,": ",mainarr.description)
//                    //self.TableView.reloadData()
//                }
                
                DispatchQueue.main.async {
                    self.TableView.reloadData()
                }
            }
            catch {
                print("error")
            }
        })
       
        task.resume()
        
    }
    
}




