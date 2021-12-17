import joi from 'joi';

export const testSchema = joi.object({
  name: joi.string().trim().required(),
  pdfLink: joi.string().pattern(/^(https?:\/\/)?www\.([\da-z\.-]+)\.([a-z\.]{2,6})\/[\w \.-]+?\.pdf$/).required(),
  categoryId: joi.number().required(),
  subjectId: joi.number().required(),
  teacherId: joi.number().required(),
});