# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	status = $('#bug_status').html()
	$('#bug_bug_type').change -> 
		bugType = $('#bug_bug_type :selected').text()
		if bugType == "Bug"
			options = ["one","two","three"]
		else
			options = ["one2","two2","three2"]
		
		$('#bug_status').html(options)


