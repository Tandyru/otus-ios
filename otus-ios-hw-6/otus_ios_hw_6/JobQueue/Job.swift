//
//  Job.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 08.02.2025.
//

protocol Job {
    associatedtype Result
    var result: Result? { get }
    func execute() async
}
