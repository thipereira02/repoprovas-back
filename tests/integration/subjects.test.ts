import supertest from "supertest";
import { getConnection } from "typeorm";

import app, { init } from "../../src/app";

beforeAll(async () => {
  await init();
});

afterAll(async () => {
  await getConnection().close();
});

describe("GET /subjects", () => {
  it("should answer with status 200 when subjects are returned", async () => {
    const response = await supertest(app).get("/subjects");
    expect(response.status).toBe(200);
  });
});
