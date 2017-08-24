<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/8/23
  Time: 下午3:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <%--这个是bootstrap好用的前提,在最上边--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">博客</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/addBlog">新建博客 <span class="sr-only">(current)</span></a></li>
                <li><a href="#">查看博客</a></li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input id="content" type="text" class="form-control" placeholder="搜索内容..">
                </div>
                <button id="btn1" type="button" class="btn btn-default">提交</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><span>欢迎登陆: ${sessionScope.userinfo.name}</span></li>
                <li><a href="/register" >注册</a></li>
                <li><a href="/login">登录</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->



        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>
                                博客标题
                            </th>
                            <th>
                                博客描述
                            </th>
                            <th>
                                操作
                            </th>
                        </tr>
                        </thead>
                        <tbody id="tab">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>


    </div><!-- /.container-fluid -->
</nav>




</body>
<script>
    function addNewTR(id, title, des, how) {
        var tdleft = $("<td></td>")
        var tdright = $("<td></td>").html("<p>" + des + "</p>")
        var tdright1 =  $("<td></td>")


        $("<a href ='#'></a>").html(title).appendTo(tdleft)
        $("<a href='#'>删除</a>").appendTo(tdright1).attr("num",id).click(delfunc);

        var trOb = $("<tr></tr>").append(tdleft).append(tdright).append(tdright1).attr("id", "ss" + id);

        //将生成的tr最终添加到写好的table中
        $("#tab").append(trOb)



    }

    function getAllBlog() {
        $.ajax({
            url: "/getall",
            success: function (result) {
                for (var i = 0; i < result.length; i++) {
                    var blog = result[i];
                 addNewTR(blog.id,blog.title,blog.des,true)
                }
            }
        })

    }
    getAllBlog();

    var delfunc =function () {
        var aid = $(this).attr("num");
        $.ajax({
            url:"/delete",
            data:{
                id:aid
            }
        })
        refresh();
    }





    function refresh() {
        window.location.reload();
    }

</script>


<nav aria-label="Page navigation" >
    <ul class="pagination">
        <li>
            <a href="/pagetest" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li>
            <a href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>


</html>
