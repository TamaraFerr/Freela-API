import { getModels, addMyCat } from "../repositories/cats.repository";

export async function AddingCat(req, res){
    const {name, photo, characteristics} = req.body
    const userInformation = response.locals.user
    const tutorId = userInformation.rows[0].id

    try {
        await addMyCat(name, photo, characteristics, tutorId)
        
        res.sendStatus(201)

    } catch (err) {
        res.status(500).send(err.message) 
    }
}

export async function getCats(req, res){
    const availableCats = []

    try {
        const availableCatsList = await getModels()

        availableCatsList.rows.map(cat => {
            if (cat.available === false) return cat

            availableCats.push(cat)

            if (availableCats == []) {
                return res.status(204).send( {message: "Não há nenhum moewdelo no momento."} )
            }
        })

        res.status(200).send(availableCats)

    } catch (err) { 
        res.status(500).send(err.message) 
    }
}

