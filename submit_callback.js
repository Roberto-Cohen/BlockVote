$("#theForm").on("submit", function(e){
  e.preventDefault();
  var data = $(this).serialize().split("&");
  console.log(data);
});
