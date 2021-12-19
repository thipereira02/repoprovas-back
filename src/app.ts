import './setup';

import express from 'express';
import cors from 'cors';
import 'reflect-metadata';

import connectDatabase from './database';

import categoriesRouter from './routers/categoriesRouter';
import subjectsRouter from './routers/subjectsRouter';
import teachersRouter from './routers/teachersRouter';
import testsRouter from './routers/testsRouter';

const app = express();
app.use(cors());
app.use(express.json());

app.use(categoriesRouter);
app.use(subjectsRouter);
app.use(teachersRouter);
app.use(testsRouter);

export async function init() {
  await connectDatabase();
}

export default app;
