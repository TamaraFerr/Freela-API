import Joi from "joi";

export const userSchema = Joi.object({
    name: Joi.string().required(),
    email: Joi.string().email().required(),
    password: Joi.string().min(3).required(),
    cpf: Joi.string().length(11).required(),
    phone: Joi.string().min(9).max(11).required()
});