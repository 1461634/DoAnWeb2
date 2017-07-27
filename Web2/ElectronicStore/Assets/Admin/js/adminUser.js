var config = {
    pageSize: 3,
    pageIndex: 1
};

var user = {
    init: function () {
        user.loadData();
        user.registerEvent();
    },
    registerEvent: function () {
        
        //edit click
        $('.btn-edit').off('click').on('click', function () {
            $('#modalAddUpdate').modal('show');
            
            var id = $(this).data('id');
            user.loadDetails(id);
        });

        //save click
        $('#btnSave').off('click').on('click', function () {
            user.saveData();
            user.loadData(true);
        });

        //delete click
        $('.btn-delete').off('click').on('click', function () {
            var id = $(this).data('id');
            bootbox.confirm("Are you sure want to delete this record?", function (result) {
                user.deleteUser(id);
            });
        });

        //select change
        $('#ddlStatusS').off('change').on('change', function () {
            order.loadData(true);
        });

        //search click
        $('#btnSearch').off('click').on('click', function () {
            user.loadData(true);
        });

        //enter to search
        $('#txtNameS').off('keypress').on('keypress', function (e) {
            if (e.which === 13) {
                user.loadData(true);
            }
        });

        //reset click
        $('#btnReset').off('click').on('click', function () {
            $('#txtNameS').val('');
            $('#ddlStatusS').val('User');
            user.loadData(true);
        });
    },

    //delete method
    deleteUser: function (id) {
        $.ajax({
            url: '/Admin/User/Delete',
            data: {
                id: id
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status === true) {
                    bootbox.alert("Deleted Successfully", function () {
                        user.loadData(true);
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

    //load details medthod
    loadDetails: function (id) {
        $.ajax({
            url: '/Admin/User/Details',
            data: {
                id: id
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status === true) {
                    var data = response.data;
                    $('#hidID').val(data.Id);
                    $('#firstName').val(data.FirstName);
                    $('#lastName').val(data.LastName);
                    $('#phone').val(data.PhoneNumber);
                    $('#address').val(data.Address);
                    $.getJSON('/Admin/User/Roles', {}, function (roles) {
                        var list = $('select#roles');
                        list.find('option').remove();
                        list.append('<option value="' + data.RoleId + '">' + data.Role + '</option>');
                        $(roles).each(function (index, role) {
                            list.append('<option value="' + role.id + '">' + role.name + '</option>');
                        });
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
        var firstName = $('#firstName').val();
        var id = $('#hidID').val();
        var lastName = $('#lastName').val();
        var address = $('#address').val();
        var phone = $('#phone').val();
        var role = $('#roles').val();
        var user = {
            FirstName: firstName,
            LastName: lastName,
            Address: address,
            PhoneNumber: phone,
            Id: id
        };
        $.ajax({
            url: '/Admin/User/SaveData',
            data: {
                strUser: JSON.stringify(user),
                role: role
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status === true) {
                    $('#modalAddUpdate').modal('hide');
                    bootbox.alert("Saved Successfully");
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

    //load data method
    loadData: function (changePageSize) {
        var name = $('#txtNameS').val();
        var status = $('#ddlStatusS').val();
        $.ajax({
            url: '/Admin/User/LoadData',
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
                            Email: item.Email,
                            FirstName: item.FirstName,
                            LastName: item.LastName,
                            Address: item.Address,
                            Phone: item.PhoneNumber
                        });

                    });
                    $('#tblData').html(html);
                    user.paging(response.total, function () {
                        user.loadData();
                    }, changePageSize);
                    user.registerEvent();
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
    }
};

user.init();