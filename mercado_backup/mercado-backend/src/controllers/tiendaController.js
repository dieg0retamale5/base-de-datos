const db = require('../config/db');

// Obtener todas las tiendas
exports.getTiendas = (req, res) => {
  db.query('SELECT * FROM tienda', (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json(results);
  });
};

// Agregar una nueva tienda
exports.addTienda = (req, res) => {
  const { nombre_tienda, direccion, telefono } = req.body;
  db.query('INSERT INTO tienda (nombre_tienda, direccion, telefono) VALUES (?, ?, ?)', 
    [nombre_tienda, direccion, telefono], 
    (err, result) => {
      if (err) {
        return res.status(500).send(err);
      }
      res.status(201).json({ id: result.insertId });
    });
};