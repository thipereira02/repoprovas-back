import "./setup";

import express from "express";
import cors from "cors";
import "reflect-metadata";

import connectDatabase from "./database";

import * as categoriesController from "./controllers/categoriesController";
import * as subjectsController from "./controllers/subjectsController";
import * as teachersController from "./controllers/teachersController";
import * as testsController from "./controllers/testsController";

const app = express();
app.use(cors());
app.use(express.json());

app.get("/categories", categoriesController.getCategories);
app.get("/subjects", subjectsController.getSubjects);
app.get("/teachers/:subjectId", teachersController.getTeachersBySubjects);
app.post("/tests", testsController.postNewTest);
app.get("/tests/teachers", testsController.getTestsByTeachers);
app.get("/tests/subjects", testsController.getTestsBySubjects);

export async function init () {
  await connectDatabase();
}

export default app;
