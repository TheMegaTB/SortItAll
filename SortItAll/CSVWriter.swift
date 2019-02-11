//
//  CSVWriter.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

enum CSVWriterError: Error {
    case failedToConvertToData
}

class CSVWriter {
    private(set) var columnNames: [String] = []
    private(set) var rowNames: [String] = []
    private(set) var data: [[Any]]

    var numberFormatter = NumberFormatter()
    var fieldSeparator: String = ";"
    var rowSeparator: String = "\n"
    var defaultRowNames = ""

    init(columnNames: [String], rowNames: [String], data: [[Any]]) {
        self.columnNames = columnNames
        self.rowNames = rowNames
        self.data = data
    }

    private func generateHeader() -> String? {
        guard columnNames.count > 0 else { return nil }

        let header = rowNames.count > 0 ? [""] + columnNames : columnNames

        return header.joined(separator: fieldSeparator)
    }

    private func stringifyValue(value: Any) -> String {
        return numberFormatter.string(for: value) ?? String(describing: value)
    }

    private func generateRow(index: Int) -> String {
        var rowFields = data[index].map(self.stringifyValue)

        // Check if row labels are enabled
        if rowNames.count > 0 {
            let rowName = index < rowNames.count ? rowNames[index] : defaultRowNames
            rowFields.insert(rowName, at: 0)
        }

        return rowFields.joined(separator: fieldSeparator)
    }

    func generate() -> String {
        var rows: [String] = []

        if let header = generateHeader() {
            rows.append(header)
        }

        rows.append(contentsOf: (0..<data.count).map({ generateRow(index: $0) }))

        return rows.joined(separator: rowSeparator)
    }

    func write(to location: URL, with encoding: String.Encoding = .utf8) throws {
        guard let data = generate().data(using: encoding) else { throw CSVWriterError.failedToConvertToData }
        try data.write(to: location)
    }
}
