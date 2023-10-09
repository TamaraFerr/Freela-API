import Joi from "joi";

export const catsSchema = Joi.object({
    name: Joi.string().min(3).required(),
    photo: Joi.string().required(),
    characteristics: Joi.string().required()
});

export const availableCatSchema = Joi.object({
    active: Joi.boolean().required()
});