var config = {
    pageSize: 3,
    pageIndex: 1
};

var order = {
    init: function () {
        order.loadData();
        order.registerEvent();
    },

    registerEvent: function () {

        $('.status').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/Admin/Order/ChangeStatus",
                data: { id: id },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    console.log(response);
                    if (response.status === 0) {
                        btn.text('Waiting');
                    }
                    else if (response.status === 1) {
                        btn.text('Delivering');
                    }
                    else {
                        btn.text('Delivered');
                    }
                }
            });
            order.loadData(true);
        });

        $('#ddlStatusS').off('change').on('change', function () {
            order.loadData(true);
        });

        $('.details').off('click').on('click', function () {
            $('#modalOrderDetails').modal('show');
            var id = $(this).data('id');
            order.loadDetails(id);
        });
    },

    //load data method
    loadData: function (changePageSize) {
        var status = $('#ddlStatusS').val();
        $.ajax({
            url: '/Admin/Order/LoadData',
            type: 'GET',
            data: {
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
                            Phone: item.Phone,
                            Address: item.Address,
                            Email: item.Email,
                            Total: item.Total,
                            Date: order.convertedDate(item.OrderDate),
                            Status: item.Status === 0 ? "<span class=\"label label-info\">Waiting</span>" : item.Status === 1 ? "<span class=\"label label-primary\">Delivering</span>" : "<span class=\"label label-success\">Delivered</span>"
                        });

                    });
                    $('#tblData').html(html);
                    order.paging(response.total, function () {
                        order.loadData();
                    }, changePageSize);
                    order.registerEvent();
                }
            }
        });
    },

    //load order details
    loadDetails: function (id) {
        $.ajax({
            url: '/Admin/Order/Details',
            data: {
                id: id
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status === true) {
                    var data = response.data;
                    var html = '';
                    var template = $('#data-template2').html();
                    $.each(data, function (index, item) {
                        html += Mustache.render(template, {
                            idProduct: item.Id,
                            Title: item.Name,
                            Image: item.ImageUrl,
                            Count: item.Quantity
                        });
                    });
                    $('#tblData2').html(html);
                }

            }

        });
    },

    //convert date
    convertedDate: function (strDate) {
        var dateString = strDate.substr(6, 13);
        var currentTime = new Date(parseInt(dateString));
        var month = currentTime.getMonth() + 1;
        var day = currentTime.getDate();
        var year = currentTime.getFullYear();
        var date = day + "/" + month + "/" + year;
        return date;
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

order.init();