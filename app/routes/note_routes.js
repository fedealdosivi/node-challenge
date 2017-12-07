module.exports = function(app, db) {
	app.post('/notes', (req, res) => {
		console.log(req.headers)
    	res.send('Hello')
  });
};