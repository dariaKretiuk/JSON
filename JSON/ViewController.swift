//
//  ViewController.swift
//  URLSessionStartProject
//
//  Created by Alexey Pavlov on 29.11.2021.
//

import UIKit

class ViewController: UIViewController {

    private let endpointClient = EndpointClient(applicationSettings: ApplicationSettingsService())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        executeCall()
    }
    
    func executeCall() {
        let endpoint = GetNameEndpoint()
        let completion: EndpointClient.ObjectEndpointCompletion<Cards> = { result, response in
            guard let responseUnwrapped = response else { return }

            print("\n\n response = \(responseUnwrapped.allHeaderFields) ;\n \(responseUnwrapped.statusCode) \n")
            switch result {
            case .success(let team):
                self.printCards(jsonCards: team)
//                print("team = \(team)")
                
            case .failure(let error):
                print(error)
            }
        }
        
        endpointClient.executeRequest(endpoint, completion: completion)
    }
    
    private func printCards(jsonCards: JSON.Cards) {
        for (index, card) in jsonCards.cards.enumerated() {
            print("""
                Информация о \(index + 1)й карте:
                        имя : \(card.name ?? "")
                        тип : \(card.type ?? "")
                   описание : \(card.text ?? "")
            стоимость карты : \(card.manaCost?.replacingOccurrences(of: "{", with: "").replacingOccurrences(of: "}", with: "") ?? "")
                 цвет карты : \(card.colors?.joined(separator: ", ") ?? "цвет отсутствует")\n
            """)
        }
    }
}

final class GetNameEndpoint: ObjectResponseEndpoint<Cards> {
    
    override var method: RESTClient.RequestType { return .get }
    override var path: String { "/v1/cards" }
//    override var queryItems: [URLQueryItem(name: "id", value: "1")]?
    
    override init() {
        super.init()

//        queryItems = [URLQueryItem(name: "name", value: "Black Lotus")]
        queryItems = [URLQueryItem(name: "name", value: "Opt")]
    }
    
}











func decodeJSONOld() {
    let str = """
        {\"team\": [\"ios\", \"android\", \"backend\"]}
    """
    
    let data = Data(str.utf8)

    do {
        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            if let names = json["cards"] as? [String] {
                print(names)
            }
        }
    } catch let error as NSError {
        print("Failed to load: \(error.localizedDescription)")
    }
}

