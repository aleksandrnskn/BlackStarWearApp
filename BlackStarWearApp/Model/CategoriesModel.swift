//
//  CategoriesModel.swift
//  BlackStarWearApp
//
//  Created by Aleksandr Aniskin on 04.01.2022.
//

import Foundation

// MARK: - Category
struct CategoryModel: Codable {
    let name: String
    let sortOrder: SortOrder
    let image, iconImage, iconImageActive: String
    let subcategories: [SubcategoryModel]
}

// MARK: - Subcategory
struct SubcategoryModel: Codable {
    let id: SortOrder
    let iconImage: String
    let sortOrder: SortOrder
    let name: String
    let type: String
}

// MARK: - SortOrder
enum SortOrder: Codable, CustomStringConvertible, Comparable {
    case int(Int)
    case string(String)

    var description: String {
        switch self {
        case let .int(value):
            return String(value)
        case let .string(value):
            return value
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .int(let v): try container.encode(v)
        case .string(let v): try container.encode(v)
        }
    }

    init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer()
        do {
            self = .int(try value.decode(Int.self))
        } catch DecodingError.typeMismatch {
            self = .string(try value.decode(String.self))
        }
    }
}
