import {MigrationInterface, QueryRunner} from "typeorm";

export class CreateSubjectsTable1639678308790 implements MigrationInterface {
    name = 'CreateSubjectsTable1639678308790'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE "subjects" ("id" SERIAL NOT NULL, "name" character varying NOT NULL, CONSTRAINT "PK_1a023685ac2b051b4e557b0b280" PRIMARY KEY ("id"))`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`DROP TABLE "subjects"`);
    }

}
