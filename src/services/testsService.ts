import { getConnection, getRepository } from "typeorm";

import Tests from "../entities/Tests";

export async function postTest(name: string, pdfLink: string , categoryId: number, subjectId: number, teacherId: number) {
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
