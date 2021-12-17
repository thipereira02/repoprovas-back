import {MigrationInterface, QueryRunner} from "typeorm";

export class CreateTermsTable1639760661304 implements MigrationInterface {
    name = 'CreateTermsTable1639760661304'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE "terms" ("id" SERIAL NOT NULL, "name" character varying NOT NULL, CONSTRAINT "PK_33b6fe77d6ace7ff43cc8a65958" PRIMARY KEY ("id"))`);
        await queryRunner.query(`ALTER TABLE "subjects" ADD "termId" integer NOT NULL`);
        await queryRunner.query(`ALTER TABLE "subjects" ADD CONSTRAINT "FK_c30a2867f3d9917aee56d2ef14d" FOREIGN KEY ("termId") REFERENCES "terms"("id") ON DELETE NO ACTION ON UPDATE NO ACTION`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "subjects" DROP CONSTRAINT "FK_c30a2867f3d9917aee56d2ef14d"`);
        await queryRunner.query(`ALTER TABLE "subjects" DROP COLUMN "termId"`);
        await queryRunner.query(`DROP TABLE "terms"`);
    }

}
