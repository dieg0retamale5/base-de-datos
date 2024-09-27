const express = require('express');
const bodyParser = require('body-parser');
const clienteRoutes = require('./routes/clienteRoutes');
const productoRoutes = require('./routes/productoRoutes');
const tiendaRoutes = require('./routes/tiendaRoutes');
const artesanoRoutes = require('./routes/artesanoRoutes');
const detallePedidoRoutes = require('./routes/detallePedidoRoutes');
const pedidoRoutes = require('./routes/pedidoRoutes');

const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use('/clientes', clienteRoutes);
app.use('/productos', productoRoutes);
app.use('/tiendas', tiendaRoutes);
app.use('/artesanos', artesanoRoutes);
app.use('/detalles-pedido', detallePedidoRoutes);
app.use('/pedidos', pedidoRoutes);

app.listen(port, () => {
  console.log('Servidor corriendo en http://localhost:${port}');
});