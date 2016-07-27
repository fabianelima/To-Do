
/*
		To-Do App 0.1
		-----------------------------------------------
		Fabiane Lima 2016
		Feito em CoffeScript. Baseado no tutorial do Code Maven: http://code-maven.com/todo-in-html-and-javascript
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
      var i, showtodo, todos, _i, _len, _ref;
      todos = getTodos;
      showtodo = '<ul>';
      _ref = todos.length;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        i = _ref[_i];
        showtodo += '<li>' + todos[i] + '</li>';
      }
      showtodo += '</ul>';
      return $('.todos').html(showtodo);
    };
    return $('.add').on('click', function() {
      add();
      return show();
    });
  });

}).call(this);
