var express = require("express");
require('bootstrap');
var app = express();
app.get("/", function (req, res) {
res.send("<h1>Open Source For You!</h1>");
});
app.listen(3000, function () {
console.log("Example app listening on port 3000!");
});
