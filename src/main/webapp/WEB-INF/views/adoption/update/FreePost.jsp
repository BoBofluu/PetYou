<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>寵你 只寵愛你</title>

<style type="text/css">
* {margin =0;padding =0;
	
}

#head {
	color: #5D001E;
	font-weight: bolder;
	text-align: center;
	font-size: 30pt;
	margin-bottom: 10px;
}

#freePost {
	padding: 100px;
	padding-bottom: 50px; margin-top : 2%;
	margin-left: 13%;
	margin-right: 12%;
	background-color: white;
	box-shadow: 12px 12px 7px #dfe3e8;
	border-radius: 10px;
	position: absolute;
	margin-bottom: 40px;
	height: auto;
	margin-top: 2%;
}

#inputInfo {
	padding: 20px;
	margin: 20px;
	font-size: large;
	padding-right: 50px;
	outline: none;
}

#insert {
	font-weight: bolder;
	padding: 5px 0px 20px 0px;
	outline: none;
}

.require_bag {
	background-color: red;
	border-radius: 5px;
	font-size: 10pt;
	color: white;
	padding: 4px
}

#spanStyle {
	margin-left: 25px;
	margin-right: 80px;
	font-size: 17pt;
	outline: none;
}

#space {
	width: 70%;
	height: 45px;
	border-radius: 15px;
	border: 0px;
	background-color: #EBD4C7;
	padding-left: 15px;
	outline: none;
}

.pretty-select {
	appearance: none;
	-moz-appearance: none;
	-webkit-appearance: none;
	background:
		url('https://img.icons8.com/wired/38/000000/down-squared.png')
		no-repeat;
	background-position: 97%
}

.pretty-select::-ms-expand {
	display: none;
}

.pretty-select:focus {
	box-shadow: 0 0 5px 2px #467BF4;
}

.status {
	height: 100px
}

.radioType {
	font-size: large;
	margin-right: 10px;
	margin-left: 5px;
}

.restrict {
	margin: 0px 0px 0px 240px;
	font-size: 12pt
}

.nextStep {
	font-size: 15pt;
	background-color: #E96681;
	color: white;
	padding: 10px;
	border: 0px;
	border-radius: 10px;
	font-weight: bold;
	outline: none;
}

#statusCut {
	height: 250px;
	vertical-align: top;
	padding-top: 10px;
	outline: none;
}

input[type=radio] {
	transform: scale(1.6);
	margin-left: 7px;
}

#btn-outline-secondary {
	text-align: center;
}

.space {
	width: 70%;
	height: 45px;
	border-radius: 15px;
	border: 0px;
	background-color: #EBD4C7;
	padding-left: 15px;
	outline: none;
}

.adoptCity {
	width: 25%;
	height: 45px;
	border-radius: 15px;
	border: 0px;
	background-color: #EBD4C7;
	padding-left: 15px;
	outline: none;
}

.adoptDistrict {
	width: 25%;
	height: 45px;
	border-radius: 15px;
	border: 0px;
	background-color: #EBD4C7;
	padding-left: 15px;
	outline: none;
}

#adoptCut {
	margin-top: 10px;
	margin-left: 25%;
	width: 60%;
	outline: none; 
}
</style>

