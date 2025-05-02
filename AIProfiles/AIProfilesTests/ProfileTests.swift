//
//  ProfileTests.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 24.04.2025.
//

import XCTest
@testable import AIProfiles

class ProfileTests: XCTestCase {
    
    // MARK: - PreferenceParameterType Encoding/Decoding Tests
    
    func testBooleanParameter_EncodeDecode() {
        let originalParam = BooleanParameter(id: "bool1", title: "Test Boolean", value: true)
        let preferenceType: PreferenceParameterType = .boolean(originalParam)
        
        let encoder = JSONEncoder()
        let data = try! encoder.encode(preferenceType)
        
        let decoder = JSONDecoder()
        let decodedPreferenceType = try! decoder.decode(PreferenceParameterType.self, from: data)
        
        switch decodedPreferenceType {
        case .boolean(let decodedParam):
            XCTAssertEqual(decodedParam.id, originalParam.id)
            XCTAssertEqual(decodedParam.title, originalParam.title)
            XCTAssertEqual(decodedParam.value, originalParam.value)
            XCTAssertEqual(decodedParam.type, .boolean)
        default:
            XCTFail("Decoded preference type is not boolean")
        }
    }
    
    func testSingleChoiceParameter_EncodeDecode() {
        let originalParam = SingleChoiceParameter(id: "single1", title: "Test Single", options: ["A", "B"], selectedOption: "A")
        let preferenceType: PreferenceParameterType = .singleChoice(originalParam)
        
        let encoder = JSONEncoder()
        let data = try! encoder.encode(preferenceType)
        
        let decoder = JSONDecoder()
        let decodedPreferenceType = try! decoder.decode(PreferenceParameterType.self, from: data)
        
        switch decodedPreferenceType {
        case .singleChoice(let decodedParam):
            XCTAssertEqual(decodedParam.id, originalParam.id)
            XCTAssertEqual(decodedParam.title, originalParam.title)
            XCTAssertEqual(decodedParam.options, originalParam.options)
            XCTAssertEqual(decodedParam.selectedOption, originalParam.selectedOption)
            XCTAssertEqual(decodedParam.type, .singleChoice)
        default:
            XCTFail("Decoded preference type is not singleChoice")
        }
    }
    
    func testMultipleChoiceParameter_EncodeDecode() {
        let originalParam = MultipleChoiceParameter(id: "multi1", title: "Test Multiple", options: ["X", "Y"], selectedOptions: ["X"])
        let preferenceType: PreferenceParameterType = .multipleChoice(originalParam)
        
        let encoder = JSONEncoder()
        let data = try! encoder.encode(preferenceType)
        
        let decoder = JSONDecoder()
        let decodedPreferenceType = try! decoder.decode(PreferenceParameterType.self, from: data)
        
        switch decodedPreferenceType {
        case .multipleChoice(let decodedParam):
            XCTAssertEqual(decodedParam.id, originalParam.id)
            XCTAssertEqual(decodedParam.title, originalParam.title)
            XCTAssertEqual(decodedParam.options, originalParam.options)
            XCTAssertEqual(decodedParam.selectedOptions, originalParam.selectedOptions)
            XCTAssertEqual(decodedParam.type, .multipleChoice)
        default:
            XCTFail("Decoded preference type is not multipleChoice")
        }
    }
    
    func testRangeParameter_EncodeDecode() {
        let originalParam = RangeParameter(id: "range1", title: "Test Range", min: 1, max: 10, currentValue: 5)
        let preferenceType: PreferenceParameterType = .range(originalParam)
        
        let encoder = JSONEncoder()
        let data = try! encoder.encode(preferenceType)
        
        let decoder = JSONDecoder()
        let decodedPreferenceType = try! decoder.decode(PreferenceParameterType.self, from: data)
        
        switch decodedPreferenceType {
        case .range(let decodedParam):
            XCTAssertEqual(decodedParam.id, originalParam.id)
            XCTAssertEqual(decodedParam.title, originalParam.title)
            XCTAssertEqual(decodedParam.min, originalParam.min)
            XCTAssertEqual(decodedParam.max, originalParam.max)
            XCTAssertEqual(decodedParam.currentValue, originalParam.currentValue)
            XCTAssertEqual(decodedParam.type, .range)
        default:
            XCTFail("Decoded preference type is not range")
        }
    }
    
