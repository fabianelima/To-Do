(function() {
  $(function() {
    return $('#container').on('click', function() {
      localStorage.setItem('item', 'teste');
      return $('.blob').html(localStorage.getItem('item'));
    });
  });

}).call(this);
