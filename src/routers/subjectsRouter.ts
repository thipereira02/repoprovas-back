import express from 'express';

import * as subjectsController from '../controllers/subjectsController';

const router = express.Router();

router.get('/subjects', subjectsController.getSubjects);

export default router;