</head>
<body>
	<jsp:include page="../HomePage.jsp" />
	<div id="head">我要刊登</div>
	<div id="btn-outline-secondary">
		<button type="button" class="btn btn-outline-secondary"
			onclick="oneClick()">一鍵輸入</button>
	</div>
	<div align="center" id="freePost">
		<form:form method="POST" modelAttribute="ab">
			<form:input path="member.memberID" value="${userId}" type="hidden" />
			<div align="left" id="insert">
				<span id="spanStyle">浪浪類型</span> <span class="require_bag">必填</span>
				<form:select path="petType" id="langType"
					cssClass="pretty-select types space" required="true">
					<form:option value="" label="請選擇" selected="selected"
						disabled="true" />
				</form:select>
			</div>
			<hr>

			<div align="left" id="insert">
				<span id="spanStyle">浪浪姓名</span> <span class="require_bag">必填</span>
				<form:input path="petName" type="text" cssClass="space" id="nameCut"
					required="true" />
				<p class="restrict">
					您可以輸入20個字，現在剩餘<span id='wordName' style="font-size: 12pt">20</span>個
				</p>
			</div>
			<hr>

			<div align="left" id="insert">
				<span id="spanStyle">浪浪年齡 </span> <span class="require_bag">必填</span>
				<form:select path="ageYear" id="langYear"
					cssClass="pretty-select year space" required="true"
					style="width: 30%">
					<form:option value="-1" label="請選擇" selected="selected"
						disabled="true" />
				</form:select>
				<span style="margin-left: 15px">歲</span>

				<form:select path="ageMonth" id="langMonth"
					cssClass="pretty-select month space" required="true"
					style="width: 30%; margin-left: 30px">
					<form:option value="-1" label="請選擇" selected="selected"
						disabled="true" />
				</form:select>

				<span style="margin-left: 15px">月</span>
			</div>
			<hr>

			<div align="left" id="insert">
				<span id="spanStyle">浪浪狀況</span><span class="require_bag">必填</span>
				<form:textarea placeholder="請填寫浪浪的個性、外觀、健康、與人的相處狀況等等，讓浪浪更快速找到家唷😘"
					path="petCondition" cssClass="space" id="statusCut" required="true" />
				<p class="restrict">
					您可以輸入1000個字，現在剩餘<span id='wordStatus' style="font-size: 12pt">1000</span>個
				</p>
			</div>
			<hr>

			<div align="left" id="insert">
				<span id="spanStyle">浪浪性別</span> <span class="require_bag">必填</span>

				<form:radiobutton name="petSex" path="petSex" value="公" id="male"
					required="true" />
				<span class="radioType"><label for="male">公</label></span>

				<form:radiobutton name="petSex" path="petSex" value="母" id="female"
					required="true" />
				<span class="radioType"><label for="female">母</label></span>

				<form:radiobutton name="petSex" path="petSex" value="性別未知" id="none"
					required="true" />
				<span class="radioType"><label for="none">性別未知</label></span>

			</div>
			<hr>

			<div align="left" id="insert">
				<span id="spanStyle">拾獲日期</span> <span class="require_bag">必填</span>
				<form:input path="foundDate" type="text" cssClass="datepicker space"
					required="true" readonly="true" />
			</div>
			<hr>

			<div align="left" id="insert">
				<span id="spanStyle">拾獲地點</span> <span class="require_bag">必填</span>
				<form:input path="source" type="text" cssClass="space" id="pickCut"
					placeholder="若無，則填【送養原因】" required="true" />

				<p class="restrict">
					您可以輸入50個字，現在剩餘<span id='wordPick' style="font-size: 12pt">50</span>個
				</p>
			</div>
			<hr>

			<div align="left" id="insert">
				<span id="spanStyle">領養地點</span> <span class="require_bag">必填</span>
				<form:select path="adoptCity" cssClass="pretty-select adoptCity"
					required="true">
					<form:option value="" label="縣市" selected="selected"
						disabled="true" />
				</form:select>
				<form:select path="adoptDistrict" cssClass="pretty-select adoptDistrict"
					required="true">
					<form:option value="" label="鄉鎮市區" selected="selected"
						disabled="true" />
				</form:select>
				<form:input path="adoptionLocation" type="text" cssClass="space"
					id="adoptCut" placeholder="街道巷弄(選填)" />

				<p class="restrict">
					您可以輸入50個字，現在剩餘<span id='wordAdopt' style="font-size: 12pt">50</span>個
				</p>
			</div>
			<hr>

			<div align="left" id="insert">
				<span id="spanStyle">浪浪體型</span>
				<form:radiobutton name="size" path="size" value="大型" id="large" />
				<span class="radioType"><label for="large">大型</label></span>

				<form:radiobutton name="size" path="size" value="中型" id="middle" />
				<span class="radioType"><label for="middle">中型</label></span>

				<form:radiobutton name="size" path="size" value="小型" id="small" />
				<span class="radioType"><label for="small">小型</label></span>

			</div>
			<hr>

			<div align="left" id="insert">
				<span id="spanStyle">浪浪品種</span>

				<form:input path="breed" type="text" cssClass="space" id="breedCut"
					value="無" required="true" />

				<p class="restrict">
					您可以輸入50個字，現在剩餘<span id='wordBreed' style="font-size: 12pt">50</span>個
				</p>
			</div>
			<hr>

			<div align="left" id="insert">
				<span id="spanStyle">浪浪毛色</span>

				<form:select path="furColor" id="space" cssClass="pretty-select fur">
					<form:option value="" label="請選擇" selected="selected"
						disabled="true" />
				</form:select>

			</div>
			<hr>

			<input type="submit" value="下一步" class="nextStep"
				style="margin-left: 6%" />
			<img src="https://img.icons8.com/emoji/48/000000/paw-prints.png" />
		</form:form>
	</div>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"
		type="text/javascript"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
		type="text/javascript"></script>
	<link
		href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
		rel="Stylesheet" type="text/css" />
	<script>
		if (${login!=true}) {
			location.href="<c:url value='/signinCheckcc'/>";
		} 
	
		$('#freePost').width(screen.width * 0.75);
		var $j = jQuery.noConflict();
		$j(".datepicker").datepicker({
			dateFormat : "yy-mm-dd"
		});
		window.history.forward(1);

		var year = $('.year');
		var month = $('.month');
		var types = $('.types')
		var fur = $('.fur')
		var adoptCity = $('.adoptCity');
		var animal = [ '貓', '狗', '兔子', '其他' ];
		var furTypes = [ "橘色", "三花", "虎斑", "玳瑁", "黑色", "黑白", "黑黃", "咖啡", "灰色",
				"灰白", "黃色", "黃白", "重點色", "雙色", "白色", "紅色", "米色", "藍色", "銀色",
				"金色", "黑棕", "其他" ]
		var cities = ["臺北市","新北市","桃園市","臺中市","臺南市","高雄市","新竹縣",
			"苗栗縣","彰化縣","南投縣","雲林縣","嘉義縣","屏東縣","宜蘭縣","花蓮縣",
			"臺東縣","澎湖縣","金門縣","連江縣","基隆市","新竹市","嘉義市"];
		
		var chiaYiCity=["東區","西區"]
		var hisnChuCity=["東區","北區","香山區"]
		var keeLung=["中正區", "七堵區", "暖暖區", "仁愛區", "中山區",
			"安樂區", "信義區"]
		var lianChian=["南竿鄉","北竿鄉","莒光鄉","東引鄉"]
		var kingMen=["金城鎮", "金湖鎮", "金沙鎮", "金寧鄉", "烈嶼鄉", "烏坵鄉"]
		var ponHu=["馬公市", "湖西鄉", "白沙鄉", "西嶼鄉", "望安鄉", "七美鄉"]
		var taiTong=["臺東市", "成功鎮", "關山鎮", "卑南鄉",	
			"大武鄉", "太麻里鄉","東河鄉", "長濱鄉", 
			"鹿野鄉", "池上鄉", "綠島鄉", "延平鄉",	
			"海端鄉", "達仁鄉", "金峰鄉", "蘭嶼鄉"]
		var huaLian=["花蓮市", "鳳林鎮", "玉里鎮", "新城鄉", "吉安鄉",
			"壽豐鄉", "光復鄉", "豐濱鄉", "瑞穗鄉", "富里鄉",
			"秀林鄉", "萬榮鄉", "卓溪鄉"]
		var yiLan=["宜蘭市", "羅東鎮", "蘇澳鎮", "頭城鎮", "礁溪鄉",
			"壯圍鄉", "員山鄉", "冬山鄉", "五結鄉", "三星鄉",
			"大同鄉", "南澳鄉"]
		var pinTong=["屏東市", "潮州鎮", "東港鎮", "恆春鎮", "萬丹鄉",
			"長治鄉", "麟洛鄉", "九如鄉", "里港鄉", "鹽埔鄉",
			"高樹鄉", "萬巒鄉", "內埔鄉", "竹田鄉", "新埤鄉",
			"枋寮鄉", "新園鄉", "崁頂鄉", "林邊鄉", "南州鄉",
			"佳冬鄉", "琉球鄉", "車城鄉", "滿州鄉", "枋山鄉",
			"三地門鄉", "霧臺鄉", "瑪家鄉", "泰武鄉", "來義鄉",
			"春日鄉", "獅子鄉", "牡丹鄉"]
		var chiaYi=["太保市", "朴子市", "布袋鎮", "大林鎮", "民雄鄉",
			"溪口鄉", "新港鄉", "六腳鄉", "東石鄉", "義竹鄉",
			"鹿草鄉", "水上鄉", "中埔鄉", "竹崎鄉", "梅山鄉",
			"番路鄉", "大埔鄉", "阿里山鄉"]
		var yunLin=["斗六市", "斗南鎮", "虎尾鎮", "西螺鎮", "土庫鎮",
			"北港鎮", "古坑鄉", "大埤鄉", "莿桐鄉", "林內鄉",
			"二崙鄉", "崙背鄉", "麥寮鄉", "東勢鄉", "褒忠鄉",
			"臺西鄉", "元長鄉", "四湖鄉", "口湖鄉", "水林鄉"]
		var nanTou=["南投市", "草屯鎮", "埔里鎮", "竹山鎮", "集集鎮",
			"名間鄉", "鹿谷鄉", "中寮鄉", "魚池鄉", "國姓鄉",
			"水里鄉", "信義鄉", "仁愛鄉"]
		var chungHua =["彰化市", "員林市", "鹿港鎮", "和美鎮", "北斗鎮", "溪湖鎮",
			"田中鎮", "二林鎮", "線西鄉", "伸港鄉", "福興鄉", "秀水鄉",
			"花壇鄉", "芬園鄉", "大村鄉", "埔鹽鄉", "埔心鄉", "永靖鄉",
			"社頭鄉", "二水鄉", "田尾鄉", "埤頭鄉", "芳苑鄉", "大城鄉",
			"竹塘鄉", "溪州鄉"]
		var miao=["苗栗市", "頭份市", "苑裡鎮", "通霄鎮", "竹南鎮",
			"後龍鎮", "卓蘭鎮", "大湖鄉", "公館鄉", "銅鑼鄉",
			"南莊鄉", "頭屋鄉", "三義鄉", "西湖鄉", "造橋鄉",
			"三灣鄉", "獅潭鄉", "泰安鄉"]
		var taipei =["中正區","大同區","中山區","松山區","大安區","萬華區",
			"信義區","士林區","北投區","內湖區","南港區","文山區"];
		var newTaipei =["萬里區","金山區","板橋區","汐止區","深坑區","石碇區","瑞芳區",
			"平溪區","雙溪區","貢寮區","新店區","坪林區","烏來區","永和區","中和區",
			"土城區","三峽區","樹林區","鶯歌區","三重區","新莊區","泰山區","林口區",
			"蘆洲區","五股區","八里區","淡水區","三芝區","石門區"];
		var taoYuan =["中壢區","平鎮區","龍潭區","楊梅區","新屋區",
			"觀音區","桃園區","龜山區","八德區","大溪區","復興區",
			"大園區","蘆竹區"]
		var taichung=["中區","東區","西區","南區","北區","西屯區","南屯區",
			"北屯區","豐原區","大里區","太平區","清水區","沙鹿區","大甲區",
			"東勢區","梧棲區","烏日區","神岡區","大肚區","大雅區","后里區",
			"霧峰區","潭子區","龍井區","外埔區","和平區","石岡區","大安區","新社區"]
		var tainan = ["中西區","東區","南區","北區","安平區","安南區","永康區",
			"歸仁區","新化區","左鎮區","玉井區","楠西區","南化區","仁德區","關廟區",
			"龍崎區","官田區","麻豆區","佳里區","西港區","七股區","將軍區",
			"學甲區","北門區","新營區","後壁區","白河區","東山區","六甲區","下營區",
			"柳營區","鹽水區","善化區","大內區","山上區","新市區","安定區"]
		var kao=["楠梓區", "左營區", "鼓山區", "三民區", "苓雅區", "新興區", "前金區", "鹽埕區", "小港區", "旗津區",
			"前鎮區", "鳳山區", "岡山區", "旗山區", "美濃區", "大寮區", "茄萣區", "永安區", "大園區",
			"大社區", "杉林區", "仁武區", "田寮區", "燕巢區", "路竹區", "阿蓮區", "甲仙區", "大樹區",
			"湖內區", "桃源區", "鳥松區", "彌陀區", "那瑪夏區(原三民鄉)", "梓官區", "內門區", "茂林區",
			"橋頭區", "六龜區", "林園區"]
		var hsinChu=["竹北市", "竹東鎮", "新埔鎮", "關西鎮", "新豐鄉", "峨眉鄉", "寶山鄉", "五峰鄉", "橫山鄉", "北埔鄉", 
			"尖石鄉", "芎林鄉", "湖口鄉"]
		
		for (var i = 0; i < cities.length; i++) {
			adoptCity.append('<option value="'+cities[i]+'">' + cities[i]
			+ '</option>')
		}
		
		$(document).ready(function () {
		    $(".adoptCity").change(function () {
		        var val = $(this).val();
		        if (val == "臺北市") {
		        	$(".adoptDistrict").html(" ")
		        	for (var i = 0; i < taipei.length; i++) {
		        		$(".adoptDistrict").append('<option value="'+taipei[i]+'">' + taipei[i]
		    			+ '</option>')
					}
		        } else if (val == "新北市") {
		        	$(".adoptDistrict").html(" ")
		        	for (var i = 0; i < newTaipei.length; i++) {
		        		$(".adoptDistrict").append('<option value="'+newTaipei[i]+'">' + newTaipei[i]
		    			+ '</option>')
		        	}
		        } else if (val == "桃園市") {
		        	$(".adoptDistrict").html(" ")
		        	for (var i = 0; i < taoYuan.length; i++) {
		        		$(".adoptDistrict").append('<option value="'+taoYuan[i]+'">' + taoYuan[i]
		    			+ '</option>')
		        	}
		        } else if (val == "臺中市") {
		        	$(".adoptDistrict").html(" ")
		        	for (var i = 0; i < taichung.length; i++) {
		        		$(".adoptDistrict").append('<option value="'+taichung[i]+'">' + taichung[i]
		    			+ '</option>')} 
		        }else if (val == "臺南市") {
			        $(".adoptDistrict").html(" ")
			        for (var i = 0; i < tainan.length; i++) {
			        	$(".adoptDistrict").append('<option value="'+tainan[i]+'">' + tainan[i]
			    		+ '</option>')
			    		}
			      }else if (val == "高雄市") {
				       $(".adoptDistrict").html(" ")
			        	for (var i = 0; i < kao.length; i++) {
			        		$(".adoptDistrict").append('<option value="'+kao[i]+'">' + kao[i]
			    			+ '</option>')
			    		}
				   }else if (val == "新竹縣") {
				       $(".adoptDistrict").html(" ")
					    for (var i = 0; i < hsinChu.length; i++) {
					    $(".adoptDistrict").append('<option value="'+hsinChu[i]+'">' + hsinChu[i]
					    + '</option>')
						}
				    }else if (val == "苗栗縣") {
					    $(".adoptDistrict").html(" ")
						for (var i = 0; i < miao.length; i++) {
						$(".adoptDistrict").append('<option value="'+miao[i]+'">' + miao[i]
						+ '</option>')
						}
					}else if (val == "彰化縣") {
						$(".adoptDistrict").html(" ")
						for (var i = 0; i < chungHua.length; i++) {
						$(".adoptDistrict").append('<option value="'+chungHua[i]+'">' + chungHua[i]
						+ '</option>')
						}
					}else if (val == "南投縣") {
						$(".adoptDistrict").html(" ")
						for (var i = 0; i < nanTou.length; i++) {
						$(".adoptDistrict").append('<option value="'+nanTou[i]+'">' + nanTou[i]
						+ '</option>')
						}
					}else if (val == "雲林縣") {
						$(".adoptDistrict").html(" ")
						for (var i = 0; i < yunLin.length; i++) {
						$(".adoptDistrict").append('<option value="'+yunLin[i]+'">' + yunLin[i]
						+ '</option>')
						}
					}else if (val == "嘉義縣") {
						$(".adoptDistrict").html(" ")
						for (var i = 0; i < chiaYi.length; i++) {
						$(".adoptDistrict").append('<option value="'+chiaYi[i]+'">' + chiaYi[i]
						+ '</option>')
						}
					}else if (val == "屏東縣") {
						$(".adoptDistrict").html(" ")
						for (var i = 0; i < pinTong.length; i++) {
						$(".adoptDistrict").append('<option value="'+pinTong[i]+'">' + pinTong[i]
						+ '</option>')
						}
					}else if (val == "宜蘭縣") {
						$(".adoptDistrict").html(" ")
						for (var i = 0; i < yiLan.length; i++) {
						$(".adoptDistrict").append('<option value="'+yiLan[i]+'">' + yiLan[i]
						+ '</option>')
						}
					}else if (val == "花蓮縣") {
						$(".adoptDistrict").html(" ")
						for (var i = 0; i < huaLian.length; i++) {
						$(".adoptDistrict").append('<option value="'+huaLian[i]+'">' + huaLian[i]
						+ '</option>')
						}
					}else if (val == "台東縣") {
						$(".adoptDistrict").html(" ")
						for (var i = 0; i < taiTong.length; i++) {
						$(".adoptDistrict").append('<option value="'+taiTong[i]+'">' + taiTong[i]
						+ '</option>')
						}
					}else if (val == "澎湖縣") {
						$(".adoptDistrict").html(" ")
						for (var i = 0; i < ponHu.length; i++) {
						$(".adoptDistrict").append('<option value="'+ponHu[i]+'">' + ponHu[i]
						+ '</option>')
						}
					}else if (val == "金門縣") {
						$(".adoptDistrict").html(" ")
						for (var i = 0; i < kingMen.length; i++) {
						$(".adoptDistrict").append('<option value="'+kingMen[i]+'">' + kingMen[i]
						+ '</option>')
						}
					}else if (val == "連江縣") {
						$(".adoptDistrict").html(" ")
						for (var i = 0; i < lianChian.length; i++) {
						$(".adoptDistrict").append('<option value="'+lianChian[i]+'">' + lianChian[i]
						+ '</option>')
						}
					}else if (val == "基隆市") {
						$(".adoptDistrict").html(" ")
						for (var i = 0; i < keeLung.length; i++) {
						$(".adoptDistrict").append('<option value="'+keeLung[i]+'">' + keeLung[i]
						+ '</option>')
						}
					}else if (val == "新竹市") {
						$(".adoptDistrict").html(" ")
						for (var i = 0; i < hisnChuCity.length; i++) {
						$(".adoptDistrict").append('<option value="'+hisnChuCity[i]+'">' + hisnChuCity[i]
						+ '</option>')
						}
					}else if (val == "嘉義市") {
						$(".adoptDistrict").html(" ")
						for (var i = 0; i < chiaYiCity.length; i++) {
						$(".adoptDistrict").append('<option value="'+chiaYiCity[i]+'">' + chiaYiCity[i]
						+ '</option>')
						} 
					}
		        
		    });
		});

		for (var i = 0; i < 22; i++) {
			fur.append('<option value="'+furTypes[i]+'">' + furTypes[i]
					+ '</option>');
		}

		for (var i = 0; i < 4; i++) {
			types.append('<option value="'+animal[i]+'">' + animal[i]
					+ '</option>');
		}
		for (var i = 0; i <= 25; i++) {
			year.append('<option value="'+i+'">' + i + '</option>');
		}

		for (var i = 0; i <= 12; i++) {
			month.append('<option value="'+i+'">' + i + '</option>');
		}

		$(function() {
			$('#nameCut').keyup(function() {
				var len = $(this).val().length;
				if (len > 19) {
					$(this).val($(this).val().substring(0, 20));
					$('#wordName').css("color", "red");
				}
				if (len <= 19) {
					$('#wordName').css("color", "black");
				}
				var num = 20 - len;
				$('#wordName').text(num);
			});
		});

		$(function() {
			$('#statusCut').keyup(function() {
				var len = $(this).val().length;
				if (len > 999) {
					$(this).val($(this).val().substring(0, 1000));
					$('#wordStatus').css("color", "red");
				}
				if (len <= 999) {
					$('#wordStatus').css("color", "black");
				}
				var num = 1000 - len;
				$('#wordStatus').text(num);
			});
		});

		$(function() {
			$('#pickCut').keyup(function() {
				var len = $(this).val().length;
				if (len > 49) {
					$(this).val($(this).val().substring(0, 50));
					$('#wordPick').css("color", "red");
				}
				if (len <= 49) {
					$('#wordPick').css("color", "black");
				}
				var num = 50 - len;
				$('#wordPick').text(num);
			});
		});

		$(function() {
			$('#adoptCut').keyup(function() {
				var len = $(this).val().length;
				if (len > 49) {
					$(this).val($(this).val().substring(0, 50));
					$('#wordAdopt').css("color", "red");
				}
				if (len <= 49) {
					$('#wordAdopt').css("color", "black");
				}
				var num = 50 - len;
				$('#wordAdopt').text(num);
			});
		});

		$(function() {
			$('#breedCut').keyup(function() {
				var len = $(this).val().length;
				if (len > 49) {
					$(this).val($(this).val().substring(0, 50));
					$('#wordBreed').css("color", "red");
				}
				if (len <= 49) {
					$('#wordBreed').css("color", "black");
				}
				var num = 50 - len;
				$('#wordBreed').text(num);
			});
		});
		
		function oneClick() {
			$( "#langType" ).val("狗");
			$( "#nameCut" ).val("鋼鐵人");
			$( "#langYear" ).val("0");
			$( "#langMonth" ).val("8");
			$("#statusCut").val("-愛社交, 極親人, 但與其它狗的相處, 則要看緣份 -安靜不愛叫, 但對不友善的人會護主而叫, 會跟不對盤的狗對罵 -會坐摩托車");
			$('#male').prop( "checked", true );
			$("#adoptCut").val("福德82號");  //花蓮縣壽豐鄉
			$(".datepicker").val("2020-11-05");
			$("#pickCut").val("新北市林口區仁愛路一段");
			$('#large').prop( "checked", true );
			$(".fur").val("黑棕");
		}
	</script>

</body>
</html>