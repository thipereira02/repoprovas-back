import { getConnection, getRepository } from "typeorm";

import Tests from "../entities/Tests";
import Teacher from "../entities/Teachers";
import { testSchema } from "../schemas/TestSchema";
import Term from "../entities/Terms";

export async function postTest(name: string, pdfLink: string , categoryId: number, subjectId: number, teacherId: number) {
    const isValid = testSchema.validate({ name, pdfLink, categoryId, subjectId, teacherId });
    if (isValid.error !== undefined) return null;

    const testExists = await getRepository(Tests)
        .find({
            where: [
                {name, pdfLink, categoryId, subjectId, teacherId}
            ]
        });
    if (testExists.length !== 0) return false;
  
    await getConnection()
        .createQueryBuilder()
        .insert()
        .into(Tests)
        .values([
            {name, pdfLink, categoryId, subjectId, teacherId} 
        ])
        .execute();

    return true;
}

export async function getTeachersAndTests() {
    const list = await getRepository(Teacher)
      .find({
        relations: ["tests", "tests.subject", "tests.category"]
      })
    return list
}

export async function getSubjectsAndTests() {
    const list = await getRepository(Term)
      .find({
        relations: ["subjects", "subjects.tests", "subjects.tests.category", "subjects.tests.teacher"],
        order: {id: 'ASC'}
      })
    return list
}

  