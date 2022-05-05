function download() {
    axios({
          url: '../files/Entrada por XML.pdf',
          method: 'GET',
          responseType: 'blob'
    })
          .then((response) => {
                const url = window.URL
                      .createObjectURL(new Blob([response.data]));
                const link = document.createElement('a');
                link.href = url;
                link.setAttribute('download', 'image.pdf');
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
          })
}
