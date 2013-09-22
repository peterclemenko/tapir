jQuery ->
  $('#entities').dataTable
    bJQueryUI: true
    sPaginationType: "scrolling"
    sScrollY: "500px"
    sDom: "<'row'<'span8'l><'span8'f>r>t<'row'<'span8'i><'span8'>>S"
    bDeferRender: true
    bProcessing: true
    bServerSide: true
    iDisplayLength: 100
    aaSorting: [ [0,'asc'], [1,'asc'] ]
    aoColumns: [
      { "sTitle": "Type", "sWidth": "30%" },
      { "sTitle": "Name", "sWidth": "70%" }
    ]
    sAjaxSource: $('#entities').data('source')
    oTableTools: {
        "sRowSelect": "multi",
        "aButtons": [ "copy",
                      "print",
                      "select_all",
                      "select_none",
                      {
                        "sExtends":    "collection",
                        "sButtonText": 'Save <span class="caret" />',
                        "aButtons":    [ "csv", "xls", "pdf" ]
                      }
                    ]
    }

