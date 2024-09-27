const db = require('../config/db');

// Obtener todos los artesanos
exports.getArtesanos = (req, res) => {
  db.query('SELECT * FROM artesano', (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json(results);
  });
};

// Agregar un nuevo artesano
exports.addArtesano = (req, res) => {
  const { nombre_artesano, especialidad, telefono } = req.body;
  db.query('INSERT INTO artesano (nombre_artesano, especialidad, telefono) VALUES (?, ?, ?)', 
    [nombre_artesano, especialidad, telefono], 
    (err, result) => {
      if (err) {
        return res.status(500).send(err);
      }
      res.status(201).json({ id: result.insertId });
    });
};