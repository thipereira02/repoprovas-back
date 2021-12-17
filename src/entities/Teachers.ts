import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from "typeorm";

import Test from "./Tests";
import SubjectTeacher from "./SubjectsTeachers";

@Entity("teachers")
export default class Teacher {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @OneToMany(() => Test, t => t.teacher)
  tests: Test[];

  @OneToMany(() => SubjectTeacher, s => s.teacher)
  subjectsTeachers: SubjectTeacher[];
}
