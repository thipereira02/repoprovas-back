import "./setup";

import express from "express";
import cors from "cors";
import "reflect-metadata";

import connectDatabase from "./database";

import * as categoriesController from "./controllers/categoriesController";
import * as subjectsController from "./controllers/subjectsController";

const app = express();
app.use(cors());
app.use(express.json());

app.get("/categories", categoriesController.getCategories);
app.get("/subjects", subjectsController.getSubjects);

export async function init () {
  await connectDatabase();
}

export default app;
