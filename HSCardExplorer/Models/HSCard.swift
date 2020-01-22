//
//  HSCard.swift
//  Redux
//
//  Created by Erik Tollefsrud on 12/31/19.
//  Copyright © 2019 Erik Tollefsrud. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let hSCard = try? newJSONDecoder().decode(HSCard.self, from: jsonData)

import Foundation

// MARK: - HSCardElement
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let hSCards = try? newJSONDecoder().decode(HSCards.self, from: jsonData)

import Foundation

// MARK: - HSCard
struct HSCard: Codable {
    let artist: String?
    let cardClass: Class
    let collectible: Bool
    let cost: Int?
    let dbfId: Int
    let flavor: String?
    let id, name: String
    let rarity: Rarity
    let hsCardSet: HSSet?
    let text: String?
    let type: TypeEnum
    let mechanics: [String]?
    let attack, health: Int?
    let referencedTags: [String]?
    let race: Race?
    let elite: Bool?
    let targetingArrowText: String?
    let durability, overload, spellDamage, techLevel: Int?
    let armor: Int?
    let faction: Faction?
    let howToEarn, howToEarnGolden, collectionText: String?
    let classes: [Class]?
    let multiClassGroup: String?
    let hideStats: Bool?
    let questReward: String?

    enum CodingKeys: String, CodingKey {
        case artist, cardClass, collectible, cost, dbfId, flavor, id, name, rarity
        case hsCardSet = "set"
        case text, type, mechanics, attack, health, referencedTags, race, elite, targetingArrowText, durability, overload, spellDamage, techLevel, armor, faction, howToEarn, howToEarnGolden, collectionText, classes, multiClassGroup, hideStats, questReward
    }
}

extension HSCard: Hashable {
    
    static func ==(lhs: HSCard, rhs: HSCard) -> Bool {
        return lhs.dbfId == rhs.dbfId && lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(dbfId)
        hasher.combine(id)
    }
}

enum Class: String, Codable {
    case druid = "DRUID"
    case hunter = "HUNTER"
    case mage = "MAGE"
    case neutral = "NEUTRAL"
    case paladin = "PALADIN"
    case priest = "PRIEST"
    case rogue = "ROGUE"
    case shaman = "SHAMAN"
    case warlock = "WARLOCK"
    case warrior = "WARRIOR"
}

enum Faction: String, Codable {
    case alliance = "ALLIANCE"
    case horde = "HORDE"
}

enum HSSet: String, Codable {
    case boomsday = "BOOMSDAY"
    case brm = "BRM"
    case core = "CORE"
    case dalaran = "DALARAN"
    case dragons = "DRAGONS"
    case expert1 = "EXPERT1"
    case gangs = "GANGS"
    case gilneas = "GILNEAS"
    case gvg = "GVG"
    case heroSkins = "HERO_SKINS"
    case hof = "HOF"
    case icecrown = "ICECROWN"
    case kara = "KARA"
    case loe = "LOE"
    case lootapalooza = "LOOTAPALOOZA"
    case naxx = "NAXX"
    case og = "OG"
    case tgt = "TGT"
    case troll = "TROLL"
    case uldum = "ULDUM"
    case ungoro = "UNGORO"
    case yearOfTheDragon = "YEAR_OF_THE_DRAGON"
}

enum Race: String, Codable {
    case all = "ALL"
    case beast = "BEAST"
    case demon = "DEMON"
    case dragon = "DRAGON"
    case elemental = "ELEMENTAL"
    case mechanical = "MECHANICAL"
    case murloc = "MURLOC"
    case pirate = "PIRATE"
    case totem = "TOTEM"
}

enum Rarity: String, Codable {
    case common = "COMMON"
    case epic = "EPIC"
    case free = "FREE"
    case legendary = "LEGENDARY"
    case rare = "RARE"
}

enum TypeEnum: String, Codable {
    case hero = "HERO"
    case minion = "MINION"
    case spell = "SPELL"
    case weapon = "WEAPON"
}

typealias HSCards = [HSCard]
