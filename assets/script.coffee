###
		To-Do App 0.1
		-----------------------------------------------
		Fabiane Lima 2016
		Feito em CoffeScript. Baseado no tutorial do Code Maven: http://code-maven.com/todo-in-html-and-javascript
###

$ ->
	### função que pega as to-do lists ###
	getTodos = ->
		todos = []
		todos_str = localStorage.getItem('todo')
		if todos_str isnt null then todos = JSON.parse(todos_str)
		return todos

	### adiciona um novo item à to-do list ###
	add = ->
		task = $('.task').val()
		todos = getTodos()
		todos.push task
		localStorage.setItem('todo', JSON.stringify(todos))
		show()
		return false

	### exibe a lista de to-dos ###
	show = ->
		todos = getTodos
		showtodo = '<ul>'
		for i in todos.length
			showtodo += '<li>' + todos[i] + '</li>'
		showtodo += '</ul>'
		$('.todos').html(showtodo)

	$('.add').on 'click', ->
		add()
		show()