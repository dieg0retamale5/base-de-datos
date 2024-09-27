const db = require('../config/db');

// Obtener todos los detalles de pedidos
exports.getDetallesPedido = (req, res) => {
  db.query('SELECT * FROM detalle_pedido', (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json(results);
  });
};

// Agregar un nuevo detalle de pedido
exports.addDetallePedido = (req, res) => {
  const { pedido_id, producto_id, cantidad, precio_unitario } = req.body;
  db.query('INSERT INTO detalle_pedido (pedido_id, producto_id, cantidad, precio_unitario) VALUES (?, ?, ?, ?)', 
    [pedido_id, producto_id, cantidad, precio_unitario], 
    (err, result) => {
      if (err) {
        return res.status(500).send(err);
      }
      res.status(201).json({ id: result.insertId });
    });
};