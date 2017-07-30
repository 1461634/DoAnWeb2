ï»¿//config 
var config = {
    pageSize: 3,
    pageIndex: 1
};

//statistics object
var statistics = {
    //initialize method
    init: function () {
        statistics.loadData();
        statistics.loadData2();
        statistics.loadData3();
        statistics.loadData4();
        statistics.loadData5();
    },

    //convert date
    convertedDate: function (strDate) {
        var currentTime = new Date(parseInt(dateString));
        var month = currentTime.getMonth() + 1;
        var day = currentTime.getDate();
        var year = currentTime.getFullYear();
        var date = day + "/" + month + "/" + year;
        return date;
    },

    //load data method
    loadData: function (changePageSize) {
        $.ajax({
            url: '/Admin/Home/DayStatistics',
            type: 'GET',
            data: {
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
                            Date: statistics.convertedDate(item.FiscalDate),
                            Revenue: item.Revenue
                        });

                    });
                    $('#tblData').html(html);
                    statistics.paging(response.total, function () {
                        statistics.loadData();
                    });
                }
            }
        });
    },

    //pagination method
    paging: function (totalRow, callback) {

        var totalPages = Math.ceil(totalRow / config.pageSize);

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

    //load data method
    loadData2: function (changePageSize) {
        $.ajax({
            url: '/Admin/Home/WeekStatistics',
            type: 'GET',
            data: {
                page: config.pageIndex,
                pageSize: config.pageSize
            },
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';
                    var template = $('#data-template2').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Week2: item.FiscalWeek,
                            Revenue2: item.Revenue
                        });

                    });
                    $('#tblData2').html(html);
                    statistics.paging2(response.total, function () {
                        statistics.loadData2();
                    });
                }
            }
        });
    },

    //pagination method
    paging2: function (totalRow, callback) {

        var totalPages = Math.ceil(totalRow / config.pageSize);

        $('#pagination2').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            //callback
            onPageClick: function (event, page) {
                config.pageIndex = page;
                setTimeout(callback, 200);
            }
        });
    },

    //load data method
    loadData3: function (changePageSize) {
        $.ajax({
            url: '/Admin/Home/MonthStatistics',
            type: 'GET',
            data: {
                page: config.pageIndex,
                pageSize: config.pageSize
            },
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';
                    var template = $('#data-template3').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Year3: item.FiscalYear,
                            Month3: item.FiscalMonth,
                            Revenue3: item.Revenue
                        });

                    });
                    $('#tblData3').html(html);
                    statistics.paging3(response.total, function () {
                        statistics.loadData3();
                    });
                }
            }
        });
    },

    //pagination method
    paging3: function (totalRow, callback) {

        var totalPages = Math.ceil(totalRow / config.pageSize);

        $('#pagination3').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            //callback
            onPageClick: function (event, page) {
                config.pageIndex = page;
                setTimeout(callback, 200);
            }
        });
    },
    //load data method
    loadData4: function (changePageSize) {
        $.ajax({
            url: '/Admin/Home/QuarterStatistics',
            type: 'GET',
            data: {
                page: config.pageIndex,
                pageSize: config.pageSize
            },
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';
                    var template = $('#data-template4').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Year4: item.FiscalYear,
                            Quarter4: item.FiscalQuarter,
                            Revenue4: item.Revenue
                        });

                    });
                    $('#tblData4').html(html);
                    statistics.paging4(response.total, function () {
                        statistics.loadData4();
                    });
                }
            }
        });
    },

    //pagination method
    paging4: function (totalRow, callback) {

        var totalPages = Math.ceil(totalRow / config.pageSize);

        $('#pagination4').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            //callback
            onPageClick: function (event, page) {
                config.pageIndex = page;
                setTimeout(callback, 200);
            }
        });
    },

    //yearly revenue statistics call
    loadData5: function (changePageSize) {
        $.ajax({
            url: '/Admin/Home/YearStatistics',
            type: 'GET',
            data: {
                page: config.pageIndex,
                pageSize: config.pageSize
            },
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';
                    var template = $('#data-template5').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Year5: item.FiscalYear,
                            Revenue5: item.Revenue
                        });

                    });
                    $('#tblData5').html(html);
                    statistics.paging5(response.total, function () {
                        statistics.loadData5();
                    });
                }
            }
        });
    },

    //pagination method
    paging5: function (totalRow, callback) {

        var totalPages = Math.ceil(totalRow / config.pageSize);

        $('#pagination5').twbsPagination({
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

//initialize
statistics.init();
