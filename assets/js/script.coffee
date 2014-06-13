jQuery ($) ->

	# 初期配置
	deg = 0
	transZ = Math.floor($('#box').height() / 2)

	$members = $('#box ul > li')

	liHeight = Math.floor(1200 / $members.length * 100) / 100
	$members.each ->
		$(@).css
			lineHeight: "#{liHeight}px"
			marginTop: "-#{liHeight/2}px"
			transform: "rotateX(#{deg}deg) translateZ(#{transZ})"
			webkitTransform: "rotateX(#{deg}deg) translateZ(#{transZ}px)"

		deg += Math.floor(360 / $members.length)


	# 初期表示をずらす
	randomDeg = Math.floor(Math.random() * 360)
	$('#boxWrap').css
		transform: "rotateX(#{randomDeg}deg)"
		webkitTransform: "rotateX(#{randomDeg}deg)"


	# アニメーション開始
	$('#members').fadeIn(3000)
	$('#box')
		.addClass('reverseList')
		.one 'webkitAnimationEnd animationend', ->
			$(@)
				.removeClass('reverseList')
				.delay(50)
				.queue ->
					pattern = Math.floor(Math.random() * 4) + 1
					$(@)
						.addClass("resetWrap anm#{pattern}")
						.dequeue()
					$(@).find('ul').one 'webkitAnimationEnd animationend', ->
						$('#box').addClass('finish')
