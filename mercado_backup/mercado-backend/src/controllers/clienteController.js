const db = require('../config/db');

// Obtener todos los clientes
exports.getClientes = (req, res) => {
  db.query('SELECT * FROM cliente', (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json(results);
  });
};

// Agregar un nuevo cliente
exports.addCliente = (req, res) => {
  const { nombre_cliente, correo_electrónico, teléfono, dirección } = req.body;
  db.query('INSERT INTO cliente (nombre_cliente, correo_electrónico, teléfono, dirección) VALUES (?, ?, ?, ?)', 
    [nombre_cliente, correo_electrónico, teléfono, dirección], 
    (err, result) => {
      if (err) {
        return res.status(500).send(err);
      }
      res.status(201).json({ id: result.insertId });
    });
};