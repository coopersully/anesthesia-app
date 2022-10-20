import Foundation

public struct ChemicalResponse: Codable {
    public var data: [ChemicalData]?
    public var status: String = "fail"
}

public struct ChemicalData: Codable {
    public var id: String = ""
    public var name: String = ""
    public var altNames: ChemicalNames
}

public struct ChemicalNames: Codable {
    public var generic: [String]?
    public  var trade: [String]?
}
