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
			- Se coloco o 'remove()' dentro do 'show()', como no tutorial que estou seguindo, dá um erro de exceção do jQuery. Vou ver como ele compila isso.
			- Cada vez que atualizo a página, ele remove um item da lista. o_O
			- Aceita strings vazias.
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

	### remove itens ###
	remove = ->
		id = $(this).attr('id')
		todos = getTodos()
		todos.splice(id,1)
		localStorage.setItem('todo', JSON.stringify(todos))
		show()
		return false

	### exibe a lista de to-dos ###
	show = ->
		todos = getTodos()

		showtodo = '<ul>'
		j = todos.length
		for i in [0...j]
			showtodo += '<li>' + todos[i] + '<button class="remove" >&times;</button></li>'
		showtodo += '</ul>'
		
		$('.todos').html(showtodo)

		buttons = $('.remove')					# aqui rola uma jQuery exception
		l = buttons.length
		console.log(buttons[0])
		###for k in [0...l]
			buttons[k].on 'click', ->
				remove###
		return

	### evento add item no to-do ###
	$('.add').on 'click', ->
		add()
		return


	show()