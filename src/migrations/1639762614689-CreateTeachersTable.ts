import {MigrationInterface, QueryRunner} from "typeorm";

export class CreateTeachersTable1639762614689 implements MigrationInterface {
    name = 'CreateTeachersTable1639762614689'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE "teachers" ("id" SERIAL NOT NULL, "name" character varying NOT NULL, CONSTRAINT "PK_a8d4f83be3abe4c687b0a0093c8" PRIMARY KEY ("id"))`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`DROP TABLE "teachers"`);
    }

}
