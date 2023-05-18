import { Router } from "express";
import { usersValidation,loginValidation } from "../middlewares/users.Validation.js";
import { signup,signin } from "../controllers/users.Controllers.js";

const router=Router();

router.post('/signup', usersValidation,signup);
router.post('/signin', loginValidation,signin);

export default router