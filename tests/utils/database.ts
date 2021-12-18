import { getRepository } from "typeorm";

import Tests from "../../src/entities/Tests";

export async function clearDatabase () {
  await getRepository(Tests).delete({});
}
