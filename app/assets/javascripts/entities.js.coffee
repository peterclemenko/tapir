jQuery ->
  $('#entities').dataTable
    bJQueryUI: true
    sPaginationType: "scrolling"
    sScrollY: "500px"
    sDom: "<'row-fluid'<'span6'T><'span6'f>r>t<'row-fluid'<'span6'i><'span6'>>"
    bDeferRender: true
    bProcessing: true
    bServerSide: true
    iDisplayLength: 100
    aaSorting: [ [0,'asc'], [1,'asc'] ]
    aoColumns: [
      { "sTitle": "Type", "sWidth": "30%" },
      { "sTitle": "Name", "sWidth": "70%" }]
    sAjaxSource: $('#entities').data('source')
    oTableTools: {
      sRowSelect: "multi",
      sSwfPath: "media/extras/TableTools/swf/copy_csv_xls_pdf.swf",
      aButtons: [ "select_all", "select_none", "copy",
          {
            sExtends:    "collection",
            sButtonText: "Save",
            aButtons:    [ "csv", "xls", "pdf" ]
          }
        ]
    }
