$ ->

	#URLを判定して白化するコードを選定する
	if location.pathname.match(/^\/staffs\/[0-9]/)
		staff_id = $("#staff_id").val()
		$.get("/staffs/#{staff_id}.json",{},(data)->
			console.log	data.staff
			console.log	data.works
		)
