import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from "typeorm";

import Test from "./Tests";

@Entity("teachers")
export default class Teacher {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @OneToMany(() => Test, t => t.teacher)
  tests: Test[];
}
