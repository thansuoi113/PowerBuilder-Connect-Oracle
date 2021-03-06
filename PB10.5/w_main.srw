$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_2 from commandbutton within w_main
end type
type cb_1 from commandbutton within w_main
end type
type st_5 from statictext within w_main
end type
type st_4 from statictext within w_main
end type
type st_3 from statictext within w_main
end type
type rb_host from radiobutton within w_main
end type
type rb_tns from radiobutton within w_main
end type
type st_2 from statictext within w_main
end type
type st_1 from statictext within w_main
end type
type sle_port from singlelineedit within w_main
end type
type sle_database from singlelineedit within w_main
end type
type sle_server from singlelineedit within w_main
end type
type sle_password from singlelineedit within w_main
end type
type sle_user from singlelineedit within w_main
end type
end forward

global type w_main from window
integer width = 1339
integer height = 1056
boolean titlebar = true
string title = "Connect Oracle"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
st_5 st_5
st_4 st_4
st_3 st_3
rb_host rb_host
rb_tns rb_tns
st_2 st_2
st_1 st_1
sle_port sle_port
sle_database sle_database
sle_server sle_server
sle_password sle_password
sle_user sle_user
end type
global w_main w_main

forward prototypes
public subroutine wf_changehost ()
end prototypes

public subroutine wf_changehost ();If rb_host.Checked Then
	st_3.Text = "TNS:"
	sle_server.Enabled = True
	sle_database.Enabled = True
	sle_port.Enabled = True
Else
	st_3.Text = "Server:"
	sle_server.Enabled = True
	sle_database.Enabled = False
	sle_port.Enabled = False
End If

end subroutine

on w_main.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.rb_host=create rb_host
this.rb_tns=create rb_tns
this.st_2=create st_2
this.st_1=create st_1
this.sle_port=create sle_port
this.sle_database=create sle_database
this.sle_server=create sle_server
this.sle_password=create sle_password
this.sle_user=create sle_user
this.Control[]={this.cb_2,&
this.cb_1,&
this.st_5,&
this.st_4,&
this.st_3,&
this.rb_host,&
this.rb_tns,&
this.st_2,&
this.st_1,&
this.sle_port,&
this.sle_database,&
this.sle_server,&
this.sle_password,&
this.sle_user}
end on

on w_main.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.rb_host)
destroy(this.rb_tns)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_port)
destroy(this.sle_database)
destroy(this.sle_server)
destroy(this.sle_password)
destroy(this.sle_user)
end on

event open;wf_changehost()
end event

type cb_2 from commandbutton within w_main
integer x = 891
integer y = 844
integer width = 343
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

type cb_1 from commandbutton within w_main
integer x = 119
integer y = 844
integer width = 343
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Connect"
end type

event clicked;String ls_database, ls_servername, ls_port, ls_user, ls_pass

ls_user = sle_user.Text
ls_pass = sle_password.Text
ls_database = sle_database.Text
ls_servername = sle_server.Text
ls_port = sle_port.Text

If rb_host.checked Then
	ls_servername = "(DESCRIPTION =    (ADDRESS_LIST =      (ADDRESS = (PROTOCOL = TCP)(HOST = " + ls_servername + ")(PORT = " + ls_port + ")))      (CONNECT_DATA = (SID = " + ls_database + "))  )"
End If

// Using ODBC Connect To Oracle 
Transaction ltran_conn
ltran_conn = Create Transaction

ltran_conn.DBMS = "O10 Oracle10g (10.1.0)"
ltran_conn.LogPass = ls_user
ltran_conn.ServerName = ls_servername
ltran_conn.LogId = ls_pass
ltran_conn.AutoCommit = False
ltran_conn.DBParm = "CommitOnDisconnect='No'"

Connect Using ltran_conn ;
If ltran_conn.SQLCode = -1 Then
	MessageBox('Warning','Connect Database Error' + ltran_conn.SQLErrText)
Else
	MessageBox('Warning',"Connect Success!")
End If

Disconnect Using ltran_conn ;







end event

type st_5 from statictext within w_main
integer x = 41
integer y = 700
integer width = 315
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Port:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_main
integer x = 41
integer y = 576
integer width = 315
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Database:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_main
integer x = 41
integer y = 452
integer width = 315
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Server:"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_host from radiobutton within w_main
integer x = 727
integer y = 336
integer width = 311
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "HOST"
boolean checked = true
end type

event clicked;wf_changehost()
end event

type rb_tns from radiobutton within w_main
integer x = 434
integer y = 340
integer width = 247
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "TNS"
end type

event clicked;wf_changehost()
end event

type st_2 from statictext within w_main
integer x = 41
integer y = 192
integer width = 315
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Password:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_main
integer x = 41
integer y = 84
integer width = 315
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "User:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_port from singlelineedit within w_main
integer x = 379
integer y = 688
integer width = 814
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "1521"
borderstyle borderstyle = stylelowered!
end type

type sle_database from singlelineedit within w_main
integer x = 379
integer y = 576
integer width = 814
integer height = 80
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_server from singlelineedit within w_main
integer x = 379
integer y = 452
integer width = 814
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_password from singlelineedit within w_main
integer x = 379
integer y = 192
integer width = 814
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type sle_user from singlelineedit within w_main
integer x = 379
integer y = 84
integer width = 814
integer height = 80
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

