import Foundation

public struct ConditionResponse: Codable {
    public var data: [ConditionData]?
    public var status: String = "fail"
}

public struct ConditionData: Codable {
    public var id: String = ""
    public var name: String = ""
    public var altNames: ConditionNames
}

public struct ConditionNames: Codable {
    public var synonym: [String]?
}
