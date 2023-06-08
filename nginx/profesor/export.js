function generatePDF() {
    var element = document.querySelector('.table');
    var opt = {
      margin: 0.5,
      filename: 'boletin_notas.pdf',
      image: { type: 'jpeg', quality: 0.98 },
      html2canvas: { scale: 2 },
      jsPDF: { unit: 'in', format: 'letter', orientation: 'landscape' },
    };
  
    html2pdf().from(element).set(opt).save();
  }
  
  
  function generateExcel() {
    var table = document.querySelector('.table');
    var workbook = XLSX.utils.table_to_book(table);
    var excelBuffer = XLSX.write(workbook, { bookType: 'xlsx', type: 'array' });
  
    saveAsExcelFile(excelBuffer, 'boletin_notas.xlsx');
  }
  
  function saveAsExcelFile(buffer, fileName) {
    var data = new Blob([buffer], { type: 'application/octet-stream' });
  
    if (typeof navigator.msSaveBlob !== 'undefined') {
      // IE 10+
      navigator.msSaveBlob(data, fileName);
    } else {
      // Other browsers
      var link = document.createElement('a');
      link.href = window.URL.createObjectURL(data);
      link.download = fileName;
      link.style.display = 'none';
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    }
  }
  