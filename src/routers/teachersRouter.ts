import express from 'express';

import * as teachersController from '../controllers/teachersController';

const router = express.Router();

router.get('/teachers/:subjectId', teachersController.getTeachersBySubjects);

export default router;
