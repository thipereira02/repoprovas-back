import { Request, Response } from "express";

import * as testsService from "../services/testsService";
import { TestInterface } from "../interfaces/TestInterface";

export async function postNewTest (req: Request, res: Response) {
  try {
    const {name, pdfLink, categoryId, subjectId, teacherId} = req.body as TestInterface;

    const create = await testsService.postTest(name, pdfLink, categoryId, subjectId, teacherId);
    if (create === null) return res.sendStatus(400);
    if (create === false) return res.sendStatus(409);

    res.sendStatus(201);
  } catch (err) {
    console.error(err);
    res.sendStatus(500);
  }
}

export async function getTestsByTeachers (req: Request, res: Response) {
  try {
    const teachers = await testsService.getTeachersAndTests();

    return res.send(teachers);
  } catch (err) {
    console.error(err);
    res.sendStatus(500);
  }
}

export async function getTestsBySubjects (req: Request, res: Response) {
  try {
    const subjects = await testsService.getSubjectsAndTests();

    return res.send(subjects);
  } catch (err) {
    console.error(err);
    res.sendStatus(500);
  }
}
