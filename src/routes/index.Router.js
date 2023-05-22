import { Router } from "express";
import { usersValidation,loginValidation } from "../middlewares/users.Validation.js";
import { signup,signin, getUsers, getRanking } from "../controllers/users.Controllers.js";
import { urlValidation } from "../middlewares/url.Validation.js";
import { postUrl,getUrlid, getUrlshort, deleteUrl } from "../controllers/url.Controllers.js";

const router=Router();

router.post('/signup', usersValidation,signup);
router.post('/signin', loginValidation,signin);
router.get('/users/me', getUsers);
router.get('/ranking', getRanking);


router.post('/urls/shorten',urlValidation, postUrl );
router.get('/urls/:id', getUrlid );
router.get('/urls/open/:shortUrl', getUrlshort );
router.delete('/urls/:id', deleteUrl );

export default router