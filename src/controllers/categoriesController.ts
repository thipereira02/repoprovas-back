/* eslint-disable consistent-return */
import { Request, Response } from 'express';

import * as categoriesService from '../services/categoriesService';

export async function getCategories(req: Request, res: Response) {
  try {
    const categories = await categoriesService.getCategories();
    return res.send(categories);
  } catch (err) {
    console.error(err);
    res.sendStatus(500);
  }
}
