# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	#localStorage.clear()
	
	writeConsole = (text) ->
		p = $('</p>')
			.text(text)
			.appendTo($('div#console'))
	
	refreshList = (newItems) ->
		for country in newItems
			li = $('<li/>')
				.appendTo($('ul#list'))
			aaa = $('<a/>')
				.text(country.title)
				.appendTo(li)

	addAlert = (msg) ->
		div = $('<div/>')
			.attr('class', 'alert alert-success')
			.prependTo($('div#content'))
		button = $('<button>')
			.attr('type', 'button')
			.attr('class', 'close')
			.attr('data-dismiss', 'alert')
			.text('x')		
			.appendTo(div)
		text = $('<span><strong>Note:</strong>' + msg + '</span>')
			.appendTo(div)

	writeConsole "Page loaded at " + (new Date).toLocaleTimeString()
	
	# Refresh the todo list
	$.getJSON '/items.json', (data) -> 
		refreshList data			  
	
	localStorage.setItem('list_id', "1jf7sn47rbc6rg4k")
	writeConsole "List ID : " + localStorage.getItem("list_id")
	
	if(navigator.onLine)
		$("#header").css("background-color", "#fdd")
		$("#header").text("You are now online")
		addAlert("You are now online")
	else
		$("#header").css("background-color", "#faa")
		$("#header").text("You are now offline")
		addAlert("You are now offline")
	
	# Enumerate local storage
	#for k in Object.keys(localStorage)
	#	writeConsole k + " : " + localStorage[k]
	
	$(window).bind 'online', ->
		$("#header").css("background-color", "#fdd")
		$("#header").text("You are now online")
		writeConsole "Went online at " + (new Date).toLocaleTimeString()
		addAlert("You are now online")
		
	$(window).bind 'offline', ->
		$("#header").css("background-color", "#faa")
		$("#header").text("You are now offline")
		writeConsole "Went offline at " + (new Date).toLocaleTimeString()
		addAlert("You are now offline")
		