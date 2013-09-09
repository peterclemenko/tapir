jQuery ->
  $('#tasks').dataTable
    sDom: "<'row'<'span8'l><'span8'f>r>t<'row'<'span8'i><'span8'p>>"
    bJQueryUI: true
    sPaginationType: "scrolling"
    sScrollY: "500px"
    sDom: "frtiS"
    bDeferRender: true
    bProcessing: true
    bServerSide: false
    iDisplayLength: 50
    aaSorting: [ [0,'asc'], [1,'asc'] ],
    aoColumns: [
      { "sTitle": "Name", "sWidth": "20%" },
      { "sTitle": "Description", "sWidth": "80%" }
    ]   
    sAjaxSource: $('#tasks').data('source')