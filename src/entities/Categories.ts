import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from "typeorm";

import Test from "./Tests";

@Entity("categories")
export default class Category {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @OneToMany(() => Test, t => t.category)
  tests: Test[];
}
