var express = require("express");
var app = express()
var path = require("path");
var mysql = require("mysql");
var bodyParser = require("body-parser");
var bool = 0;

app.set("view engine","jade");
app.use(express.static(__dirname + "/public"));

app.use(bodyParser.urlencoded({
    extended:true
    }));

var connection = mysql.createConnection(
{
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'videoteka'
});

app.post("/addtolist", function(req,res){
    connection.query("SELECT contentID FROM contentrelation;", function(err,rows){
        if (err)
        {
            console.log(err);
        }
        else
        {
            bool = 0;
            for (var i in rows)
            {
                if (rows[i].contentID == req.body.id)
                {
                    
                    bool = 1;
                }
            }
            if (bool == 0)
            {
                connection.query("INSERT INTO `contentrelation` (`contentID`, `userID`, `rate`, `progress`, `status`) VALUES ('"+ req.body.id +"', '1', '0', '0', '1');", function(err,rows){
                    if (err)
                    {
                        console.log(err);
                    }
                });
            }
        }
    });
    res.redirect('/list');
});

app.post("/updatelist", function(req,res)
{
    connection.query("UPDATE contentrelation SET progress="+ req.body.progress +", rate=" + req.body.rate + " WHERE userID=1 AND contentID="+ req.body.id +";", function(err,rows){
        if (err)
        {
            console.log(err);
        }
    });
    res.redirect('/mylist');
});

app.post("/removefromlist", function(req,res)
{
    connection.query("DELETE FROM contentrelation WHERE userID=1 AND contentID="+ req.body.id +";", function(err,rows){
        if (err)
        {
            console.log(err);
        }
    });
    res.redirect('/mylist');
});


app.get("/", function(req,res)
{
    connection.query("SELECT content.contentName AS 'name',content.contentDescription AS 'description',content.contentPicture AS 'picture' "+
    "FROM content ORDER BY content.contentID DESC LIMIT 2;", function(err,rows){
        if (err)
        {
            console.log(err);
            res.send("błąd otwarcia strony");
        }
        else
        {
            res.render('index',{query:rows});
        }
    });
});

app.get("/list", function(req,res)
{
    connection.query("SELECT content.contentName AS 'name' ,content.contentID as 'id' ,contenttype.contentTypeName AS 'type', content.contentNumberOfEpisodes AS 'episodes',"+
    "table1.producers AS 'producer',table2.genres AS 'genre',content.contentPicture AS 'picture' "+
    "FROM content JOIN contenttype ON content.contentType = contenttype.contentTypeID JOIN "+
    "(SELECT producentrelation.contentID, GROUP_CONCAT(producent.producentName SEPARATOR '; ') AS 'producers' "+
    "FROM producentrelation JOIN producent ON producentrelation.producentID = producent.producentID "+
    "GROUP BY producentrelation.contentID ) AS table1 ON table1.contentID = content.contentID JOIN "+
    "(SELECT genrerelation.contentID, GROUP_CONCAT(genre.genreName SEPARATOR '; ') AS 'genres' "+
    "FROM genrerelation JOIN genre ON genrerelation.genreID = genre.genreID "+
    "GROUP BY genrerelation.contentID) AS table2 ON table2.contentID = content.contentID  ORDER BY content.contentName ASC;", function(err,rows){
        if (err)
        {
            console.log(err);
            res.send("błąd otwarcia strony");
        }
        else
        {
            res.render('list',{query:rows});
        }
    });
});

app.get("/mylist", function(req,res)
{
    connection.query("SELECT content.contentName AS 'name',content.contentID as 'id' ,contentrelation.progress AS 'progress',"+
    "content.contentNumberOfEpisodes AS 'episodes',contentrelation.rate AS 'rate', "+
    "content.contentPicture AS 'picture'FROM content JOIN contentrelation ON "+
    "content.contentID=contentrelation.contentID WHERE contentrelation.userID=1;", function(err,rows){
        if (err)
        {
            console.log(err);
            res.send("błąd otwarcia strony");
        }
        else
        {
            res.render('mylist',{query:rows});
        }
    });
});


app.listen(60000);
console.log("Serwer został uruchomiony na porcie 60000...");
