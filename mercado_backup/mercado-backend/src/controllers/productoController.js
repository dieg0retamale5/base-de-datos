const db = require('../config/db');

// Obtener todos los productos
exports.getProductos = (req, res) => {
  db.query('SELECT * FROM producto', (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json(results);
  });
};

// Agregar un nuevo producto
exports.addProducto = (req, res) => {
  const { nombre_producto, precio, tienda_id } = req.body;
  db.query('INSERT INTO producto (nombre_producto, precio, tienda_id) VALUES (?, ?, ?)', 
    [nombre_producto, precio, tienda_id], 
    (err, result) => {
      if (err) {
        return res.status(500).send(err);
      }
      res.status(201).json({ id: result.insertId });
    });
};