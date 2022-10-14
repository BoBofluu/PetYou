<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
  <title>WebSocket 聊天機器人</title>
  
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css' />" />
  <script type="text/javascript">
      var webSocket;    // Websocket連線物件
      var userName;     // 使用者之聊天代號
      var textarea;     // 訊息顯示區
      var wsconsole;    // Websocket console area
      var userlist;     // 使用者清單
      /* 連線到 Websocket 端點的回呼函數endpoint */
      function connect() {
          textarea = document.getElementById("textarea");		// 訊息顯示區
          wsconsole = document.getElementById("wsconsole");
          userlist = document.getElementById("userlist");		// 使用者清單
          webSocket = new WebSocket("ws://localhost:8080/PetYou/chatbot");
          webSocket.onmessage = onMessage;
          document.getElementById("name").focus();		// 使用者之聊天代號
          document.getElementById("consolediv").style.visibility = 'hidden';
      }
      /*
         1.onMessage(event)為收到Server送來訊息後的回呼函數
		 2. 送來之訊息位於event.data內
         3.更新訊息顯示區
      */
      function onMessage(event) {
          var line = "";
          /* 將送來的訊息解析為JavaScript物件 */
          var msg = JSON.parse(event.data);
          if (msg.type === "chat") {   			// 表示聊天訊息
              line = msg.name + ": ";			// name表示發送信息者
              if (msg.target.length > 0)		// target表示接收信息者	
                  line += "@" + msg.target + " ";
              line += msg.message + "\n";
              /* 更新聊天訊息顯示區 */
              textarea.value += "" + line;
          } else if (msg.type === "info") {		// 表示通知訊息 
              line = "[== " + msg.info + " ==]\n";
              /* 更新聊天訊息顯示區 */
              textarea.value += "" + line;
          } else if (msg.type === "users") {	// 表示使用者訊息	
              line = "位於聊天室的人員:\n";
              for (var i=0; i < msg.userlist.length; i++)
                  line += "-" + msg.userlist[i] + "\n";
              /* 更新使用者清單顯示區 */
              userlist.value = line;
          }
          textarea.scrollTop = 999999;
          /* 更新主控台區 */
          wsconsole.value += "=> " +  event.data + "\n";
          wsconsole.scrollTop = 999999;
      }
      /* 進行聊天前必須先加入聊天室 */
      function sendJoin() {
          var input = document.getElementById("input");	// 輸入聊天訊息的文字方塊
          var name = document.getElementById("name");	// 輸入聊天代號的文字方塊	
          var join = document.getElementById("join");	// 『加入聊天室』按鈕
          var jsonstr;
          
          if (name.value.length > 0) {		// 如果輸入了聊天代號 
              var joinMsg = {};				// 新建一個存放訊息的JavaScript物件
              joinMsg.type = "join";
              joinMsg.name = name.value;
              
              jsonstr = JSON.stringify(joinMsg);   	// 將物件轉為JSON字串 
              webSocket.send(jsonstr);				// 寫出字串
              name.disabled = true;
              join.disabled = true;
              input.disabled = false;
//               userName = name.value;
			  userName = name.value;
              /* 更新主控台區的日誌內容 */
              wsconsole.value += "<= " + jsonstr + "\n";
              wsconsole.scrollTop = 999999;
          }
      }
      /* 傳送使用者輸入的聊天訊息 (於資料輸入區按下 ENTER鍵) */
      function sendMessage(event) {
          var input = document.getElementById("input");
          var jsonstr;
          var msgstr;
          if (event.keyCode === 13 && input.value.length > 0) {
        	  // 新建一個存放訊息的JavaScript物件
              var chatMsg = {};
              chatMsg.type = "chat";
              chatMsg.name = userName;
              msgstr = input.value;
              chatMsg.target = getTarget(msgstr.replace(/,/g, ""));
              chatMsg.message = cleanTarget(msgstr);
              // 移除換行字元: \r\n|\n|\r。  
              // gm的g代表greedy，隱喻為做一次以上，m代表有效範圍多列(many line)
              //
              chatMsg.message = chatMsg.message.replace(/(\r\n|\n|\r)/gm,"");
              jsonstr = JSON.stringify(chatMsg);	// 將物件轉為JSON字串 
              webSocket.send(jsonstr);				// 寫出字串
              input.value = "";
              /* 更新主控台區的日誌內容 */
              wsconsole.value += "<- " + jsonstr + "\n";
              wsconsole.scrollTop = 999999;
          }
      }
      /* 送出加入聊天室的請求 */
      function checkJoin(event) {
          var name = document.getElementById("name");
          var input = document.getElementById("input");
          if (event.keyCode === 13 && name.value.length > 0) {
              sendJoin();
              input.focus();
          }
      }
      /* Get the @User (target) for a message */
      function getTarget(str) {
          var arr = str.split(" ");
          var target = "";
          for (var i=0; i<arr.length; i++) {
              if (arr[i].charAt(0) === '@') {
                  target = arr[i].substring(1,arr[i].length);
                  target = target.replace(/(\r\n|\n|\r)/gm,"");
              }
          }
          return target;
      }
      /* Remove the @User (target) from a message */
      function cleanTarget(str) {
          var arr = str.split(" ");
          var cleanstr = "";
          for (var i=0; i<arr.length; i++) {
              if (arr[i].charAt(0) !== '@')
                  cleanstr += arr[i] + " ";
          }
          return cleanstr.substring(0,cleanstr.length-1);
      }
      /* Show or hide the WebSocket console */
      function showHideConsole() {
          var chkbox = document.getElementById("showhideconsole");
          var consolediv = document.getElementById("consolediv");
          if (chkbox.checked)
              consolediv.style.visibility = 'visible';
          else
              consolediv.style.visibility = 'hidden';
      }
      /* Call connect() 當網頁載入完畢執行connect方法  */
      window.addEventListener("load", connect, false);
  </script>
</head>
<body>
	<jsp:include page="../petHomepage.jsp"></jsp:include>
	<div align='center'>
<!--     <h1>WebSocket 聊天機器人</h1> -->
    	聊天代號: <input id="name" type="text" size="25" maxlength="26" onkeyup="checkJoin(event);" value="${userNickName}"/> 
    <input type="submit" id="join" value="加入聊天室" onclick="sendJoin();"/><br/>
    <textarea id="input" cols="110" rows="1" disabled
              onkeyup="sendMessage(event);"></textarea><br/>
    <textarea id="textarea" cols="90" rows="20" readonly></textarea>
    <textarea id="userlist" cols="20" rows="20" readonly></textarea>
    <br/><br/><br/>
    <input id="showhideconsole" type="checkbox" onclick="showHideConsole();"/>
    Show WebSocket console<br/>
<!--     <div id="consolediv"><textarea id="wsconsole" cols="80" rows="8" readonly -->
<!--                                    style="font-size:8pt;"></textarea></div> -->
   </div>                                   
</body>
</html>