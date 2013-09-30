jQuery ->

  oTable = undefined
  oTable = $('#entities').dataTable
    bJQueryUI: true
    sPaginationType: "scrolling"
    sScrollY: "500px"
    sDom: "<'row-fluid'<'span6'T><'span6'f>r>t<'row-fluid'<'span6'i><'span6'>>S"
    bDeferRender: true
    bProcessing: true
    bServerSide: false
    iDisplayLength: 50
    aaSorting: [ [0,'asc'], [1,'asc'] ]
    aoColumns: [
      { "sTitle": "Type", "sWidth": "25%" },
      { "sTitle": "Name", "sWidth": "75%" }]
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