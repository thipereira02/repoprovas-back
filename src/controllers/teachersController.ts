/* eslint-disable consistent-return */
import { Request, Response } from 'express';

import * as teachersService from '../services/teachersService';

export async function getTeachersBySubjects(req: Request, res: Response) {
  try {
    const subjectId = Number(req.params.subjectId);
    const teachers = await teachersService.getTeachersBySubjects(subjectId);
    if (teachers.length === 0) return res.sendStatus(404);

    return res.send(teachers);
  } catch (err) {
    console.error(err);
    res.sendStatus(500);
  }
}
