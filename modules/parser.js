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
            result = JSON.parse(JSON.stringify(result));
            cb(err, result);
          });
      }),
      dom = promisify(jsdom.env);

exports.itechnic = function() {
    co(function *() {
        var response = yield http('http://itechnic.ge/home/geo')
        ,window = yield dom(response.body, ["http://code.jquery.com/jquery.js"])
        ,$ = window.$ 
        ,$menu = $('body > header > div > div > div.nav-links > nav > ul.menu > li:nth-child(2)')
        ,menuName = $menu.find('>a').text().trim().toLowerCase()
        ,listLength = $menu.find('div.fullWidth > div > ul li').length
        ,list = []
        ,number
        ,colors = yield query('SELECT id,LCASE(title) as title FROM colors ORDER BY LENGTH(title) ASC')
        ,models = yield query('SELECT id,LCASE(title) as title FROM model ORDER BY LENGTH(title) ASC')
        ,uris = $.map($menu.find('div.fullWidth > div > ul li a'), function(n){
            return n.href;
        })
        // var tt = yield _each($menu.find('div.fullWidth > div > ul li a'));
        // throw(new Error('something wrong'));
        var result = {total: uris, colors:colors, models: models};
        return result;
        
        }).then(function (result) {
            var data = []
            co(function *() {
                for (var i=0; i < result.total.length; i++) {
                    var response = yield http(result.total[i]);
                    var window = yield dom(response.body, ["http://code.jquery.com/jquery.js"]);
                    var $ = window.$;
                    $('body > main > div > div:nth-child(4) div.dashboard-item').each(function(){
                        var text = $(this).find('>a').attr('href').toLowerCase().trim().split('/').pop();
                        var re = /\w*-gb\b/g;
                        var gb = text.match(re);
                        text = text.replace(gb, '').replace(/-/g , ' ');
                        //es minda

                        var color = result.colors.filter(function(color){
                            return _.includes(text, color.title);
                        }).pop();
                        var model = result.models.filter(function(model){
                            return _.includes(text, model.title);
                        }).pop();
                        var price = $(this).find('div.item-description.col-12 > h3 > span').text();
                        price = parseFloat(price.trim());
                        price = Math.round(price * 100) / 100;

                        if (price == null || model == null || color == null) {
                            return true;
                        }
                        
                        data.push([text, price, gb[0], color.id, model.id, 3]);
                    });
                }
            }).then(function(){
                console.log(data);
                connection.query('DELETE FROM plus WHERE market_id=3', function(err, result) {
                if (err) throw err;
                  console.log('AppleCity deleted: ', result.affectedRows);
                });
                
                connection.query('INSERT INTO `plus` (`name`, `price`, `size`, `colors_id`, `model_id`, `market_id`) VALUES ?', [data], function(err, result) {
                if (err) throw err;
                  console.log('AppleCity: ', result.insertId);
                });

            },function (err) {
             console.error(err.stack);
          })
    }, function(err) {
      console.error(err.stack);
    });
}
exports.appleCity = function() {
    co(function *() {
        var response = yield http('http://applecity.ge/iphone')
        ,window = yield dom(response.body, ["http://code.jquery.com/jquery.js"])
        ,$ = window.$
        ,total = parseInt($('#pagenav > ul li:nth-last-child(2) a').text())
        ,number
        ,colors = yield query('SELECT id,LCASE(title) as title FROM colors ORDER BY LENGTH(title) ASC')
        ,models = yield query('SELECT id,LCASE(title) as title FROM model ORDER BY LENGTH(title) ASC');
        var result = {total: total, colors:colors, models: models};
        return result;
        }).then(function (result) {
            var data = []
  
        console.log(result.colors);
            co(function *() {
                for (i=1; i <= result.total; i++) {
                    var response = yield http('http://applecity.ge/iphone?pagenumber=' + i);
                    var window = yield dom(response.body, ["http://code.jquery.com/jquery.js"]);
                    var $ = window.$;
                    
                    $('.prod-block.fleft').each(function(){
                        var text = $(this).find('h2 a').text().toLowerCase().trim();
                        var re = /\w*gb\b/g;
                        var gb = text.match(re);
                        text = text.replace(gb, '').replace(/,/g , '');
                        // console.log(matches_array[0])
                        //es minda
                                                console.log(text);

                        var color = result.colors.filter(function(color){
                            return _.includes(text, color.title);
                        }).pop();
                        var model = result.models.filter(function(model){
                            return _.includes(text, model.title);
                        }).pop() || 0;
                        var price = $(this).find('span:first-of-type').text();
                        price = parseFloat(price.trim());
                        price = Math.round(price * 100) / 100;

                        data.push([text, price, gb[0], color.id, model.id, 2]);
                        // console.log(number);
                    });
                }
            }).then(function(){
                console.log(data);
                connection.query('DELETE FROM plus WHERE market_id=2', function(err, result) {
                if (err) throw err;
                  console.log('AppleCity deleted: ', result.affectedRows);
                });
                
                connection.query('INSERT INTO `plus` (`name`, `price`, `size`, `colors_id`, `model_id`, `market_id`) VALUES ?', [data], function(err, result) {
                if (err) throw err;
                  console.log('AppleCity: ', result.insertId);
                });

            },function (err) {
             console.error(err.stack);
          })
    }, function(err) {
      console.error(err.stack);
    });
}
exports.iplus = function() {

      
// var task = cron.schedule('* * * * *', function(){
//   console.log('cron job has started');




    co(function *() {
        var response = yield http('http://iplus.com.ge/ge/category/9')
        ,window = yield dom(response.body, ["http://code.jquery.com/jquery.js"])
        ,$ = window.$
        ,total = parseInt($('ul.pagination li:nth-last-child(2) a').text())
        ,number
        ,colors = yield query('SELECT id,LCASE(title) as title FROM colors ORDER BY LENGTH(title) ASC')
        ,models = yield query('SELECT id,LCASE(title) as title FROM model ORDER BY LENGTH(title) ASC');
        var result = {total: total, colors:colors, models: models};
        return result;
        }).then(function (result) {
            var data = []
  
        console.log(result.colors);
            co(function *() {
                for (i=1; i <= result.total; i++) {
                    var response = yield http('http://iplus.com.ge/ge/category/9?page=' + i);
                    var window = yield dom(response.body, ["http://code.jquery.com/jquery.js"]);
                    var $ = window.$;
                    
                    $('.post-body').each(function(){
                        var text = $(this).find('a h3').text().toLowerCase();
                        var re = /\w*gb\b/g;
                        var gb = text.match(re);
                        text = text.replace(gb, '');
                        // console.log(matches_array[0])
                        //es minda
                                                console.log(text);

                        var color = result.colors.filter(function(color){
                            return _.includes(text, color.title);
                        }).pop();
                        var model = result.models.filter(function(model){
                            return _.includes(text, model.title);
                        }).pop() || 0;
                        var price = $(this).find('p:first-of-type span').text();
                        price = parseFloat(price.trim());
                        price = Math.round(price * 100) / 100;

                        data.push([text, price, gb[0], color.id, model.id, 1]);
                        // console.log(number);
                    });
                }
            }).then(function(){
                console.log(data);
                connection.query('DELETE FROM plus WHERE market_id=1', function(err, result) {
                if (err) throw err;
                  console.log('Ipluse deleted: ', result.affectedRows);
                });
                
                connection.query('INSERT INTO `plus` (`name`, `price`, `size`, `colors_id`, `model_id`, `market_id`) VALUES ?', [data], function(err, result) {
                if (err) throw err;
                  console.log('Iplus: ', result.insertId);
                });

            },function (err) {
             console.error(err.stack);
          })
    }, function(err) {
      console.error(err.stack);
    });
}

module.exports;



