import { getConnection, getRepository } from "typeorm";

import Tests from "../entities/Tests";
import { testSchema } from "../schemas/TestSchema";

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
