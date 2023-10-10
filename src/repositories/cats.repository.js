import db from "../database/database.connection.js"

export function getModels(){
    return db.query(`SELECT * FROM cats;`)
}

export function getMyCats(){

}

export function getCatById(){

}

export function addMyCat(tutorId, name, characteristics, photo){
    return db.query(`INSERT INTO cats ("tutorId", name, characteristics, photo) VALUES ($1, $2, $3, $4);`, [tutorId, name, characteristics, photo])
}