const express = require('express');
const router = express.Router();
const tiendaController = require('../controllers/tiendaController');

router.get('/', tiendaController.getTiendas);
router.post('/', tiendaController.addTienda);

module.exports = router;