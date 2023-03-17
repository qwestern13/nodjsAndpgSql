//const http = require('http');
//const EventEmitter = require('events');
const PORT = 8000;
//const Router = require('./framework/Router');
const Application = require('./framework/Application');
const filmRouter = require('./src/film-router');
const jsonParser = require('./framework/parseJson')
const app = new Application();
const parseUrl = require('./framework/parseUrl');
//const router = new Router();

//router.get(req, res);

app.use(jsonParser);
app.use(parseUrl('http://localhost:8000'));

app.addRouter(filmRouter);
app.listen(PORT, () => console.log(`Server started in ${PORT} port`));

