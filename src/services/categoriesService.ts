import { getRepository } from "typeorm";

import Category from "../entities/Categories";

export async function getCategories () {
  const categories = await getRepository(Category).find();
  
  return categories;
}
