# error missing module or wrong module cache path
## full error
Building for debugging...
"terminal game"
error: emit-module
command failed with exit code 1 (use -v to see invocation)
<unknown>:0: error: PCH was compiled with module cache path '/Users/Miro/coding/terminal game/.build/arm64-apple-macosx/debug/ModuleCache/29QSELKVJTB9R', but the path is currently */Users/M iro/Downloads/terminal game/.build/arm64-apple-macosx/debug/ModuleCache/29QSELKVJTB9R'
unknown 0 error: Fains compired mod eue sche path /Users/Miro/coding/terminal game/ build/ara6-apple-macos/debug/hoduleCache/290SELKTBR', but the path is currently •/Users/N
iro/Downloads/terminal game/.bufld/arm64-apple-macosx/debug/ModuleCache/29QSELKVJTB9R'
<unknown>:0: error: missing required module

## fix
in the directory from the file you just downloaded probably called terminal game, (to go here lets assume its downloaded in the file downloads,  
type: cd downloads/"terminal game" then enter.  
then type: swift package clean  
and it should work.

### other fixes
other fixes might be:  

Delete the module cache to ensure Swift rebuilds it fresh:  
rm -rf ~/Library/Developer/Xcode/DerivedData  

rebuild it:  
swift build
