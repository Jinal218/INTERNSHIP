tinymce.init({
  selector: 'textarea#basic-example',
  height: 300,
  menubar: false,
  plugins: [
    'advlist autolink lists link image charmap print preview anchor',
    'searchreplace visualblocks code fullscreen',
    'insertdatetime media table paste code help wordcount',
  ],
  toolbar: 'undo redo | formatselect | ' +
    'bold italic underline strikethrough subscript superscript backcolor | alignleft aligncenter ' +
    'border-style border-width'+
    'alignright alignjustify | bullist numlist outdent indent | ' +
    'removeformat | help',
  content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
});
