import { listUsersCats } from "../repositories/user.repository.js"

export async function listUsersCats (req, res) {
    const userInformation = response.locals.user
    const tutorId = userInformation.rows[0].id

    try {
        const userCats = await listUsersCats(tutorId)
        
        res.status(200).send(userCats.rows)

    } catch (err) { 
        res.status(500).send(err.message) 
    }
}