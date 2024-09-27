const express = require('express');
const router = express.Router();
const artesanoController = require('../controllers/artesanoController');

router.get('/', artesanoController.getArtesanos);
router.post('/', artesanoController.addArtesano);

module.exports = router;