//config 
var config = {
    pageSize: 3,
    pageIndex: 1
};

//category object
var category = {
    //initialize method
    init: function () {
        category.loadData();
        category.registerEvent();
    },

    //registerEvent methods
    registerEvent: function () {
        //all events
        //valadate
        $('#frmSaveData').validate({
            rules: {
                txtName: {
                    required: true,
                    minlength: 3
                }
            },
            messages: {
                txtName: {
                    required: "This field is required",
                    minlength: "Name must more than 3 characters"
                }
            }
        });

        //add click
        $('#btnAddNew').off('click').on('click', function () {
            $('#modalAddUpdate').modal('show');
            category.resetForm();
        });

        //save click
        $('#btnSave').off('click').on('click', function () {
            if ($('#frmSaveData').valid()) {
                category.saveData();
            }
        });

        //edit click
        $('.btn-edit').off('click').on('click', function () {
            $('#modalAddUpdate').modal('show');
            var id = $(this).data('id');
            category.loadDetails(id);
        });

        //select change
        $('#ddlStatusS').off('change').on('change', function () {
            category.loadData(true);
        });

        //search click
        $('#btnSearch').off('click').on('click', function () {
            category.loadData(true);
        });

        //enter to search
        $('#txtNameS').off('keypress').on('keypress', function (e) {
            if (e.which === 13) {
                category.loadData(true);
            }
        });

        //reset click
        $('#btnReset').off('click').on('click', function () {
            $('#txtNameS').val('');
            $('#ddlStatusS').val('true');
            category.loadData(true);
        });

        $('.btn-top10').off('click').on('click', function () {
            $('#modalAddUpdate2').modal('show');
            var id = $(this).data('id');
            category.top10Featured(id);
        });
    },

    //load details medthod
    loadDetails: function (id) {
        $.ajax({
            url: '/Admin/Category/Details',
            data: {
                id: id
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status === true) {
                    var data = response.data;
                    $('#hidID').val(data.Id);
                    $('#txtName').val(data.Name);
                    $('#ckStatus').prop('checked', data.Status);
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
        var name = $('#txtName').val();
        var status = $('#ckStatus').prop('checked');
        var id = parseInt($('#hidID').val());
        var cate = {
            Name: name,
            Status: status,
            Id: id
        };
        $.ajax({
            url: '/Admin/Category/SaveData',
            data: {
                strCategory: JSON.stringify(cate)
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status === true) {
                    $('#modalAddUpdate').modal('hide');
                    bootbox.alert("Saved Successfully", function () {                       
                        category.loadData(true);
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

    //reset form method
    resetForm: function () {
        $('#hidID').val('0');
        $('#txtName').val('');
        $('#ckStatus').prop('checked', true);
    },

    //load data method
    loadData: function (changePageSize) {
        var name = $('#txtNameS').val();
        var status = $('#ddlStatusS').val();
        $.ajax({
            url: '/Admin/Category/LoadData',
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
                            Status: item.Status === true ? "<span class=\"label label-success\">Active</span>" : "<span class=\"label label-danger\">Locked</span>"
                        });

                    });
                    $('#tblData').html(html);
                    category.paging(response.total, function () {
                        category.loadData();
                    }, changePageSize);
                    category.registerEvent();
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

    //top 10
    top10Featured: function (id) {
        $.ajax({
            url: '/Admin/Product/Top10FeaturedByCate',
            type: 'GET',
            data: {
                id: id
            },
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';
                    var template = $('#data-template2').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            ProductName: item.Name,
                            Image: item.ImageUrl,
                            Quantity: item.Quantity,
                            Sold: item.Sold
                        });

                    });
                    $('#tblData2').html(html);
                }
            }
        });
    }
};

//initialize
category.init();