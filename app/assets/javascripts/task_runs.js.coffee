jQuery ->
  $('#task_runs').dataTable
    sDom: "<'row'<'span8'l><'span8'f>r>t<'row'<'span8'i><'span8'p>>"
    bJQueryUI: true
    sPaginationType: "scrolling"
    sScrollY: "500px"
    sDom: "frtiS"
    bDeferRender: true
    bProcessing: true
    bServerSide: true
    iDisplayLength: 50
    aaSorting: [ [0,'desc'] ],
    aoColumns: [
      { "sTitle": "Name", "sWidth": "100%" },
    ]
    sAjaxSource: $('#task_runs').data('source')