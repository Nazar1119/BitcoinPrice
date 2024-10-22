//
//  CryptoVC.swift
//  BTC_Prog
//
//  Created by Тимочко Назар on 22/10/2024.
//

import UIKit

class CryptoVC: UIViewController {
    
    let BTCImage    = UIImageView()
    let ETHImage    = UIImageView()
    let AUDImage    = UIImageView()
    let USDImage    = UIImageView()
    
    var BTCLabel    = UILabel()
    var ETHLabel    = UILabel()
    var AUDLabel    = UILabel()
    var USDLabel    = UILabel()
    
    var TimeLabel = UILabel()
    var NameLabel = UILabel()
    
    let positions = [-200, -80, 40, 160]
    
    let stringURL = "https://api.coingecko.com/api/v3/exchange_rates"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        configureNameLabel()
        configurePriceLabels()
        configureTimeLabel()
        fetchData()
        
        configureBTCImageView()
        configureETHImageView()
        configureAUDImageView()
        configureUSDImageView()

    }
    
    
    
    
    func configurePriceLabels(){
        
        BTCLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(BTCLabel)
        BTCLabel.textColor = .black
        NSLayoutConstraint.activate([
            BTCLabel.widthAnchor.constraint(equalToConstant: 100),
            BTCLabel.heightAnchor.constraint(equalToConstant: 30),
            BTCLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
            BTCLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(positions[0]))
        ])
        
        ETHLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ETHLabel)
        ETHLabel.textColor = .black
        NSLayoutConstraint.activate([
            ETHLabel.widthAnchor.constraint(equalToConstant: 200),
            ETHLabel.heightAnchor.constraint(equalToConstant: 30),
            ETHLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            ETHLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(positions[1]))
        ])
    
        
        AUDLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(AUDLabel)
        AUDLabel.textColor = .black
        NSLayoutConstraint.activate([
            AUDLabel.widthAnchor.constraint(equalToConstant: 200),
            AUDLabel.heightAnchor.constraint(equalToConstant: 30),
            AUDLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            AUDLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(positions[2]))
        ])
        
        
        USDLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(USDLabel)
        USDLabel.textColor = .black
        NSLayoutConstraint.activate([
            USDLabel.widthAnchor.constraint(equalToConstant: 200),
            USDLabel.heightAnchor.constraint(equalToConstant: 30),
            USDLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            USDLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(positions[3]))
        ])
    }
    
    
    func configureBTCImageView(){
        view.addSubview(BTCImage)
        BTCImage.translatesAutoresizingMaskIntoConstraints = false
        BTCImage.image = UIImage(named: "BTC")
        
        NSLayoutConstraint.activate([
            BTCImage.widthAnchor.constraint(equalToConstant: 70),
            BTCImage.heightAnchor.constraint(equalToConstant: 65),
            BTCImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -110),
            BTCImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(positions[0]))
        ])
    }

    
    func configureETHImageView(){
        view.addSubview(ETHImage)
        ETHImage.translatesAutoresizingMaskIntoConstraints = false
        ETHImage.image = UIImage(named: "ETH")
        
        NSLayoutConstraint.activate([
            ETHImage.widthAnchor.constraint(equalToConstant: 40),
            ETHImage.heightAnchor.constraint(equalToConstant: 65),
            ETHImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -110),
            ETHImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(positions[1]))
        ])
    }
    
    func configureAUDImageView(){
        view.addSubview(AUDImage)
        AUDImage.translatesAutoresizingMaskIntoConstraints = false
        AUDImage.image = UIImage(named: "AUD")
        
        NSLayoutConstraint.activate([
            AUDImage.widthAnchor.constraint(equalToConstant: 90),
            AUDImage.heightAnchor.constraint(equalToConstant: 50),
            AUDImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -110),
            AUDImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(positions[2]))
        ])
    }

    
    func configureUSDImageView(){
        view.addSubview(USDImage)
        USDImage.translatesAutoresizingMaskIntoConstraints = false
        USDImage.image = UIImage(named: "USD")
        
        NSLayoutConstraint.activate([
            USDImage.widthAnchor.constraint(equalToConstant: 90),
            USDImage.heightAnchor.constraint(equalToConstant: 50),
            USDImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -110),
            USDImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(positions[3]))
        ])
    }

    
    func configureNameLabel(){
        view.addSubview(NameLabel)
        NameLabel.translatesAutoresizingMaskIntoConstraints = false
        NameLabel.text = "CRYptan"
        NameLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        NameLabel.textColor = .black
        
        NSLayoutConstraint.activate([
            NameLabel.widthAnchor.constraint(equalToConstant: 160),
            NameLabel.heightAnchor.constraint(equalToConstant: 50),
            NameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            NameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
        ])
    }
    
    
    func configureTimeLabel(){
        view.addSubview(TimeLabel)
        TimeLabel.translatesAutoresizingMaskIntoConstraints = false
        TimeLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        TimeLabel.textColor = .black
        
        NSLayoutConstraint.activate([
           TimeLabel.widthAnchor.constraint(equalToConstant: 200),
           TimeLabel.heightAnchor.constraint(equalToConstant: 30),
           TimeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 25),
           TimeLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 250),
        ])
    }
    
    
    func fetchData(){
        if let url = URL(string: stringURL){
            let defaultSession = URLSession(configuration: .default)
            let dataTask = defaultSession.dataTask(with: url) { [self](data: Data?, response: URLResponse?, error: Error!) in
                if let error = error{
                    print("Error here \(error)")
                    return
                }
                
                guard let data = data else{
                    print("No data received")
                    return
                }
                
                do{
                    let json = try JSONDecoder().decode(Rates.self, from: data)
                    print("Decoded file \(json)")
                    SetPrices(currency :  json.rates)
                } catch let error as DecodingError {
                    switch error {
                    case .typeMismatch(let type, let context):
                        print("Type mismatch for type \(type) in \(context.debugDescription)")
                    case .valueNotFound(let type, let context):
                        print("Value not found for type \(type) in \(context.debugDescription)")
                    case .keyNotFound(let key, let context):
                        print("Key '\(key)' not found: \(context.debugDescription)")
                    case .dataCorrupted(let context):
                        print("Data corrupted: \(context.debugDescription)")
                    default:
                        print("Decoding error: \(error.localizedDescription)")
                    }
                } catch {
                    print("Other error: \(error.localizedDescription)")
                }
            }
            dataTask.resume()
        } else{
            print("Invalide URL adress")
        }
    }


    func SetPrices(currency : Currency){
        DispatchQueue.main.async {
            self.BTCLabel.text = self.formatPrices(currency.btc)
            self.BTCLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
            
            self.ETHLabel.text = self.formatPrices(currency.eth)
            self.ETHLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)

            self.AUDLabel.text = self.formatPrices(currency.aud)
            self.AUDLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)

            self.USDLabel.text = self.formatPrices(currency.usd)
            self.USDLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)

            self.TimeLabel.text = self.formatDate(date: Date())
        }
    }
    
    
    func formatPrices(_ price : Price) -> String{
        return String(format: "%@ %.2f", price.unit, price.value)
    }
    
    func formatDate(date : Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM y HH:mm:ss"
        return formatter.string(from: date)
    }
    
    
    struct Rates:Codable{
        let rates:Currency
    }
    
    struct Currency:Codable{
        let btc : Price
        let eth : Price
        let aud : Price
        let usd : Price
    }
    
    struct Price:Codable{
        let name : String
        let unit : String
        let value : Float
        let type : String
    }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
