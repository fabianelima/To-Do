(function() {
  $(function() {
    var i, teste;
    i = 0;
    teste = {
      teste1: 'testetes testes',
      teste2: 'lçdkgjçidjlk'
    };
    $('.add-list').on('click', function() {
      $(this).hide();
      return $('.new-list').show();
    });
    $('.new-list .ok').on('click', function() {
      if ($('.add-title').val() === '' || $('.add-item').val() === '') {
        return $('.add-item,.add-title').css('background', 'red');
      } else {
        i++;
        localStorage.setItem('list', $('.add-title').val());
        localStorage.setItem('item' + i, $('.add-item').val());
        $('.list h3').html(localStorage.getItem('list'));
        $('.list ul').append('<li>' + localStorage.getItem('item' + i) + '</li>');
        $('.add-title').hide();
        $('.add-item').removeAttr('required');
        $('.add-item').val('');
        $('.list').show();
        localStorage.setItem('teste', teste.teste1);
        return console.log(localStorage.getItem('teste'));
      }
    });
    return $('.sv').on('click', function() {
      $('.lists').show();
      $('.lists').append('<div class="list' + i + '">' + $('.list').html() + '</div>');
      return $('.list').html('');
    });
  });

}).call(this);
