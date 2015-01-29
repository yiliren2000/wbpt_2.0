<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
    <head>
        <title>登陆页面</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <style type="text/css">
          #loginFormDiv{
              position:absolute;
              left:50%;top:50%;
              margin:-100px 0 0 -150px;
          }
          #msgDiv{
              display:none;
          }
          #formDiv{
              display:block;
          }
          #inputDiv{
              text-align:right;
          }
          #buttonDiv{
              text-align:center;
          }
        </style>
        <script type="text/javascript" src="${path}/resources/js/common.js"></script>
        <script type="text/javascript" src="${path}/resources/extjs/adapter/ext/ext-base.js"></script>
        <script type="text/javascript" src="${path}/resources/extjs/ext-all-debug.js"></script>
        <script type="text/javascript" src="${path}/resources/extjs/states.js"></script>
        
        <script language="javascript">
    
            function submitForm(){
            
                if(!validUserId() || !validPassword()){
                    return false;
                }
             
                setCookie("userId",document.getElementById("userId").value,30);
                
                Ext.Ajax.request({
                    url: '${path}/login!login.action',
                    method: 'POST',
                    params:{
                        userId : document.getElementById("userId").value,
                        password : document.getElementById("password").value
                    },
                    success: function (response) {
                        if(Ext.decode(response.responseText).success==true){
                            //模态窗口打开
                            //window.showModalDialog("${path}/main.jsp?rand="+new Date(),"","dialogWidth="+sScreenWidth+";dialogHeight="+sScreenHeight);
                            //链接重定向打开
                            window.location.href='${path}/main.jsp?rand='+new Date();
                        }else{
                            showMsgDiv(Ext.decode(response.responseText).msg);
                        }
                    },
                    failure: function(form, action) {
                        showMsgDiv(action.result.msg);
                    }
                });
            }
            
            function resetform(){
                var form = document.getElementById("form");
                form.userId.value="";
                form.password.value="";
            }
            
            function validUserId(){
                var userId = document.getElementById("userId");
            
                if(userId.value == ""){
                    showMsgDiv("请输入用户名！");
                    setTimeout(function () { userId.focus(); }, 0);
                    return false;
                } else{
                    hiddenMsgDiv();
                }
                return true;
            }
            
            function validPassword(){
                var password = document.getElementById("password");
                if(password.value == ""){
                    showMsgDiv("请输入密码！");
                    setTimeout(function () { password.focus(); }, 0);
                    return false;
                } else{
                    hiddenMsgDiv();
                }
                return true;
            }
            
            function showMsgDiv(msg){
                document.getElementById("msgDiv").innerHTML="<font size='4' color='red'>"+msg+"</font>";
                document.getElementById("msgDiv").style.display = "block";
            }

            function hiddenMsgDiv(){
                document.getElementById("msgDiv").style.display = "none";
            }
    
           document.onkeydown=function(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];
             if(e && e.keyCode==13){ // enter 键
                 submitForm();
             }
           }; 
    
        </script>
    </head>
    
    <body>
        <div id="loginFormDiv">
            <div id="msgDiv"></div>
            <form action="" id="form" name="form">
               <div id="inputDiv">
                    用户名<input type="text" id ="userId" name="userId"/><br>
                    密码<input type="password" id ="password" name="password" value="1234abcd"/><br>
               </div>
                <div id="buttonDiv">
                    <input type="button" id="submit" value="提交"/>
                    <input type="button" id="reset" value="重置" />
                </div>
            </form>
        </div>
    </body>

    <script type="text/javascript">
    
        var userId = getCookie("userId");
        document.getElementById("userId").value = userId;
        
        document.getElementById("userId").onblur = validUserId;
        document.getElementById("password").onblur = validPassword;
        
        document.getElementById("submit").onclick=submitForm;
        document.getElementById("reset").onclick=resetform;
    
    </script>
    
</html>