import express from 'express';

import * as testsController from '../controllers/testsController';

const router = express.Router();

router.post('/tests', testsController.postNewTest);
router.get('/tests/teachers', testsController.getTestsByTeachers);
router.get('/tests/subjects', testsController.getTestsBySubjects);

export default router;
