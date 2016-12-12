var express = require('express');
var router = express.Router();
var connection = require('../modules/database.js');

/* GET home page. */
router.get('/api', function(req, res, next) {
  connection.query('SELECT * FROM colors', function(err, result) {
    if (err) throw err;
      res.json(result);
  });

});
router.post('/api/get-model', function(req, res, next) {
  var request = req.body
  ,params = request.params;
  
  res.json(req.body);
});
module.exports = router;
