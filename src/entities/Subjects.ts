import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, OneToMany } from 'typeorm';

import Term from './Terms';
import Test from './Tests';
import SubjectTeacher from './SubjectsTeachers';

@Entity('subjects')
export default class Subject {
  @PrimaryGeneratedColumn()
    id: number;

  @Column()
    name: string;

  @Column()
    termId: number;

  @ManyToOne(() => Term, (t) => t.subjects)
    term: Term;

  @OneToMany(() => Test, (t) => t.subject)
    tests: Test[];

  @OneToMany(() => SubjectTeacher, (s) => s.subject)
    subjectsTeachers: SubjectTeacher[];
}
