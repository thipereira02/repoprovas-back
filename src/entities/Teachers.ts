import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity("teachers")
export default class Teacher {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;
}
