/* eslint-disable no-undef */
import supertest from 'supertest';
import { getConnection } from 'typeorm';

import app, { init } from '../../src/app';

beforeAll(async () => {
  await init();
});

afterAll(async () => {
  await getConnection().close();
});

describe('GET /categories', () => {
  it('should answer with status 200 when categories are returned', async () => {
    const response = await supertest(app).get('/categories');
    expect(response.status).toBe(200);
  });
});
