
var image = {
    init: function () {
        image.loadData();
        image.registerEvents();
    },

    registerEvents: function () {

        $('.status').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/Admin/Img/ChangeStatus",
                data: { id: id },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    console.log(response);
                    if (response.status === true) {
                        btn.text('Active');
                    }
                    else {
                        btn.text('Locked');
                    }
                }
            });
            image.loadData();
        });

        $('#status').off('change').on('change', function () {
            image.loadData();
        });
        //add click
        $('#btnAddNew').off('click').on('click', function () {
            $('#modalAddUpdate').modal('show');
        });

        //save click
        $('#btnSave').off('click').on('click', function () {
            var id = $(this).data('id');
            image.saveData(id);
            image.loadData();
        });

        //edit click
        $('.btn-edit').off('click').on('click', function () {
            $('#modalAddUpdate').modal('show');
            var id = $(this).data('id');
            image.loadDetails(id);
        });
    },

    //load data method
    loadData: function () {
        var id = $('#btnAddNew').data('id');
        var status = $('#status').val();
        $.ajax({
            url: '/Admin/Img/LoadData',
            data: {
                id: id,
                status
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status === true) {
                    var data = response.data;
                    var html = '';
                    var template = $('#data-template').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Id: item.Id,
                            Image: item.ImageUrl,
                            ProId: item.ProductId,
                            Status: item.Status === true ? "<span class=\"label label-success\">Active</span>" : "<span class=\"label label-danger\">Locked</span>"
                        });
                    });
                    $('#tblData').html(html);
                    image.registerEvents();
                }
                else {
                    bootbox.alert(response.message);
                }
            }
        });
    },

    loadDetails: function (id) {
        $.ajax({
            url: '/Admin/Img/LoadDetails',
            data: {
                id: id
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status === true) {
                    var data = response.data;
                    $('#imgId').val(data.Id);
                    $('#image').prop('src', data.ImageUrl);
                }
                else {
                    bootbox.alert(response.message);
                }
            },
            error: function (err) {
                console.log(err);
            }
        });
    },

    saveData: function (id) {
        var formData = new FormData();
        var totalFiles = document.getElementById("imgUrl").files.length;
        for (var i = 0; i < totalFiles; i++) {
            var file = document.getElementById("imgUrl").files[i];
            formData.append("imageFile", file);
        }
        formData.append("proId", id);
        formData.append("imgId", parseInt($('#imgId').val()));
        $.ajax({
            url: '/Admin/Img/SaveData',
            data: formData,
            type: 'POST',
            dataType: 'json',
            contentType: false,
            processData: false,
            success: function (response) {
                if (response.status === true) {
                    $('#modalAddUpdate').modal('hide');
                    bootbox.alert("Saved Successfully", function () {
                        image.loadData();
                    });
                }
                else {
                    bootbox.alert(response.message);
                }
            },
            error: function (err) {
                console.log(err);
            }
        });
    }
};

image.init();