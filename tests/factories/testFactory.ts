import { getRepository } from 'typeorm';

import Tests from '../../src/entities/Tests';

export async function createTest() {
  const test = await getRepository(Tests).create({
    name: '2021.1',
    pdfLink: 'https://www.website.com.br/sample.pdf',
    categoryId: 1,
    subjectId: 3,
    teacherId: 5,
  });

  await getRepository(Tests).save(test);

  return test;
}
