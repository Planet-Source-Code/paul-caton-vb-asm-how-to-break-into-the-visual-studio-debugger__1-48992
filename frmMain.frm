VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Crash"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   2  'CenterScreen
   Begin VB.OptionButton optHow 
      Caption         =   "API"
      Height          =   210
      Index           =   1
      Left            =   120
      TabIndex        =   2
      Top             =   360
      Width           =   1125
   End
   Begin VB.OptionButton optHow 
      Caption         =   "VB+ASM"
      Height          =   210
      Index           =   0
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Value           =   -1  'True
      Width           =   1125
   End
   Begin VB.CommandButton cmdCrash 
      Caption         =   "Break into debugger"
      Height          =   495
      Left            =   1260
      TabIndex        =   0
      Top             =   1350
      Width           =   2160
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Sub DebugBreak Lib "kernel32" ()

Private Sub cmdCrash_Click()
Dim i     As Long, _
    j     As Long, _
    dbg   As New cDebug
  
  If InIDE Then
    If MsgBox("You are running in the VB IDE. If you proceed, the entire VB IDE environment will break into the Visual Studio debugger. Are you sure you wish to continue?", vbExclamation + vbYesNo + vbDefaultButton2) = vbNo Then
      Exit Sub
    End If
  End If
  
  If optHow(0).Value Then
    Call dbg.Break
  Else
    Call DebugBreak
  End If
  
  For i = 1 To 4
    j = i
    i = j
  Next i
End Sub

'Return -1 if we're running in the IDE, return 0 if we're running compiled.
Private Function InIDE() As Long
Static Value As Long
  
  If Value = 0 Then
    Value = 1
    Debug.Assert (True Or InIDE())  'This line won't exist in the compiled app
    InIDE = Value - 1
  End If
  
  Value = 0
End Function
