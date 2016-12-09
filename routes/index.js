var express = require('express');
var router = express.Router();
var connection = require('../modules/database.js');

/* GET home page. */
router.get('/', function(req, res, next) {
  connection.query('SELECT * FROM colors', function(err, result) {
    if (err) throw err;
      res.json(result);
  });

});
module.exports = router;
