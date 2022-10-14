window.onload = function() {
	$('.articlediv').width(screen.width * 0.5);
	$('.innerA').height(screen.height * 0.7);
	$('.articleScreen').width(screen.width * 0.8);
	
	$("#inputArticle").focus(function() {
		$(this).css("border", "1px solid black");
	})
	$("#inputArticle").blur(function() {
		$(this).css("border", "none");
	})
	$("#textareaContext").focus(function() {
		$(this).css("border", "1px solid black");
	})
	$("#textareaContext").blur(function() {
		$(this).css("border", "none");
	})


	let BoardNum = 0, TagNum = 0, InputNum = "";
	$("#selectBoard").change(function() {
		BoardNum = $(this).val();
//		console.log("selectBoard：" + BoardNum);
		submitOpen();
	})
	$("#selectTag").change(function() {
		TagNum = $(this).val();
//		console.log("selectTag：" + TagNum);
		submitOpen();
	})
	$("#inputArticle").blur(function() {
		InputNum = $(this).val();
//		console.log("InputNum：" + InputNum);
		submitOpen();
	})

	function submitOpen() {
		if (BoardNum != 0 && TagNum != 0 && InputNum != "") {
			$("#submitArticle").attr("disabled", false);
			$("#submitArticle").addClass("submitArticle");
		} else {
			$("#submitArticle").attr("disabled", true);
			$("#submitArticle").removeClass("submitArticle");

		}
	}
	$("#upload_img").on("change", "input[type='file']", function() {
		var filePath = $(this).val();
		if (filePath.indexOf("jpg") != -1 || filePath.indexOf("png") != -1) {
			$(".fileerrorTip").html("").hide();
			var arr = filePath.split('\\');
			var fileName = arr[arr.length - 1];
			$(".showFileName").html(fileName);
		} else {
			$(".showFileName").html("");
			$(".fileerrorTip").html("未上傳檔案，或者上傳檔案型別有誤！").show();
			return false
		}
	})

}