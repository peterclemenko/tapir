jQuery ->
  $('#task_run_sets').dataTable
    sDom: "<'row'<'span8'l><'span8'f>r>t<'row'<'span8'i><'span8'p>>"
    bJQueryUI: true
    sPaginationType: "scrolling"
    sScrollY: "500px"
    sDom: "frtiS"
    bDeferRender: true
    bProcessing: true
    bServerSide: false
    iDisplayLength: 50
    aaSorting: [ [0,'desc'] ],
    aoColumns: [
      { "sTitle": "Name", "sWidth": "20%" },
      { "sTitle": "Tasks", "sWidth": "70%" },
      { "sTitle": "Completed", "sWidth": "10%" },

    ]
    sAjaxSource: $('#task_run_sets').data('source')