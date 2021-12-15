import "./setup";

import express from "express";
import cors from "cors";
import "reflect-metadata";

import connectDatabase from "./database";

import * as categoriesController from "./controllers/categoriesController";

const app = express();
app.use(cors());
app.use(express.json());

app.get("/categories", categoriesController.getCategories);

export async function init () {
  await connectDatabase();
}

export default app;
