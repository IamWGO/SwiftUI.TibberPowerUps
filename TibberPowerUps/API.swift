// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class PowerUpQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query powerUpQuery {
      assignmentData {
        __typename
        title
        description
        longDescription
        connected
        storeUrl
        imageUrl
      }
    }
    """

  public let operationName: String = "powerUpQuery"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("assignmentData", type: .list(.nonNull(.object(AssignmentDatum.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(assignmentData: [AssignmentDatum]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "assignmentData": assignmentData.flatMap { (value: [AssignmentDatum]) -> [ResultMap] in value.map { (value: AssignmentDatum) -> ResultMap in value.resultMap } }])
    }

    public var assignmentData: [AssignmentDatum]? {
      get {
        return (resultMap["assignmentData"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [AssignmentDatum] in value.map { (value: ResultMap) -> AssignmentDatum in AssignmentDatum(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [AssignmentDatum]) -> [ResultMap] in value.map { (value: AssignmentDatum) -> ResultMap in value.resultMap } }, forKey: "assignmentData")
      }
    }

    public struct AssignmentDatum: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AssignmentPowerUpType"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("longDescription", type: .nonNull(.scalar(String.self))),
          GraphQLField("connected", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("storeUrl", type: .nonNull(.scalar(String.self))),
          GraphQLField("imageUrl", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: String, description: String, longDescription: String, connected: Bool, storeUrl: String, imageUrl: String) {
        self.init(unsafeResultMap: ["__typename": "AssignmentPowerUpType", "title": title, "description": description, "longDescription": longDescription, "connected": connected, "storeUrl": storeUrl, "imageUrl": imageUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var longDescription: String {
        get {
          return resultMap["longDescription"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "longDescription")
        }
      }

      public var connected: Bool {
        get {
          return resultMap["connected"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "connected")
        }
      }

      public var storeUrl: String {
        get {
          return resultMap["storeUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "storeUrl")
        }
      }

      public var imageUrl: String {
        get {
          return resultMap["imageUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "imageUrl")
        }
      }
    }
  }
}
