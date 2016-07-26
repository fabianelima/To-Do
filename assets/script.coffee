$ ->
	$('#container').on 'click', ->
		getLists()

	getLists = ->
		toDos = []
		toDos_str = localStorage.getItem('toDo')

		if toDos_str isnt null then toDos = JSON.parse(toDos_str)
		return toDos

	add = ->
		task = $('#container').val()

		toDos = getLists()
		toDos.push(task)
		localStorage.setItem('toDo', JSON.stringify(toDos))

		show()

		return false

	show = ->
		toDos = getLists()

		html = '<ul>'
		for i in toDos.length
			html += '<li>' + toDos[i] + '<button class="remove" id="' + i + '">x</button></li>'
		html += '</ul>'

		$('#todos').html(html)

		buttons = $('.remove')
		for i in buttons.length
			buttons[i].on 'click', ->
				remove

	remove = ->
		id = $(this).attr('id')
		toDos = getLists()
		toDos.splice(id,1)
		localStorage.setItem('toDo', JSON.stringify(toDos))

		show()

		return false

	$('#add').on 'click', ->
		add
	show()