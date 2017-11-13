
compctl -g "*.hxml" haxe

_haxe_dce_modes=(
    'std'
    'full'
    'no'
)

__haxe_complete() {

    typeset -a arguments

    arguments+=(
        -cp'[add a directory to find source files]'
        -js'[compile code to JavaScript file]'
        -lua'[compile code to Lua file]'
        -swf'[compile code to Flash SWF file]'
        -as3'[generate AS3 code into target directory]'
        -neko'[compile code to Neko Binary]'
        -php'[generate PHP code into target directory]'
        -cpp'[generate C++ code into target directory]'
        -cppia'[generate Cppia code into target file]'
        -cs'[generate C# code into target directory]'
        -java'[generate Java code into target directory]'
        -python'[generate Python code as target file]'
        -hl'[compile HL code as target file]'
        -xml'[generate XML types description]'
        -main'[select startup class]'
        -main'[select startup class]'
        -lib'[use a haxelib library]'
        -D'[define a conditional compilation flag]'
        -v'[turn on verbose mode]'
        -v'[turn on verbose mode]'
        -debug'[add debug information to the compiled code]'
        -dce'[set the dead code elimination mode (default std)]:TYPES:_values -s "," "Printable info" "$_haxe_dce_modes[@]"'
        -swf-version'[change the SWF version]'
        -swf-header'[define SWF header (width:height:fps:color)]'
        -swf-lib'[add the SWF library to the compiled SWF]'
        -swf-lib-extern'[use the SWF library for type checking]'
        -java-lib'[add an external JAR or class directory library]'
        -net-lib'[add an external .NET DLL file]'
        -net-std'[add a root std .NET DLL search path]'
        -c-arg'[pass option <arg> to the native Java/C# compiler]'
        -x'[shortcut for compiling and executing a neko file]'
        -resource'[add a named resource file]'
        -prompt'[prompt on error]'
        -cmd'[run the specified command after successful compilation]'
        --flash-strict'[more type strict flash API]'
        --no-traces'[dont compile trace calls in the program]'
        --gen-hx-classes'[generate hx headers for all input classes]'
        --next'[separate several haxe compilations]'
        --each'[append preceding parameters to all haxe compilations separated by --next]'
        --display'[display code tips]'
        --no-output'[compiles but does not generate any file]'
        --times'[measure compilation times]'
        --no-inline'[disable inlining]'
        --no-opt'[disable code optimizations]'
        --remap'[remap a package to another one]'
        --interp'[interpret the program using internal macro system]'
        --macro '[call the given macro before typing anything else]'
        --wait'[wait on the given port (or use standard i/o) for commands to run)]'
        --connect'[connect on the given port and run commands there)]'
        --cwd'[set current working directory]'
        -version'[print version and exit]'
        --help-defines'[print help for all compiler specific defines]'
        --help-metas'[print help for all compiler metadatas]'
        {-help,--help}'[Display this list of options]'
    )

    #_values 'haxe params' ${commands[@]}
    #compadd -- `__haxelib_list`

#    if (( CURRENT == 2 )); then
#        _values 'haxe params' ${arguments[@]}
#        return
#    fi
    _values 'haxe params' ${arguments[@]}

    if (( CURRENT == 2 )); then
        compadd -- `ls *.hxml`
    fi

    #build_flags=(
    #    '-lib <library[:version]> : use a haxelib library'
    #    '-debug : add debug information to the compiled code'
    #)

    case ${words[2]} in
        #-dce)
        #    _values ${dce_modes[@]}
        #;;
    esac
}

compdef __haxe_complete haxe

## Execute haxe on hxml files
alias -s hxml=haxe

## Find hxml file
#alias hxmlfind='find . -name "*.hxml" | xargs grep -n'
alias hxmlfind='find . -name "*.hxml"'
