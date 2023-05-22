import {urlSchema} from "../schemas/url.Schema.js"

export function urlValidation(req,res,next){

    const validation = urlSchema.validate(req.body, { abortEarly: false });

    if (validation.error) {
        const errors = validation.error.details.map((detail) => detail.message);
        return res.status(422).send(errors);
    }
    next()
}