// Print all of the news items on Hacker News
var jsdom = require("jsdom");
var request = require("request");
var promisify = require('bluebird').promisify;
var co = require('co');
var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'iphone'
});

connection.connect();


var http = promisify(function (options, cb) {
        request(options, function (error, response, body) {
          cb(error, response);
        })
      }),
      dom = promisify(jsdom.env);

co(function *() {
      var response = yield http('http://iplus.com.ge/ge/category/9');
      var window = yield dom(response.body, ["http://code.jquery.com/jquery.js"]);
      var $ = window.$;
      var total = parseInt($('ul.pagination li:nth-last-child(2) a').text());
      return total;
    }).then(function (total) {
        var data = [];
            co(function *() {
                for (i=1; i <= total; i++) {
                    var response = yield http('http://iplus.com.ge/ge/category/9?page=' + i);
                    var window = yield dom(response.body, ["http://code.jquery.com/jquery.js"]);
                    var $ = window.$;
                        var number;
                        $('.post-body').each(function(){
                            var text = $(this).find('a h3').text();
                            var re = /\w*GB\b/g;
                            var gb = text.match(re);
                            // console.log(matches_array[0])
                            // console.log(text);
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
                connection.end();

            })



            // request({uri: 'http://iplus.com.ge/ge/category/9?page=' + i}, function(err, response, body){
            // var self = this;
            // self.items = new Array();//I feel like I want to save my results in an array
         
            // if(err && response.statusCode !== 200){console.log('Request error.');}
            //     jsdom.env({
            //         html: body,
            //         scripts: ['http://code.jquery.com/jquery.js'],
            //         done:function(err, window){
            //             var $ = window.jQuery;
            //             var number;
            //             $('.post-body').each(function(){
            //                 var text = $(this).find('a h3').text();
            //                 var re = /\w*GB\b/g;
            //                 var matches_array = text.match(re);
            //                 console.log(matches_array[0])
            //                 console.log(text);
            //                 number = $(this).find('p:first-of-type span').text();
            //                 number = parseFloat(number.trim());
            //                 number = Math.round(number * 100) / 100;

            //                 data.push([text, number]);
            //                 // console.log(number);
            //             });
            //         }
            //     });
            // });
        
        
    });

