###
		To-Do App 0.1
		-----------------------------------------------
		Fabiane Lima 2016
		Feito em CoffeScript. Baseado no tutorial do Code Maven: http://code-maven.com/todo-in-html-and-javascript

		=> Known issues:
			- O 'for' que exibe os 'todos' não estava funcionando; por algum motivo ele não sabe lidar com 'for i in todos.length', tive que fazer um xunxo.
			- É muito bizarra a forma como o CoffeeScript compila os 'for', preciso ver a forma alternativa que o Aléssio sugeriu.
			- Não sei se ele está compilando em JS direito, ele suja muito o código.
			- O Coffee bota 'return' em tudo, inclusive no início da função de clique do botão [equivalente a 'addEventListener()' no JS puro, '.on('click')' no jQuery].
			- Ele não imprime os 'todos' que já existem no localStorage; ver como fazer isso.
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
		todos = getTodos()
		showtodo = '<ul>'
		j = todos.length
		for i in [0...j]
			showtodo += '<li>' + todos[i] + '</li>'
		showtodo += '</ul>'
		$('.todos').html(showtodo)
		return

	### evento clique ###
	$('.add').on 'click', ->
		add()
		show()
		return