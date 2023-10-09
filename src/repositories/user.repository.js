import db from "../database/database.connection.js"

export function getUserByEmail(email){
    return db.query(`SELECT * FROM users WHERE email=$1;`, [email])
}

export function createUser(name, email, password, cpf, phone){
    return db.query(`INSERT INTO users (name, email, password, cpf, phone) VALUES ($1, $2, $3, $4, $5);`, [name, email, password, cpf, phone])
}