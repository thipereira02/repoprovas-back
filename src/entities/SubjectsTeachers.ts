import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from "typeorm";

import Teacher from "./Teachers";
import Subject from "./Subjects";

@Entity("subjectsTeachers")
export default class SubjectTeacher {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  teacherId: number;

  @Column()
  subjectId: number;

  @ManyToOne(() => Teacher, t => t.subjectsTeachers)
  teacher: Teacher;

  @ManyToOne(() => Subject, s => s.subjectsTeachers)
  subject: Subject;
}
