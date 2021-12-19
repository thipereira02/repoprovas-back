import express from 'express';

import * as categoriesController from '../controllers/categoriesController';

const router = express.Router();

router.get("/categories", categoriesController.getCategories);

export default router;