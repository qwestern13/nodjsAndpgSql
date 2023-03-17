//const FilmController = require('../controllers/film.contriller');
const db = require('../db');

module.exports = class Router {
    constructor() {
        this.endpoints = {}
    }

    request(method = 'GET', path, handler) {
        if(!this.endpoints[path]) {
            this.endpoints[path] = {}
        }
        const endpoint = this.endpoints[path];

        if(endpoint[method]) {
            throw new Error(`[${method}] по алресу ${path} уже существует!`);
        }

        endpoint[method] = handler;
        
    }


    async selectFilm(req, res) {
        if (req.params.id) {
            const id = req.params.id;
            const film = await db.query(`SELECT * FROM film WHERE id = $1`, [id]);
            res.send(film.rows);    
        }
        else {
            const films = await db.query(`SELECT * FROM film`);
            res.send(films.rows);
        }
    }

    async addFilm(req, res) {
        const film_name = req.params.film_name;
        const year = req.params.year;
        const film = await db.query(`INSERT INTO film(film_name, release_year) VALUES ($1, $2) RETURNING *`, [film_name, year]);
        res.send(film.rows);
    }
    
    async selectGenre(req, res) {
        const genre = await db.query(`SELECT * FROM genre`);
        res.send(genre.rows);
    }

    async addGenre(req, res) {
        const genre_name = req.params.genre_name;
        const genre = await db.query(`INSERT INTO genre(genre_name) VALUES ($1) RETURNING *`, [genre_name]);
        res.send(genre.rows);
    }

    async selectGenreFilm(req, res) {
        if(req.params.film_id) {
            const film_id = req.params.film_id;
            const genre = await db.query(`SELECT film.id, film.film_name, genre.genre_name FROM film LEFT JOIN film_genre ON film_genre.film_id = film.id  AND film_id = $1 JOIN genre ON film_genre.genre_id = genre.id`, [film_id]);
            res.send(genre.rows);
        }
        else {
            const genres = await db.query(`SELECT film.id, film.film_name, genre.genre_name FROM film LEFT JOIN film_genre ON film_genre.film_id = film.id LEFT JOIN genre ON film_genre.genre_id = genre.id`);
            res.send(genres.rows);
        }
    }

    get(path, handler) {

        this.request('GET', path, handler);
        
    }

    post(path, handler) {

        this.request('POST', path, handler);
        
    }

    put(path, handler) {
        this.request('PUT', path, handler);
    }

    delete(path, handler) {
        this.request('DELETE', path, handler);
    }
}