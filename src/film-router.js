const Router = require('../framework/Router');
const filmController = require('../controllers/film-controller');

const router = new Router();

router.get('/film', router.selectFilm);
router.post('/addfilm', router.addFilm);
router.get('/genre', router.selectGenre);
router.post('/addgenre', router.addGenre);
router.get('/genrefilms', router.selectGenreFilm);

module.exports = router;