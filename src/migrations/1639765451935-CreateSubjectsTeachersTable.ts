import {MigrationInterface, QueryRunner} from "typeorm";

export class CreateSubjectsTeachersTable1639765451935 implements MigrationInterface {
    name = 'CreateSubjectsTeachersTable1639765451935'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE "subjectsTeachers" ("id" SERIAL NOT NULL, "teacherId" integer NOT NULL, "subjectId" integer NOT NULL, CONSTRAINT "PK_134de7cd001186d40994a38aae3" PRIMARY KEY ("id"))`);
        await queryRunner.query(`ALTER TABLE "subjectsTeachers" ADD CONSTRAINT "FK_fa96077cc29fa6186147afffdb6" FOREIGN KEY ("teacherId") REFERENCES "teachers"("id") ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE "subjectsTeachers" ADD CONSTRAINT "FK_f7ec49e410fb1c02006540795c8" FOREIGN KEY ("subjectId") REFERENCES "subjects"("id") ON DELETE NO ACTION ON UPDATE NO ACTION`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "subjectsTeachers" DROP CONSTRAINT "FK_f7ec49e410fb1c02006540795c8"`);
        await queryRunner.query(`ALTER TABLE "subjectsTeachers" DROP CONSTRAINT "FK_fa96077cc29fa6186147afffdb6"`);
        await queryRunner.query(`DROP TABLE "subjectsTeachers"`);
    }

}
