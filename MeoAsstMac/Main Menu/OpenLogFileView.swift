//
//  OpenLogFileView.swift
//  MAA
//
//  Created by hguandl on 18/4/2023.
//

import SwiftUI

struct OpenLogFileView: View {
    var body: some View {
        Button("查找日志…") {
            OpenLogFileView.revealLogInFinder()
        }

        Button("PlayCover 链接…") {
            NSWorkspace.shared.open(URL(string: "https://github.com/hguandl/PlayCover/releases")!)
        }
    }

    static func revealLogInFinder() {
        guard let userDirectory else {
            return
        }

        let url = userDirectory.appendingPathComponent("asst.log")

        if FileManager.default.fileExists(atPath: url.path) {
            NSWorkspace.shared.activateFileViewerSelecting([url])
        } else {
            NSWorkspace.shared.selectFile(nil, inFileViewerRootedAtPath: userDirectory.path)
        }
    }

    private static var userDirectory: URL? {
        FileManager
            .default
            .urls(for: .applicationSupportDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent("debug")
    }
}

struct OpenLogFileView_Previews: PreviewProvider {
    static var previews: some View {
        OpenLogFileView()
    }
}
