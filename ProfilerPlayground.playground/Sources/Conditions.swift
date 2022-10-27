import Foundation

public struct ConditionResponse: Codable {
    public var data: [ConditionData]?
    public var status: String = "fail"
}

public struct ConditionData: Codable {
    public var id: String = ""
    public var name: String = ""
    public var altNames: ConditionNames
    //public var terms: [ConditionTerm]?
}

public struct ConditionNames: Codable {
    public var synonym: [String]?
}

public struct ConditionTerm: Codable {
    public var id: Int?
    public var _url: String?
    public var resource: String?
    public var term: String?
    public var termId: String?
}
