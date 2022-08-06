var express = require("express");
var router = express.Router();
// var { getProducts, addProduct } = require("../database/sqlite");
var db = require("../database/sqlite");

router.get("/", async (req, res, next) => {
  var sql = "select * from product";
  var params = [];
  db.all("select * from product", [], (err, rows) => {
    if (err) {
      res.status(400).json({ error: err.message });
      return;
    }
    res.json({
      message: "success",
      data: rows,
    });
  });
});
router.post("/", function async(req, res, next) {
  var data = {
    name: req.body.name,
    price: req.body.price,
    id: req.body.id,
  };
  var sql = "INSERT INTO product (name, price) VALUES (?,?)";
  var params = [data.name, data.price];
  db.run(sql, params, function (err, result) {
    if (err) {
      res.status(400).json({ error: err.message });
      return;
    }
    res.json({
      message: "success",
      data: data,
      id: this.lastID,
    });
  });
});
router.delete("/", function async(req, res, next) {
  db.run(
    "DELETE FROM product WHERE id = ?",
    req.body.id,
    function (err, result) {
      if (err) {
        res.status(400).json({ error: res.message });
        return;
      }
      res.json({ message: "deleted", changes: this.changes });
    }
  );
});
router.put("/", function async(req, res, next) {
  var data = {
    name: req.body.name,
    price: req.body.price,
    id: req.body.id,
  };
  db.run(
    `UPDATE product set 
       name = COALESCE(?,name), 
       price = COALESCE(?,price)
       WHERE id = ?`,
    [data.name, data.email, data.id],
    function (err, result) {
      if (err) {
        res.status(400).json({ error: res.message });
        return;
      }
      res.json({
        message: "success",
        data: data,
        changes: this.changes,
      });
    }
  );
});
module.exports = router;
