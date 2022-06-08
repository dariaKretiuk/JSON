import Foundation

struct Cards: Decodable {
    var cards: [Card]
}

struct Card: Decodable {

    // MARK: - Elements

    let name: String?
    let layout: String?
    let cmc: Int?
    let colors: [String]?
    let colorIdentity: [String]?
    let type: String?
    let supertypes: [String]?
    let types: [String]?
    let subtypes: [String]?
    let rarity: String?
    let set: String?
    let setName: String?
    let text: String?
    let flavor: String?
    let artist: String?
    let number: String?
    let power: String?
    let toughness: String?
    let loyalty: String?
    let language: String?
    let gameFormat: String?
    let legality: String?
    let page: Int?
    let pageSize: Int?
    let orderBy: String?
    let random: Int?
    let contains: [String]?
    let id: String?
    let multiverseid: String?
    let names: [String]?
    let manaCost: String?
    let variations: [String]?
    let imageUrl: String?
    let watermark: String? // ?
    let border: String?
    let timeshifted: String?
    let hand: Int?
    let life: String?
    let reserved: String?
    let releaseDate: String?
    let starter: String?
    let rulings: [Rulings]?
    let foreignNames: [ForeignNames]?
    let printings: [String]?
    let originalText: String?
    let originalType: String?
    let legalities: [Legalities]?
    let source: String?
}

struct Rulings: Decodable {
    let date: String
    let text: String
}

struct ForeignNames: Decodable {
    let name: String?
    let text: String?
    let type: String?
    let flavor: String?
    let language: String?
    let multiverseid: Int?
}

struct Legalities: Decodable {
    let format: String
    let legality: String
}
