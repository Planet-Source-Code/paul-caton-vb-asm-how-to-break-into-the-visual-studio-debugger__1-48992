<div align="center">

## VB\+ASM \- How to break into the Visual Studio debugger\.


</div>

### Description

The included cDebug.cls class allows the user to break their application (or the VB IDE if run from there, not recommended) into the Visual Studio debugger. Make the sample project, run the executable, click the 'Break into debugger' button, a dialog will be displayed, click the Cancel button to enter the Visual Studio debugger, dismiss the message box and then press F10 twice to step thru the software interupt and the return statements and you'll be back in the VB calling routine. Provided you haven't run the program from the IDE, you should now see the Visual Basic statements interspersed with their implementing assembler codes. To ensure that you can view the VB source with your own programs.... make sure that the following options are set on the Project/Project Properties/Compile dialog... Compile to Native Code, Create Symbolic Debug Info. Also, before running the application to be debugged, be certain that the source code files on disk are up to date by selecting File/Save Project. I should stress that this submission is a shameless VB+ASM promotion, as the same trick can be achieved with an API call, as is demonstrated in the sample.
 
### More Info
 


<span>             |<span>
---                |---
**Submitted On**   |2003-10-05 05:51:02
**By**             |[Paul Caton](https://github.com/Planet-Source-Code/PSCIndex/blob/master/ByAuthor/paul-caton.md)
**Level**          |Advanced
**User Rating**    |4.5 (134 globes from 30 users)
**Compatibility**  |VB 5\.0, VB 6\.0
**Category**       |[Miscellaneous](https://github.com/Planet-Source-Code/PSCIndex/blob/master/ByCategory/miscellaneous__1-1.md)
**World**          |[Visual Basic](https://github.com/Planet-Source-Code/PSCIndex/blob/master/ByWorld/visual-basic.md)
**Archive File**   |[VB\+ASM\_\-\_H1654041052003\.zip](https://github.com/Planet-Source-Code/paul-caton-vb-asm-how-to-break-into-the-visual-studio-debugger__1-48992/archive/master.zip)








