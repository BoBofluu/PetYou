<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf8">
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="keywords" content="转盘抽奖">
    <meta name="description" content="转盘抽奖">
    <meta name="robots" content="all">
    <meta name="baiduspider" content="all">
    <meta name="googlebot" content="all">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>預約小禮物!</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
 	<link rel="stylesheet" type="text/css" href="<c:url value='/css/reservation/turntable.css'/>">
 	<script> window.history.forward(1);</script>
 	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <form id="form1" method="GET" action="<c:url value='/insertSuccessful' />">
  <div class="title">
  	<span class="successful">預約成功</span>
  	<img class="doggy" src="<c:url value='/image/turntable/nTw.gif' />" />
  	<br>
  	<span class="description">預約成功即可抽一次獎，請按</span>
  	<img src="<c:url value='/image/turntable/透明狗.png' />" style="width: 60px;"/>
  	<sapn class="description">抽獎!!!!</sapn>
  	</div>

    <div class="wrapper" id="wrapper">
        <div class="part2">
        </div>
        <div id="pointer" class="rotate-pointer" data-click=""></div>
        <input type="text" id="jackpot" name="jackpot" hidden />
        <input type="text" id="reservationID" name="reservationID" value="${param.reservationID}" hidden />
    </div>
    
   </form>
   <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    
    <script>	
        // 抽獎測試
        (function () {
        	var reservationID = ${reservationID}
            var btn = $("#pointer"),
                options = {
                };

            // 獎品角度列表，因為是逆時針轉的，角度要反著算
            options.gifts = {
                "1": {
                    id: "1",
                    name: "小玩具",
                    angleStart:-22,
                    angleEnd:22,
                    tips: "恭喜獲得寵物小玩具一個!\n請記得跟店家領取喔~~"
                },
                "2": {
                    id: "2",
                    name: "零食",
                    angleStart:23,
                    angleEnd:67,
                    tips: "恭喜獲得寵物零食一包!\n請記得跟店家領取喔~~"
                },
                "3": {
                    id: "3",
                    name: "沒中",
                    angleStart:68,
                    angleEnd:112,
                    tips: "歡迎下次再次預約!\n再來挑戰喔!"
                },
                "4": {
                    id: "4",
                    name: "罐頭",
                    angleStart:113,
                    angleEnd:157,
                    tips: "恭喜獲得寵物罐頭一個!\n請記得跟店家領取喔~~"
                },
                "5": {
                    id: "5",
                    name: "小玩具",
                    angleStart:158,
                    angleEnd:202,
                     tips: "恭喜獲得寵物小玩具一個!\n請記得跟店家領取喔~~"
                },
                "6": {
                    id: "6",
                    name: "零食",
                    angleStart:203,
                    angleEnd:247,
                    tips: "恭喜獲得寵物零食一包!\n請記得跟店家領取喔~~"
                },
                "7": {
                    id: "7",
                    name: "飼料",
                    angleStart:248,
                    angleEnd:292,
                    tips: "中大獎啦!!!!恭喜獲得寵物飼料一包!!!\n請記得跟店家領取喔~~"
                },
                "8": {
                    id: "8",
                    name: "罐頭",
                    angleStart:293,
                    angleEnd:337,
                    tips: "恭喜獲得寵物罐頭一個!\n請記得跟店家領取喔~~"
                }
            };

            // 獲取[n,m]的隨機整數
            function getRandom(n, m) {
                 //floor: 小於亂數的最大整數
                var num = Math.floor(Math.random() * (m - n + 1) + n)
                return num
            }
            function _begin() {

                var base = 2160; //和transition: transform 3s;對應

                var result = getRandom(-22, 337); // 角度範圍內產生亂數

                var deg = (base + result)
                 //旋轉幾度                            //deg = Degress(度)
                $(".part2").css({ "transform": "rotate(" + deg + "deg)" });

                $(".part2").on('transitionend', function () {
                    console.log(result)
                    //key = 獎品id
                    for (var key in options.gifts) {

                        if (options.gifts[key].angleStart <= result && result <= options.gifts[key].angleEnd) {
                            console.log(key)
                            $("#jackpot").val(key);
                            Swal.fire({title: options.gifts[key].tips, allowOutsideClick: false}).then(function () {
                            	
                            	$("#form1").submit();
                        	});
//                             alert(options.gifts[key].tips);
                            
                           
                       
                        }
                    }
                })
            }

            btn.on("click", _begin);
        })();
    </script>

</html> 