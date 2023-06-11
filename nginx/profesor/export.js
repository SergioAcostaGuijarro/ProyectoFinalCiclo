var evaluacionSelect = document.getElementById("evaluacion");
var evaluacionValue = evaluacionSelect.value;

function generatePDF() {
  var element = document.querySelector('.table');
  var select = document.getElementById('evaluacion');
  var evaluacion = select.options[select.selectedIndex].text;
  var fileName = 'Boletin_' + evaluacion + '.pdf';

  var opt = {
    margin: 0.5,
    filename: fileName,
    image: { type: 'jpeg', quality: 0.98 },
    html2canvas: { scale: 2 },
    jsPDF: { unit: 'in', format: 'letter', orientation: 'landscape' },
  };

  html2pdf().from(element).set(opt).save();
}

function generateExcel() {
  var table = document.querySelector('.table');
  var select = document.getElementById('evaluacion');
  var evaluacion = select.options[select.selectedIndex].text;
  var fileName = 'Boletin_' + evaluacion + '.xlsx';

  var workbook = XLSX.utils.table_to_book(table);
  var excelBuffer = XLSX.write(workbook, { bookType: 'xlsx', type: 'array' });

  saveAsExcelFile(excelBuffer, fileName);
}

function saveAsExcelFile(buffer, fileName) {
  var blob = new Blob([buffer], { type: 'application/octet-stream' });
  saveAs(blob, fileName);
}

function saveAs(blob, fileName) {
  var url = window.URL.createObjectURL(blob);
  var anchorElement = document.createElement('a');
  anchorElement.href = url;
  anchorElement.download = fileName;
  anchorElement.click();
  window.URL.revokeObjectURL(url);
}


