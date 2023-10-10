import { Router } from "express";
import validateSchema from "../middlewares/validateSchema.middleware.js";
import { catsSchema } from "../schemas/cats.schema.js";
import { addMyCat, getModels } from "../repositories/cats.repository.js";
import { authValidate } from "../middlewares/authValidate.middleware.js";

const catsRouter = Router()

catsRouter.post("/add-cats", authValidate ,validateSchema(catsSchema), addMyCat)
catsRouter.get("/list-cats", authValidate ,getModels)

export default catsRouter