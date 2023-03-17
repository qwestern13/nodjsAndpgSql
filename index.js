const PORT = 8000;
const Application = require('./framework/Application');
const filmRouter = require('./src/film-router');
const jsonParser = require('./framework/parseJson')
const app = new Application();
const parseUrl = require('./framework/parseUrl');



app.use(jsonParser);
app.use(parseUrl('http://localhost:8000'));

app.addRouter(filmRouter);
app.listen(PORT, () => console.log(`Server started in ${PORT} port`));

