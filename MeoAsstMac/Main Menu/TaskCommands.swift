//
//  TaskCommands.swift
//  MAA
//
//  Created by hguandl on 30/4/2023.
//

import SwiftUI

struct TaskCommands: Commands {
    @ObservedObject var viewModel: MAAViewModel

    var body: some Commands {
        CommandMenu(NSLocalizedString("任务", comment: "")) {
            TaskButtons(viewModel: viewModel)
        }
    }
}
