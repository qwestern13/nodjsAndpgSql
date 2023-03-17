const Router = require('../framework/Router');

const router = new Router();

router.get('/film', router.selectFilm);
router.post('/addfilm', router.addFilm);
router.get('/genre', router.selectGenre);
router.post('/addgenre', router.addGenre);
router.get('/genrefilms', router.selectGenreFilm);
router.post('/updatefilm', router.updateFilm);
router.delete('/delete', router.filmDelete);
router.delete('/delgenre', router.genreDelete);

module.exports = router;