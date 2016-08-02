###
		To-Do App 0.1
		-----------------------------------------------
		Fabiane Lima 2016
		Feito em CoffeScript. Baseado no tutorial do Code Maven: http://code-maven.com/todo-in-html-and-javascript

		=> Known issues:
			- O 'for' que exibe os 'todos' não estava funcionando; por algum motivo ele não sabe lidar com 'for i in todos.length', tive que fazer um xunxo.
			- É muito bizarra a forma como o CoffeeScript compila os 'for', preciso ver a forma alternativa que o Aléssio sugeriu.

		=> Futuros features:
			- Fazer o botão de remove ficar visível só quando o mouse passa em cima da task
			- Impedir uso de tags HTML [validar formulario]
			- Enriquecer a interface, permitindo que mais listas sejam criadas [talvez um daqueles features que não vão ser implementados nunca, mas fica aqui na lista só pra constar pois vai que....
			- Ver se ele está pegando direitinho qual botão de remove é clicado [acabei de ver sem querer que quando se intenta deletar um item, ele deleta outro]
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
		if task == '' or task == null then alert('Campo vazio!')
		# acrescentar aqui um validador de campo que impede uso de tags
		else
			todos.push task
			localStorage.setItem('todo', JSON.stringify(todos))
			show()
		return false

	### remove itens ###
	remove = ->
		id = $(this).attr('id')
		todos = getTodos()
		todos.splice(id,1)
		console.log(todos.splice(id,1))
		localStorage.setItem('todo', JSON.stringify(todos))
		show()
		return false

	### exibe a lista de to-dos ###
	show = ->
		todos = getTodos()

		showtodo = '<ul>'
		j = todos.length
		for i in [0...j]
			showtodo += '<li>' + todos[i] + '<button class="remove" id="' + i + '">&times;</button></li>'
		showtodo += '</ul>'
		
		$('.todos').html(showtodo)
		return

	### evento add item no to-do ###
	$('.add').on 'click', ->
		add()
		show()
		$('.task').val('')
		return

	### Essa função ainda precisa ser revista porque ela deleta várias 
	coisas ao mesmo tempo, mas por enquanto é o que tá mais próximo de
	funcionar ###
	$(document).on 'click', '.remove', ->
		$(this).parent().remove()
		return

	show()