import { db } from "../database.conection.js";
import { nanoid } from 'nanoid'

export async function postUrl(req, res) {
   const {url} = req.body
   const {authorization} = req.headers
   if (!authorization) return res.status(401).send("Authorization nao foi informado")
   const token = authorization.replace("Bearer ", "");
    try {
        const auth = await db.query(`SELECT * FROM tokens WHERE "token"=$1;`, [token])
        if (!auth.rows[0]) return res.status(401).send("Authorization invalido")
        const shortUrl = nanoid.apply(url)
        await db.query(`INSERT INTO links ("userId","url","shortUrl") VALUES (${auth.rows[0].userId},'${url}','${shortUrl}');`)
        res.status(200).send({id:auth.rows[0].id,shortUrl:shortUrl})
    } catch (err) {
        return res.status(500).send(err.message);
    }
}

export async function getUrlid(req, res) {
   const {id} = req.params
     try {
        const links = await db.query(`SELECT * FROM "links" WHERE "id"=$1;`, [id])
        if (!links.rows[0]) return res.status(404).send("ID invalido")
        delete links.rows[0].userId
        delete links.rows[0].visitCount
        res.status(200).send(links.rows[0])
     } catch (err) {
         return res.status(500).send(err.message);
     }
 }

 export async function getUrlshort(req, res) {
    const {shortUrl} = req.params
      try {
         const links = await db.query(`SELECT * FROM "links" WHERE "shortUrl"=$1;`, [shortUrl])
         if (!links.rows[0]) return res.status(404).send("URL invalida")
        const visitCount = links.rows[0].visitCount + 1
        await db.query(`UPDATE links SET "visitCount"='${visitCount}' WHERE "shortUrl"=$1;`, [shortUrl])
        console.log(links.rows[0].url)
        res.redirect(200,links.rows[0].url)
      } catch (err) {
          return res.status(500).send(err.message);
      }
  }

  export async function deleteUrl(req, res) {
    const {id} = req.params
    const {authorization} = req.headers
   if (!authorization) return res.status(401).send("Authorization nao foi informado")
   const token = authorization.replace("Bearer ", "");
      try {
        const auth = await db.query(`SELECT * FROM tokens WHERE "token"=$1;`, [token])
        if (!auth.rows[0]) return res.status(401).send("Authorization invalido")
        console.log(auth.rows[0])
        const links = await db.query(`SELECT * FROM "links" WHERE "id"=$1;`, [id])
        if(!links.rows[0]) return res.status(404).send("ID invalido, url nao existe")
        console.log(links.rows[0])
        if (auth.rows[0].userId !== links.rows[0].userId) return res.status(401).send("Nao pode deletar uma URL de outro user")
        await db.query(`DELETE FROM "links" WHERE id=${id};`)
        res.sendStatus(204);
      } catch (err) {
          return res.status(500).send(err.message);
      }
  }