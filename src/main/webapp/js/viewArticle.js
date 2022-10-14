window.onload = function() {
	//控制視窗大小
	$('.articlediv').width(screen.width * 0.5);
	$('.member-screen').width(screen.width * 0.12);

	//控制視窗大小結束

	//點擊圖片會轉跳
	$(".real-img").click(function() {
		document.getElementById("overlay").style.display = "block";
		var gogoro = new Image();
		gogoro.src = this.src;
        gogoro.classList.add("textimg");
		$("#text").append(gogoro);
	})
	$("#overlay").click(function() {
		document.getElementById("overlay").style.display = "none";
		$('#text img').remove();
	})
	//點擊圖片會轉跳結束
	//button框框
	$("button").focus(function() {
		$(this).css("outline", "none");
	})
	//button框框結束
}