'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const VSCodeUI_1 = require("./VSCodeUI");
const CompileRun_1 = require("./CompileRun");
const Constants_1 = require("./Constants");
const vscode_1 = require("vscode");
function activate(context) {
    const compileRun = new CompileRun_1.CompileRun();
    let CompileRunCommand = vscode_1.commands.registerCommand('extension.CompileRun', () => {
        compileRun.compileRun(Constants_1.Constants.Action.CompileRun);
    });
    let CompileCommand = vscode_1.commands.registerCommand('extension.Compile', () => {
        compileRun.compileRun(Constants_1.Constants.Action.Compile);
    });
    let RunCommand = vscode_1.commands.registerCommand('extension.Run', () => {
        compileRun.compileRun(Constants_1.Constants.Action.Run);
    });
    let CompileWithFlagsCommand = vscode_1.commands.registerCommand('extension.CompileWithFlags', () => {
        compileRun.compileRun(Constants_1.Constants.Action.CompileWithFlags);
    });
    let RunWithArgumentsCommand = vscode_1.commands.registerCommand('extension.RunWithArguments', () => {
        compileRun.compileRun(Constants_1.Constants.Action.RunWithArguments);
    });
    context.subscriptions.push(CompileRunCommand);
    context.subscriptions.push(CompileCommand);
    context.subscriptions.push(RunCommand);
    context.subscriptions.push(CompileWithFlagsCommand);
    context.subscriptions.push(RunWithArgumentsCommand);
    context.subscriptions.push(vscode_1.window.onDidCloseTerminal((closedTerminal) => {
        VSCodeUI_1.VSCodeUI.compileRunTerminal.onDidCloseTerminal(closedTerminal);
    }));
}
exports.activate = activate;
function deactivate() {
}
exports.deactivate = deactivate;
//# sourceMappingURL=extension.js.map