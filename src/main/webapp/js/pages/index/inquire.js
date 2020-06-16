var path = window.document.location.href.substring(0, (window.document.location.href).indexOf(window.document.location.pathname));
layui.use(['laytpl', 'laypage'], function () {
    var layer = layui.layer
        , laytpl = layui.laytpl
        , $ = layui.jquery
        , laypage = layui.laypage;

    let name = $("#schoolName").val();

    //通过分页和类型来获取数据
    let searchList = function (curr, name) {
        $.get(path + '/api/school/info', {
            page: curr || 1
            , name: name
        }, function (res) {

            let html = laytpl(LAY_tpl.value).render({
                data: res.list
            });

            $('#schoolList').html(html);

            let stars = $("p[class*='scoreStar']");

            for (let i = 0; i < stars.length; i++) {
                let score = $(stars[i]).attr("tip");
                let starWidth = score / 5 * 150;
                $(stars[i]).attr("style", "width:" + starWidth + "px;float:none;");
            }

            laypage.render({
                elem: 'demo0'
                , count: res.count
                , limit: 6
                , groups: 3
                , curr: curr || 1
                , layout: ['prev', 'page', 'next', 'skip']
                , jump: function (e, first) {
                    if (!first) { //一定要加此判断,否则初始时会无限刷新
                        searchList(e.curr, name);
                    }
                }
            });
        });
    };

    searchList(1, name);

    $("#selectSchoolByName").on('click', function (event) {
        name = $("#schoolName").val();
        searchList(1, name);
    })
});