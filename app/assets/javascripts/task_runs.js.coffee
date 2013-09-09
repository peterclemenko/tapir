# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#task_runs').dataTable
    sDom: "<'row'<'span8'l><'span8'f>r>t<'row'<'span8'i><'span8'p>>"
    bJQueryUI: true
    sPaginationType: "scrolling"
    sScrollY: "500px"
    sDom: "frtiS"
    bDeferRender: true
    bProcessing: true
    bServerSide: false
    iDisplayLength: 50
    aaSorting: [ [0,'asc'] ],
    aoColumns: [
      { "sTitle": "Name", "sWidth": "100%" },
    ]   
    sAjaxSource: $('#task_runs').data('source')