var express = require('express');
var router = express.Router();
var path = require('path'); 

const con = require('../connection');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.sendFile(path.join(__dirname, 'index.html'));
});

router.get('/movies', function(req, res, next) {
  const query = `
    SELECT m.movie_id, m.title, m.release_year, AVG(CASE WHEN source = 'IMDb' THEN CAST(r.rating AS DECIMAL) * 10
      ELSE CAST(r.rating AS DECIMAL) END) AS average_rating
    FROM movie m LEFT JOIN ratings r USING (movie_id)
    GROUP BY m.movie_id;
  `;
  con.query(query, function(err, result) {
    if (err) {
      console.log("Error retreiving movies");
      return next(err);
    }
    console.log(result);
    res.json(result);
  });
});

router.get('/movie/:id', function(req, res, next) {
  res.sendFile(path.join(__dirname,'..', 'public','movie.html'));
});

router.get('/movieDetails/:id', function(req, res, next) {

  const movieId = req.params.id;
  //build queries
  const queryMovie = `
    SELECT movie_id, title, release_year, director_name
    FROM movie
    WHERE movie_id = ?
  `;

  const queryProduction = `
    SELECT m.movie_id, p.production_company_id, p.company_name, p.year_founded, CONCAT(p.headquarters_city, ", ", p.headquarters_country) AS prodAddress
    FROM movie m
    LEFT JOIN production_company p USING (production_company_id)
    WHERE m.movie_id = ?
`;
  
  const queryCast = `
    SELECT actor_name, character_name
    FROM cast 
    WHERE movie_id = ?
  `;
  
  const queryRatings = `
    SELECT source, rating, top_25_rank
    FROM ratings 
    WHERE movie_id = ?
  `;
  
  const queryWebsite = `
    SELECT imdb_url, metacritic_url, rotten_tomatoes_url, wikipedia_url
    FROM website 
    WHERE movie_id = ?
  `;
  
  //fetch the movie information
  con.query(queryMovie, [movieId], function(err, movieResults) {
    if (err) {
      console.log("Error retrieving movie.");
      next(err);
    }

    if (movieResults.length === 0) {
      res.status(404).send('Movie not found');
      return;
    }

    const movieData = movieResults[0];

    //fetch production company information
    con.query(queryProduction, [movieId], (err, productionResults) => {
      if (err) {
        console.log("Error retrieving production company.");
        next(err);
      }
      const productionData = productionResults[0] || {};

      //fetch the cast information
      con.query(queryCast, [movieId], (err, castResults) => {
        if (err) {
          console.log("Error retrieving cast.");
          next(err);
        }

        //fetch the ratings information
        con.query(queryRatings, [movieId], (err, ratingsResults) => {
          if (err) {
            console.log("Error retrieving ratings.");
            next(err);
          }

          //fetch the website URLs
          con.query(queryWebsite, [movieId], (err, websiteResults) => {
            if (err) {
              console.log("Error retrieving website links.");
              next(err);
            }

            const websiteData = websiteResults[0] || {};

            //combine all the results and send them as the response
            const responseData = {
              title: movieData.title,
              release_year: movieData.release_year,
              movie_poster: `${movieId}.jpg`,
              director_name: movieData.director_name,
              production_company_name: movieData.production_company_name,
              company_name: productionData.company_name,
              year_founded:productionData.year_founded,
              prodAddress:productionData.prodAddress,
              cast: castResults || [], 
              ratings: ratingsResults || [],
              imdb_url: websiteData.imdb_url,
              metacritic_url: websiteData.metacritic_url,
              rotten_tomatoes_url: websiteData.rotten_tomatoes_url,
              wikipedia_url: websiteData.wikipedia_url
            };
            console.log('Sending response:', responseData);
            res.json(responseData);
          });
        });
      });
    });
  }); 
});

module.exports = router;
