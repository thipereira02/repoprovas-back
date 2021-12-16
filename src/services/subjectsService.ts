import { getRepository } from "typeorm";

import Subjects from "../entities/Subjects";

export async function getSubjects () {
  const subjects = await getRepository(Subjects)
    .find();
  
  return subjects;
}
