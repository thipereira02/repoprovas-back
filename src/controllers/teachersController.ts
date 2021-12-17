import { Request, Response } from "express";

import * as teachersService from "../services/teachersService";

export async function getTeachersBySubjects (req: Request, res: Response) {
  try {
    const subjectId = Number(req.params.subjectId);
    const teachers = await teachersService.getTeachersBySubjects(subjectId);
    res.send(teachers);
  } catch (err) {
    console.error(err);
    res.sendStatus(500);
  }
}