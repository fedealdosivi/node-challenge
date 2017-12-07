
const noteRoutes = require('./note_routes');
const restaurantRoutes = require('./restaurant_routes');
module.exports = function(app, db) {
  noteRoutes(app, db);
  restaurantRoutes(app,db);
};