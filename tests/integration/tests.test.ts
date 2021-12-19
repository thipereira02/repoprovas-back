import supertest from "supertest";
import { getConnection } from "typeorm";

import app, { init } from "../../src/app";
import { createTest } from "../factories/testFactory";
import { clearDatabase } from "../utils/database";

beforeAll(async () => {
  await init();
});

beforeEach(async () => {
    await clearDatabase();
});

afterAll(async () => {
  await getConnection().close();
});

describe("POST /tests", () => {
  it("should answer with status 201 when test is created", async () => {
    const body = ({
        name: "2021.1",
        pdfLink: "https://www.website.com.br/sample.pdf",
        categoryId: 1,
        subjectId: 3,
        teacherId: 5
    });
    const response = await supertest(app).post("/tests").send(body);
    expect(response.status).toBe(201);
  });

  it("should answer with status 409 when the test data already exists", async () => {
    await createTest();
    const body = ({
        name: "2021.1",
        pdfLink: "https://www.website.com.br/sample.pdf",
        categoryId: 1,
        subjectId: 3,
        teacherId: 5
    });
    const response = await supertest(app).post("/tests").send(body);
    expect(response.status).toBe(409);
  });

  it("should answer with status 400 when name is empty", async () => {
    const body = ({
        name: "",
        pdfLink: "https://www.website.com.br/sample.pdf",
        categoryId: 1,
        subjectId: 3,
        teacherId: 5
    });
    const response = await supertest(app).post("/tests").send(body);
    expect(response.status).toBe(400);
  });

  it("should answer with status 400 when pdf link is invalid", async () => {
    const body = ({
        name: "2021.1",
        pdfLink: "http://www.google.com",
        categoryId: 1,
        subjectId: 3,
        teacherId: 5
    });
    const response = await supertest(app).post("/tests").send(body);
    expect(response.status).toBe(400);
  });

  it("should answer with status 400 when categoryId violates foreign key constraint", async () => {
    await createTest();
    const body = ({
        name: "2021.1",
        pdfLink: "https://www.website.com.br/sample.pdf",
        categoryId: 0,
        subjectId: 3,
        teacherId: 5
    });
    const response = await supertest(app).post("/tests").send(body);
    expect(response.status).toBe(500);
  });
  it("should answer with status 400 when subjectId violates foreign key constraint", async () => {
    await createTest();
    const body = ({
        name: "2021.1",
        pdfLink: "https://www.website.com.br/sample.pdf",
        categoryId: 1,
        subjectId: 0,
        teacherId: 5
    });
    const response = await supertest(app).post("/tests").send(body);
    expect(response.status).toBe(500);
  });

  it("should answer with status 400 when teacherId violates foreign key constraint", async () => {
    await createTest();
    const body = ({
        name: "2021.1",
        pdfLink: "https://www.website.com.br/sample.pdf",
        categoryId: 1,
        subjectId: 3,
        teacherId: 0
    });
    const response = await supertest(app).post("/tests").send(body);
    expect(response.status).toBe(500);
  });
});

describe("GET /tests/teachers", () => {
  it("should answer with status 200 when array is returned", async () => {
    const response = await supertest(app).get("/tests/teachers");
    expect(response.status).toBe(200);
  });
});

describe("GET /tests/subjects", () => {
  it("should answer with status 200 when array is returned", async () => {
    const response = await supertest(app).get("/tests/subjects");
    expect(response.status).toBe(200);
  });
});
