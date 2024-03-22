<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
	Future Imperfect by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Future Imperfect by HTML5 UP</title>
		<meta charset="utf-8" />
		 <meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1><a href="index.html">Future Imperfect</a></h1>
						<nav class="links">
							<ul>
								<li><a href="#">Lorem</a></li>
								<li><a href="#">Ipsum</a></li>
								<li><a href="#">Feugiat</a></li>
								<li><a href="#">Tempus</a></li>
								<li><a href="#">Adipiscing</a></li>
							</ul>
						</nav>
						<nav class="main">
							<ul>
								<li class="search">
									<a class="fa-search" href="#search">Search</a>
									<form id="search" method="get" action="#">
										<input type="text" name="query" placeholder="Search" />
									</form>
								</li>
								<li class="menu">
									<a class="fa-bars" href="#menu">Menu</a>
								</li>
							</ul>
						</nav>
					</header>

				<!-- Menu -->
					<section id="menu">

						<!-- Search -->
							<section>
								<form class="search" method="get" action="#">
									<input type="text" name="query" placeholder="Search" />
								</form>
							</section>

						<!-- Links -->
							<section>
								<ul class="links">
									<li>
										<a href="#">
											<h3>Lorem ipsum</h3>
											<p>Feugiat tempus veroeros dolor</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Dolor sit amet</h3>
											<p>Sed vitae justo condimentum</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Feugiat veroeros</h3>
											<p>Phasellus sed ultricies mi congue</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Etiam sed consequat</h3>
											<p>Porta lectus amet ultricies</p>
										</a>
									</li>
								</ul>
							</section>

						<!-- Actions -->
							<section>
								<ul class="actions stacked">
									<li><a href="#" class="button large fit">Log In</a></li>
								</ul>
							</section>

					</section>

		<!-- Main -->
		<div id="main">
			<div class="box_section">
				<h2 style="padding: 20px 0px 10px 0px">
					<img width="35px"
						src="https://static.toss.im/3d-emojis/u1F389_apng.png" />
					결제 성공
				</h2>

				<p id="paymentKey"></p>
				<p id="orderId"></p>
				<p id="amount"></p>
			</div>
		</div>

		<!-- Sidebar -->
					<section id="sidebar">

						<!-- Intro -->


						<!-- Mini Posts -->
							<section>
								<div class="mini-posts">

									<!-- Mini Post -->
										

								</div>
							</section>

						<!-- Posts List -->
			

						<!-- About -->
							<section class="blurb">
								<h2>About</h2>
								<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod amet placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at phasellus sed ultricies.</p>
								<ul class="actions">
									<li><a href="#" class="button">Learn More</a></li>
								</ul>
							</section>

						<!-- Footer -->
							<section id="footer">
								<ul class="icons">
									<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon solid fa-rss"><span class="label">RSS</span></a></li>
									<li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
								</ul>
								<p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a href="http://unsplash.com">Unsplash</a>.</p>
							</section>

					</section>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>


	<script>
		// 쿼리 파라미터 값이 결제 요청할 때 보낸 데이터와 동일한지 반드시 확인하세요.
		// 클라이언트에서 결제 금액을 조작하는 행위를 방지할 수 있습니다.
		const urlParams = new URLSearchParams(window.location.search);

		// 서버로 결제 승인에 필요한 결제 정보를 보내세요.
		async
		function confirm() {
			var requestData = {
				paymentKey : urlParams.get("paymentKey"),
				orderId : urlParams.get("orderId"),
				amount : urlParams.get("amount"),
			};

			const response = await
			fetch("/confirm", {
				method : "POST",
				headers : {
					"Content-Type" : "application/json",
				},
				body : JSON.stringify(requestData),
			});

			const json = await
			response.json();

			if (!response.ok) {
				// TODO: 결제 실패 비즈니스 로직을 구현하세요.
				console.log(json);
				window.location.href = `/fail?message=${json.message}&code=${json.code}`;
			}

			// TODO: 결제 성공 비즈니스 로직을 구현하세요.
			console.log(json);
		}
		confirm();

		const paymentKeyElement = document.getElementById("paymentKey");
		const orderIdElement = document.getElementById("orderId");
		const amountElement = document.getElementById("amount");

		orderIdElement.textContent = "주문번호: " + urlParams.get("orderId");
		amountElement.textContent = "결제 금액: " + urlParams.get("amount");
		paymentKeyElement.textContent = "paymentKey: "
				+ urlParams.get("paymentKey");
	</script>
</body>
</html>