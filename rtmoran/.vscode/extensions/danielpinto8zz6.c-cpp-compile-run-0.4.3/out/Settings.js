'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
var Settings;
(function (Settings) {
    let key;
    (function (key) {
        key["cCompiler"] = "c-compiler";
        key["cFlags"] = "c-flags";
        key["cppCompiler"] = "cpp-compiler";
        key["cppFlags"] = "cpp-flags";
        key["saveBeforeCompile"] = "save-before-compile";
        key["runArgs"] = "run-args";
        key["runInExternalTerminal"] = "run-in-external-terminal";
    })(key = Settings.key || (Settings.key = {}));
    function getSetting(name) {
        return vscode_1.workspace.getConfiguration("c-cpp-compile-run", null).get(name);
    }
    Settings.cCompiler = () => getSetting(key.cCompiler);
    Settings.cFlags = () => getSetting(key.cFlags);
    Settings.cppCompiler = () => getSetting(key.cppCompiler);
    Settings.cppFlags = () => getSetting(key.cppFlags);
    Settings.saveBeforeCompile = () => getSetting(key.saveBeforeCompile);
    Settings.runArgs = () => getSetting(key.runArgs);
    Settings.runInExternalTerminal = () => getSetting(key.runInExternalTerminal);
})(Settings = exports.Settings || (exports.Settings = {}));
//# sourceMappingURL=Settings.js.map