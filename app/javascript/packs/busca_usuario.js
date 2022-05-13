$("#search-user").on("focus",function(e){
    console.log("foco");
    e.preventDefault();
    $(function (e){
        $(this).on("keyup",function (e) {
            e.preventDefault();
            $.ajax({
                type: "GET",
                url: "./search_user",
                data: "query =" + $(e.target).val(),
                success: function (data) {
                    console.log(data);
                }
            })
        })
    })

})