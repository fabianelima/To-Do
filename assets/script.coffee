$ ->
	i = 0;

	teste = {
		teste1: 'testetes testes',
		teste2: 'lçdkgjçidjlk'
	}

	$('.add-list').on 'click', ->
		$(this).hide()
		$('.new-list').show()

	$('.new-list .ok').on 'click', ->
		if $('.add-title').val() == '' or $('.add-item').val() == ''
			$('.add-item,.add-title').css('background','red')
		else
			i++
			localStorage.setItem('list', $('.add-title').val())
			localStorage.setItem('item' + i, $('.add-item').val())
			$('.list h3').html(localStorage.getItem('list'))
			$('.list ul').append('<li>' + localStorage.getItem('item' + i) + '</li>')
			$('.add-title').hide()
			$('.add-item').removeAttr('required')
			$('.add-item').val('')
			$('.list').show()
			# teste
			localStorage.setItem('teste', teste.teste1)
			console.log(localStorage.getItem('teste'))

	$('.sv').on 'click', ->
		$('.lists').show()
		$('.lists').append('<div class="list' + i + '">' + $('.list').html() + '</div>') # talvez salvar isso num json funcione
		$('.list').html('')