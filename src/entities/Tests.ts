import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';

import Category from './Categories';
import Teacher from './Teachers';
import Subject from './Subjects';

@Entity('tests')
export default class Test {
  @PrimaryGeneratedColumn()
    id: number;

  @Column()
    name: string;

  @Column()
    pdfLink: string;

  @Column()
    categoryId: number;

  @Column()
    teacherId: number;

  @Column()
    subjectId: number;

  @ManyToOne(() => Category, (c) => c.tests)
    category: Category;

  @ManyToOne(() => Teacher, (t) => t.tests)
    teacher: Teacher;

  @ManyToOne(() => Subject, (s) => s.tests)
    subject: Subject;
}
