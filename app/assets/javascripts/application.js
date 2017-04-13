// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs 
//= require turbolinks
//= require highcharts/highcharts
//= require bootstrap-sprockets
//= require_tree .

$( document ).on('turbolinks:load', function() {

	$('#form_expense').hide();

  	$('#btn_expense').on('click', function(){
		$('#form_expense').slideToggle(200);
	});
// --------
	$('#form_expense_categories').hide();
	
  	$('#btn_expense_categories').on('click', function(){
		$('#form_expense_categories').slideToggle(200);
	});
// ----------
	$('#form_income').hide();
	
  	$('#btn_income').on('click', function(){
		$('#form_income').slideToggle(200);
	});
// ----------
	$('#form_income_categories').hide();
	
  	$('#btn_income_categories').on('click', function(){
		$('#form_income_categories').slideToggle(200);
	});

});
