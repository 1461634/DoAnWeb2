//config
var config = {
    pageSize: 5,
    pageIndex: 1
};

var product = {

    //init
    init: function () {
        product.loadData();
        product.registerEvents();
    },

    //events
    registerEvents: function () {
        //active/locked click
        $('.status').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/Admin/Pro/ChangeStatus",
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

            product.loadData(true);
        });

        //add click
        $('#btnAddNew').off('click').on('click', function () {
            $('#modalAddUpdate').modal('show');
            product.resetForm();
        });

        //save click
        $('#btnSave').off('click').on('click', function () {
            product.saveData();
            product.loadData(true);
        });

        //edit click
        $('.btn-edit').off('click').on('click', function () {
            $('#modalAddUpdate').modal('show');
            var id = $(this).data('id');
            product.loadDetails(id);
        });

        //select change
        $('#ddlStatusS').off('change').on('change', function () {
            product.loadData(true);
        });  

        //search click
        $('#btnSearch').off('click').on('click', function () {
            product.loadData(true);
        });

        //enter to search
        $('#txtNameS').off('keypress').on('keypress', function (e) {
            if (e.which === 13) {
                product.loadData(true);
            }
        });

        //reset click
        $('#btnReset').off('click').on('click', function () {
            $('#txtNameS').val('');
            $('#ddlStatusS').val('true');
            product.loadData(true);
        });

        //top 10 best selling products
        $('#Top10').off('click').on('click', function () {
            $('#modalTop10').modal('show');
            product.top10Featured();
        });

        $('.btn-image').off('click').on('click', function () {
            var id = $(this).data('id');
            window.location.href = "/Admin/Img/Index/"+id;
        });
    },

    //load data
    loadData: function (changePageSize) {
        var name = $('#txtNameS').val();
        var status = $('#ddlStatusS').val();
        $.ajax({
            url: '/Admin/Pro/LoadData',
            type: 'GET',
            data: {
                name: name,
                status: status,
                page: config.pageIndex,
                pageSize: config.pageSize
            },
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';
                    var template = $('#data-template').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Id: item.Id,
                            Name: item.Name,
                            Image: item.ImageUrl,
                            Price: item.Price,
                            Quantity: item.Quantity,
                            Sold: item.Sold,
                            Viewed: item.Viewed,
                            Status: item.Status === true ? "<span class=\"label label-success\">Active</span>" : "<span class=\"label label-danger\">Locked</span>"
                        });
                    });
                    $('#tblData').html(html);
                    product.paging(response.total, function () {
                        product.loadData();
                    }, changePageSize);
                    product.registerEvents();
                }
            }
        });
    },

    //pagination method
    paging: function (totalRow, callback, changePageSize) {

        var totalPages = Math.ceil(totalRow / config.pageSize);

        if ($('#pagination a').length === 0 || changePageSize === true) {
            $('#pagination').empty();
            $('#pagination').removeData("twbs-pagination");
            $('#pagination').unbind("page");
        }

        $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            //callback
            onPageClick: function (event, page) {
                config.pageIndex = page;
                setTimeout(callback, 200);
            }
        });
    },

    //reset form method
    resetForm: function () {
        $('#id').val('0');
        $('#name').val('');
        $('#price').val('');
        $('#quantity').val('');
        $('#warranty').val('');
        $('#description').val('');
        $.ajax({
            url: '/Admin/Pro/Brands',
            type: "POST",
            dataType: "json",
            success: function (response) {
                if (response.status === true) {
                    var html = '';
                    var data = response.data;
                    $.each(data, function (i, item) {
                        html += '<option value="' + item.Id + '">' + item.Name + '</option>';
                    });
                    $('#brand').html(html);
                }
            }
        });
        $.ajax({
            url: '/Admin/Pro/Categories',
            type: "POST",
            dataType: "json",
            success: function (response) {
                if (response.status === true) {
                    var html = '';
                    var data = response.data;
                    $.each(data, function (i, item) {
                        html += '<option value="' + item.Id + '">' + item.Name + '</option>';
                    });
                    $('#category').html(html);
                }
            }
        });

        $.ajax({
            url: '/Admin/Pro/Types',
            type: "POST",
            dataType: "json",
            success: function (response) {
                if (response.status === true) {
                    var html = '';
                    var data = response.data;
                    $.each(data, function (i, item) {
                        html += '<option value="' + item.Id + '">' + item.Name + '</option>';
                    });
                    $('#type').html(html);
                }
            }
        });
    },
    
    //load details medthod
    loadDetails: function (id) {
        $.ajax({
            url: '/Admin/Pro/Details',
            data: {
                id: id
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status === true) {
                    var data = response.data;
                    $('#id').val(data.Id);
                    $('#name').val(data.Name);
                    $('#image').val(data.ImageUrl);
                    $('#price').val(data.Price);
                    $('#quantity').val(data.Quantity);
                    $('#warranty').val(data.Warranty);
                    $('#desciption').val(data.Description);
                    $.ajax({
                        url: '/Admin/Pro/Brands',
                        type: "POST",
                        dataType: "json",
                        success: function (response) {
                            if (response.status === true) {
                                var html = '<option value="' + data.BrandId + '">' + data.BrandName + '</option>';
                                var data1 = response.data;
                                $.each(data1, function (i, item) {
                                    html += '<option value="' + item.Id + '">' + item.Name + '</option>';
                                });
                                $('#brand').html(html);
                            }
                        }
                    });
                    $.ajax({
                        url: '/Admin/Pro/Categories',
                        type: "POST",
                        dataType: "json",
                        success: function (response) {
                            if (response.status === true) {
                                var html = '<option value="' + data.CateId + '">' + data.CateName + '</option>';
                                var data2 = response.data;
                                $.each(data2, function (i, item) {
                                    html += '<option value="' + item.Id + '">' + item.Name + '</option>';
                                });
                                $('#category').html(html);
                            }
                        }
                    });

                    $.ajax({
                        url: '/Admin/Pro/Types',
                        type: "POST",
                        dataType: "json",
                        success: function (response) {
                            if (response.status === true) {
                                var html = '<option value="' + data.TypeId + '">' + data.TypeName + '</option>';
                                var data3 = response.data;
                                $.each(data3, function (i, item) {
                                    html += '<option value="' + item.Id + '">' + item.Name + '</option>';
                                });
                                $('#type').html(html);
                            }
                        }
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
    },

    //save data method
    saveData: function () {
        var formData = new FormData();
        var totalFiles = document.getElementById("File1").files.length;
        for (var i = 0; i < totalFiles; i++) {
            var file = document.getElementById("File1").files[i];
            formData.append("imageFile", file);
        }
        formData.append("name", $("#name").val());
        formData.append("id", parseInt($("#id").val()));
        formData.append("price", $("#price").val());
        formData.append("brand", $("#brand").val());
        formData.append("category", $("#category").val());
        formData.append("type", $("#type").val());
        formData.append("quantity", $("#quantity").val());
        formData.append("warranty", $("#warranty").val());
        formData.append("description", $("#description").val());
        $.ajax({
            type: "POST",
            url: '/Admin/Pro/SaveData',
            data: formData,
            dataType: 'json',
            contentType: false,
            processData: false,
            success: function (response) {
                if (response.status === true) {
                    $('#modalAddUpdate').modal('hide');
                    bootbox.alert("Saved Successfully", function () {
                        product.loadData(true);
                    });
                }
                else {
                    bootbox.alert(response.message);
                }
            }
        });

    },

    top10Featured: function () {
        $.ajax({
            url: '/Admin/Pro/Top10Featured',
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';
                    var template = $('#data-template2').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Name2: item.Name,
                            Image2: item.ImageUrl,
                            Quantity2: item.Quantity,
                            Sold2: item.Sold
                        });

                    });
                    $('#tblData2').html(html);
                }
            }
        });
    }
};

product.init();