    func testTextParameter_EncodeDecode() {
        let originalParam = TextParameter(id: "text1", title: "Test Text", value: "Hello")
        let preferenceType: PreferenceParameterType = .text(originalParam)
        
        let encoder = JSONEncoder()
        let data = try! encoder.encode(preferenceType)
        
        let decoder = JSONDecoder()
        let decodedPreferenceType = try! decoder.decode(PreferenceParameterType.self, from: data)
        
        switch decodedPreferenceType {
        case .text(let decodedParam):
            XCTAssertEqual(decodedParam.id, originalParam.id)
            XCTAssertEqual(decodedParam.title, originalParam.title)
            XCTAssertEqual(decodedParam.value, originalParam.value)
            XCTAssertEqual(decodedParam.type, .text)
        default:
            XCTFail("Decoded preference type is not text")
        }
    }
    
    // MARK: - Profile Encoding/Decoding Test
    
    func testProfile_EncodeDecode() {
        let boolParam = BooleanParameter(id: "bool1", title: "Bool", value: true)
        let singleParam = SingleChoiceParameter(id: "single1", title: "Single", options: ["A", "B"], selectedOption: "A")
        let profileID = UUID()
        let createdAt = Date()
        let originalProfile = Profile(id: profileID, title: "Test Profile", purpose: "Testing", parameters: [.boolean(boolParam), .singleChoice(singleParam)], createdAt: createdAt)
        
        let encoder = JSONEncoder()
        let data = try! encoder.encode(originalProfile)
        
        let decoder = JSONDecoder()
        let decodedProfile = try! decoder.decode(Profile.self, from: data)
        
        XCTAssertEqual(decodedProfile.id, profileID)
        XCTAssertEqual(decodedProfile.title, originalProfile.title)
        XCTAssertEqual(decodedProfile.purpose, originalProfile.purpose)
        XCTAssertEqual(decodedProfile.createdAt, createdAt)
        
        XCTAssertEqual(decodedProfile.parameters.count, 2)
        
        for (original, decoded) in zip(originalProfile.parameters, decodedProfile.parameters) {
            switch (original, decoded) {
            case (.boolean(let o), .boolean(let d)):
                XCTAssertEqual(o.id, d.id)
                XCTAssertEqual(o.title, d.title)
                XCTAssertEqual(o.value, d.value)
            case (.singleChoice(let o), .singleChoice(let d)):
                XCTAssertEqual(o.id, d.id)
                XCTAssertEqual(o.title, d.title)
                XCTAssertEqual(o.options, d.options)
                XCTAssertEqual(o.selectedOption, d.selectedOption)
            default:
                XCTFail("Parameter types do not match")
            }
        }
    }
    
    // MARK: - Profile Parameter Retrieval Tests
    
    func testProfile_ParameterRetrieval() {
        let boolParam = BooleanParameter(id: "param1", title: "Bool", value: true)
        let textParam = TextParameter(id: "param1", title: "Text", value: "Hello")
        let profile = Profile(id: UUID(), title: "Test", purpose: "Test", parameters: [.boolean(boolParam), .text(textParam)], createdAt: Date())
        
        let retrievedBool: BooleanParameter? = profile.parameter(ofType: BooleanParameter.self, withID: "param1")
        XCTAssertNotNil(retrievedBool)
        XCTAssertEqual(retrievedBool?.value, true)
        
        let retrievedText: TextParameter? = profile.parameter(ofType: TextParameter.self, withID: "param1")
        XCTAssertNotNil(retrievedText)
        XCTAssertEqual(retrievedText?.value, "Hello")
        
        let wrongType: TextParameter? = profile.parameter(ofType: TextParameter.self, withID: "param2")
        XCTAssertNil(wrongType)
        
        let nonExistent: BooleanParameter? = profile.parameter(ofType: BooleanParameter.self, withID: "invalid")
        XCTAssertNil(nonExistent)
    }
    
    func testProfile_MultipleSameIDAndType() {
        let param1 = BooleanParameter(id: "sameID", title: "First", value: true)
        let param2 = BooleanParameter(id: "sameID", title: "Second", value: false)
        let profile = Profile(id: UUID(), title: "Test", purpose: "Test", parameters: [.boolean(param1), .boolean(param2)], createdAt: Date())
        
        let retrieved: BooleanParameter? = profile.parameter(ofType: BooleanParameter.self, withID: "sameID")
        XCTAssertEqual(retrieved?.title, "First")
    }
}
