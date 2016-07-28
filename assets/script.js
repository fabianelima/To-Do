
/*
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
 */

(function() {
  $(function() {

    /* função que pega as to-do lists */
    var add, getTodos, show;
    getTodos = function() {
      var todos, todos_str;
      todos = [];
      todos_str = localStorage.getItem('todo');
      if (todos_str !== null) {
        todos = JSON.parse(todos_str);
      }
      return todos;
    };

    /* adiciona um novo item à to-do list */
    add = function() {
      var task, todos;
      task = $('.task').val();
      todos = getTodos();
      todos.push(task);
      localStorage.setItem('todo', JSON.stringify(todos));
      show();
      return false;
    };

    /* exibe a lista de to-dos */
    show = function() {
      var i, j, showtodo, todos, _i;
      todos = getTodos();
      showtodo = '<ul>';
      j = todos.length;
      for (i = _i = 0; 0 <= j ? _i < j : _i > j; i = 0 <= j ? ++_i : --_i) {
        showtodo += '<li>' + todos[i] + '</li>';
      }
      showtodo += '</ul>';
      $('.todos').html(showtodo);
    };

    /* evento clique */
    return $('.add').on('click', function() {
      add();
      show();
    });
  });

}).call(this);
