var express = require("express");
var bodyParser = require("body-parser");

var app = express();
var port = 3000;

// Parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

var exphbs = require("express-handlebars");

app.engine("handlebars", exphbs({ defaultLayout: "main" }));
app.set("view engine", "handlebars");

//var mysql = require("mysql");

// Use Handlebars to render the main index.html page with the todos in it.
app.get("/", function(req, res) {

    res.render("index", { movies: [{"id":1,"movie":"smokinaces"},{"id":2,"movie":"exam"}] });
});




app.listen(port, function() {
  console.log("listening on port", port);
});
