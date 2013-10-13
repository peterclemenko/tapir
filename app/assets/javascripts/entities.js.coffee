jQuery ->
  oTable = undefined
  oTable = $('#entities').dataTable
    bJQueryUI: true
    sPaginationType: "scrolling"
    sScrollY: "500px"
    sDom: "<'row-fluid'<'span6'T><'span6'f>r>t<'row-fluid'<'span6'i><'span6'>>S"
    bDeferRender: true
    bProcessing: true
    bServerSide: true
    iDisplayLength: 50
    aaSorting: [ [2,'asc'] ]
    aoColumns: [
      { "sTitle": "Type", "sWidth": "20%" },
      { "sTitle": "Name", "sWidth": "50%" },
      { "sTitle": "Updated At", "sWidth": "30%" }]
    sAjaxSource: $('#entities').data('source')
    oTableTools: {
      sRowSelect: "multi",
      sSwfPath: "swf/copy_csv_xls_pdf.swf",
      aButtons: [ "select_all", "select_none", "copy",
          {
            sExtends:    "collection",
            sButtonText: "Save",
            aButtons:    [ "csv", "xls", "pdf" ]
          }
        ]
    }