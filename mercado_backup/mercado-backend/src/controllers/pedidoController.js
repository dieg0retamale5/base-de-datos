const db = require('../config/db');

// Obtener todos los pedidos
exports.getPedidos = (req, res) => {
  db.query('SELECT * FROM pedido', (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json(results);
  });
};

// Agregar un nuevo pedido
exports.addPedido = (req, res) => {
  const { cliente_id, fecha_pedido, total } = req.body;
  db.query('INSERT INTO pedido (cliente_id, fecha_pedido, total) VALUES (?, ?, ?)', 
    [cliente_id, fecha_pedido, total], 
    (err, result) => {
      if (err) {
        return res.status(500).send(err);
      }
      res.status(201).json({ id: result.insertId });
    });
};
