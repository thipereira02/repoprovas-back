import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn } from "typeorm";

import Term from "./Terms";

@Entity("subjects")
export default class Subject {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  termId: number;

  @ManyToOne(() => Term, t => t.subjects)
  term: Term;
}
