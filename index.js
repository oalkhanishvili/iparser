// Print all of the news items on Hacker News
var jsdom = require("jsdom");
var request = require("request");
var promisify = require('bluebird').promisify;
var co = require('co');
var mysql      = require('mysql');
var cron = require('node-cron');
var _ = require('lodash');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'iphone'
});
var http = promisify(function (options, cb) {
        request(options, function (error, response, body) {
          cb(error, response);
        })
      }),
      query = promisify(function(options, cb) {
          connection.query(options, function(err, result){
            result = JSON.stringify(result);
            cb(err, result);
          });
      }),
      dom = promisify(jsdom.env);
      
// var task = cron.schedule('* * * * *', function(){
//   console.log('cron job has started');




co(function *() {
      var response = yield http('http://iplus.com.ge/ge/category/9')
      ,window = yield dom(response.body, ["http://code.jquery.com/jquery.js"])
      ,$ = window.$
      ,total = parseInt($('ul.pagination li:nth-last-child(2) a').text())
      ,number
      ,colors = yield query('SELECT * FROM colors');
      
      console.log(colors);
      var result = {total: total, colors:colors};
      return result;
    }).then(function (result) {
        var data = []
            co(function *() {
                for (i=1; i <= result.total; i++) {
                    var response = yield http('http://iplus.com.ge/ge/category/9?page=' + i);
                    var window = yield dom(response.body, ["http://code.jquery.com/jquery.js"]);
                    var $ = window.$;
                    $('.post-body').each(function(){
                        var text = $(this).find('a h3').text();
                        var re = /\w*GB\b/g;
                        var gb = text.match(re);
                        // console.log(matches_array[0])
                        // console.log(text);
                        //es minda
                        result.colors.forEach(co (function* (val){
                          console.log(yield val);
                        }));
                        price = $(this).find('p:first-of-type span').text();
                        price = parseFloat(price.trim());
                        price = Math.round(price * 100) / 100;

                        data.push([text, price, gb[0]]);
                        // console.log(number);
                    });
                }
            }).then(function(){
                console.log(data);
                connection.query('DELETE FROM plus', function(err, result) {
                if (err) throw err;
                  console.log('The solution is: ', result.affectedRows);
                });
                
                connection.query('INSERT INTO `plus` (`name`, `price`, `size`) VALUES ?', [data], function(err, result) {
                if (err) throw err;
                  console.log('The solution is: ', result.insertId);
                });

            })
    });

// }, false);
// task.start();



