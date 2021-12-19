import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';

import Subject from './Subjects';

@Entity('terms')
export default class Term {
  @PrimaryGeneratedColumn()
    id: number;

  @Column()
    name: string;

  @OneToMany(() => Subject, (s) => s.term)
    subjects: Subject[];
}
