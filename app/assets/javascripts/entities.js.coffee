jQuery ->

  oTable = undefined

  $("#entities").submit ->
    sData = $("input", oTable.fnGetNodes()).serialize()
    alert "The following data would have been submitted to the server: \n\n" + sData
    false

  oTable = $('#entities').dataTable
    bJQueryUI: true
    sPaginationType: "bootstrap"
    sDom: "<'row-fluid'<'span6'T><'span6'f>r>t<'row-fluid'<'span6'i><'span6'>>p"
    bDeferRender: true
    bProcessing: true
    bServerSide: true
    iDisplayLength: 20
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
