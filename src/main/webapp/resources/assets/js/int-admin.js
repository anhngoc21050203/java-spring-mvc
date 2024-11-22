$(document).ready(function () {
    CKEDITOR.config.allowedContent = true;
    CKEDITOR.editorConfig = function (config) {
        config.protectedSource.push(/<i[^>]*><\/i>/g);
        config.enterMode = CKEDITOR.ENTER_BR;
    };
    CKEDITOR.dtd.$removeEmpty['i'] = false;

    const editorIds = ['description'];

    editorIds.forEach(id => {
        if (document.getElementById(id)) {
            setupCKEditor(id);
            if (CKEDITOR.instances[id]) {
                CKEDITOR.instances[id].on('paste', function (evt) {
                    setTimeout(function () {
                        var content = CKEDITOR.instances[id].getData();
                        var tempDiv = document.createElement('div');
                        tempDiv.innerHTML = content;

                        var elementsWithFont = tempDiv.querySelectorAll('[style*="font-family"]');
                        elementsWithFont.forEach(function (element) {
                            element.style.fontFamily = '';
                        });

                        var allElements = tempDiv.querySelectorAll('*');
                        allElements.forEach(function (element) {
                            element.style.fontSize = '18px';
                        });

                        CKEDITOR.instances[id].setData(tempDiv.innerHTML);
                    }, 0);
                });
            }
        }
    });

    function setupCKEditor(elementId) {
        CKEDITOR.replace(elementId, {
            filebrowserBrowseUrl: '/assets/vendors/ckfinder/ckfinder.html',
            filebrowserUploadUrl: '/assets/vendors/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
            filebrowserWindowWidth: '1000',
            filebrowserWindowHeight: '700',
        });
    }

    // Xem trước hình ảnh
    $('#image_url').change(function (event) {
        let files = event.target.files;
        let previewContainer = $('#image_preview');
        previewContainer.empty();

        if (files.length > 0 && files[0].type.startsWith('image/')) {
            let reader = new FileReader();
            reader.onload = function (e) {
                let img = $('<img>', {
                    src: e.target.result,
                    class: 'img-thumbnail',
                    style: 'max-width: 150px;'
                });
                previewContainer.append(img);
            };
            reader.readAsDataURL(files[0]);
        }
    });
});