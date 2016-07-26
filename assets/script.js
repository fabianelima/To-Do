(function() {
  $(function() {
    var add, getLists, remove, show;
    $('#container').on('click', function() {
      return getLists();
    });
    getLists = function() {
      var toDos, toDos_str;
      toDos = [];
      toDos_str = localStorage.getItem('toDo');
      if (toDos_str !== null) {
        toDos = JSON.parse(toDos_str);
      }
      return toDos;
    };
    add = function() {
      var task, toDos;
      task = $('#container').val();
      toDos = getLists();
      toDos.push(task);
      localStorage.setItem('toDo', JSON.stringify(toDos));
      show();
      return false;
    };
    show = function() {
      var buttons, html, i, toDos, _i, _j, _len, _len1, _ref, _ref1, _results;
      toDos = getLists();
      html = '<ul>';
      _ref = toDos.length;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        i = _ref[_i];
        html += '<li>' + toDos[i] + '<button class="remove" id="' + i + '">x</button></li>';
      }
      html += '</ul>';
      $('#todos').html(html);
      buttons = $('.remove');
      _ref1 = buttons.length;
      _results = [];
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        i = _ref1[_j];
        _results.push(buttons[i].on('click', function() {
          return remove;
        }));
      }
      return _results;
    };
    remove = function() {
      var id, toDos;
      id = $(this).attr('id');
      toDos = getLists();
      toDos.splice(id, 1);
      localStorage.setItem('toDo', JSON.stringify(toDos));
      show();
      return false;
    };
    $('#add').on('click', function() {
      return add;
    });
    return show();
  });

}).call(this);
