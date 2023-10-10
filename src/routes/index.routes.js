import { Router } from "express";
import authRouter from "./auth.routes.js"
import catsRouter from "./cats.routes.js";

const router = Router()

router.use(authRouter)
router.use(catsRouter)

export default router