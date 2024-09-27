const express = require('express');
const router = express.Router();
const detallePedidoController = require('../controllers/detallePedidoController');

router.get('/', detallePedidoController.getDetallesPedido);
router.post('/', detallePedidoController.addDetallePedido);

module.exports = router;