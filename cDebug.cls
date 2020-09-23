VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cDebug"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'------------------------------------------------------------------------------
' cDebug class - allow the user to execute the 'int 3' op-code to Debug the
' the calling program into the Visual Studio debugger.
'
Option Explicit

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
Private Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalUnlock Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long

Private hMem      As Long                                     'Allocated memory handle
Private pOldCode  As Long                                     'Pointer to the original (listed) Break routine
Private pNewCode  As Long                                     'Pointer to the machine code replacement code
Private pMyself   As Long                                     'Pointer to me, the class instance

'This routine will be replaced with our machine code sub when the class is created
Public Sub Break()
End Sub

'Replace the Break routine with our machine code sub
Private Sub Class_Initialize()
  hMem = GlobalAlloc(0, 4)                                    'Allocate memory for m/c and save handle
  pNewCode = GlobalLock(hMem)                                 'Get pointer to the locked/allocated memory
  Call CopyMemory(pMyself, ByVal ObjPtr(Me), 4)               'Get pointer to object Me
  Call CopyMemory(ByVal pNewCode, &HC3CC, 4)                  'Copy code to allocated memory
  Call CopyMemory(pOldCode, ByVal pMyself + &H1C, 4)          'Get old Break VT entry
  Call CopyMemory(ByVal pMyself + &H1C, pNewCode, 4)          'Put new Break VT entry
  Call GlobalUnlock(hMem)                                     'Unlock memory
End Sub

'Restore the original Break routine in the vtable
Private Sub Class_Terminate()
  Call CopyMemory(ByVal pMyself + &H1C, pOldCode, 4)          'Restore old Break VT entry
  Call GlobalFree(hMem)                                       'Release memory used for m/c
End Sub
