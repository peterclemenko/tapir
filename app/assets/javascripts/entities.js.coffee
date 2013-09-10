jQuery ->
  $('#entities').dataTable
    sDom: "<'row'<'span8'l><'span8'f>r>t<'row'<'span8'i><'span8'p>>"
    bJQueryUI: true
    sPaginationType: "scrolling"
    sScrollY: "400px"
    sDom: "frtiS"
    bDeferRender: true
    bProcessing: true
    bServerSide: true
    iDisplayLength: 100
    aaSorting: [ [0,'asc'], [1,'asc'] ],
    aoColumns: [
      { "sTitle": "", "sWidth": "2%" }, 
      { "sTitle": "Type", "sWidth": "10%" },
      { "sTitle": "Name", "sWidth": "84%" }
    ]   
    sAjaxSource: $('#entities').data('source')