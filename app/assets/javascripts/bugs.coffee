# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	status = $('#bug_status').html()
	$('#bug_bug_type').change -> 
		bugType = $('#bug_bug_type :selected').text()
		if bugType != "Bug"
			options = $("#bug_status option")
			options[2].text = "completed"
		else

