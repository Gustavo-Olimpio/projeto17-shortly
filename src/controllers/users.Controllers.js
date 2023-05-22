import { db } from "../database.conection.js";
import bcrypt from 'bcrypt'
import { v4 as uuid } from 'uuid';

export async function signup(req, res) {
    const { name, email, password, confirmPassword } = req.body
    if (password !== confirmPassword) return res.status(422).send("A senhas digitadas possuem valores diferentes")
    const hash = bcrypt.hashSync(password, 10);
    try {
        const user = await db.query(`SELECT * FROM users WHERE "email"=$1;`, [email])
        if (user.rows[0]) return res.status(409).send("Email ja cadastrado")
        await db.query(`INSERT INTO users ("name","email","password") VALUES ($1,$2,$3);`, [name, email, hash])
        res.sendStatus(201)
    } catch (err) {
        return res.status(500).send(err.message);
    }
}

export async function signin(req, res) {
    const { email, password } = req.body
    try {
        const user = await db.query(`SELECT * FROM users WHERE "email"=$1;`, [email])
        if (!user.rows[0]) return res.status(401).send("Email nao cadastrado")
        if (!bcrypt.compareSync(password, user.rows[0].password)) return res.status(401).send("Senha incorreta, verifique sua senha")
        const token = uuid()
        const id = user.rows[0].id
        const existToken = await db.query(`SELECT * FROM tokens WHERE "userId"=${id};`)
        if (!existToken.rows[0]) {
            await db.query(`INSERT INTO "tokens" ("userId","token") VALUES (${id},'${token}');`)
        } else {
            await db.query(`UPDATE "tokens" SET "token"='${token}' WHERE "userId"=${id};`)
        }
        res.status(200).send({ token: token })
    } catch (err) {
        return res.status(500).send(err.message);
    }
}

export async function getUsers(req, res) {
    const {authorization} = req.headers
    if (!authorization) return res.status(401).send("Authorization nao foi informado")
    const token = authorization.replace("Bearer ", "");
    try {
        const auth = await db.query(`SELECT tokens.*,users.name FROM tokens JOIN users ON users.id = tokens."userId" WHERE "token"=$1;`, [token])
        console.log(auth.rows)
        if (!auth.rows[0]) return res.status(401).send("Authorization invalido")
        const dados = await db.query(`SELECT SUM("visitCount") FROM links WHERE "userId"=$1;`, [auth.rows[0].userId])
        const shortenedUrls = await db.query(`SELECT links.id,links."shortUrl",links.url,links."visitCount" FROM links WHERE "userId"=$1;`, [auth.rows[0].userId])
        const objeto = {
            id:auth.rows[0].userId,
            name: auth.rows[0].name,
            visitCount:dados.rows[0].sum,
            shortenedUrls:shortenedUrls.rows
        }
        res.status(200).send(objeto);
    } catch (err) {
        return res.status(500).send(err.message);
    }
}

export async function getRanking(req, res) {
   
    
    try {
        const ranking = await db.query(`SELECT users.id,users.name,CAST(COUNT(links.url) AS INT) AS "linksCount",CAST(COALESCE(SUM("visitCount"),0) AS INT) AS "visitCount" FROM users LEFT JOIN links ON users.id = links."userId" GROUP BY users.id ORDER BY "visitCount" DESC LIMIT 10;`)
        res.status(200).send(ranking.rows);
    } catch (err) {
        return res.status(500).send(err.message);
    }
}