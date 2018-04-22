$("#theForm").on("submit", function(e){
  e.preventDefault();
  var data = $(this).serialize().split("&");
  console.log(data);
  App.vote(data[2].split("=")[1].parseInt(), data[3].split("=")[1].parseInt())
});
