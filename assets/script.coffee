$ ->
	$('#container').on 'click', ->
		localStorage.setItem('item', 'teste')
		$('.blob').html(localStorage.getItem('item'))