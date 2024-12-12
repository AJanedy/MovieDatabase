document.addEventListener('DOMContentLoaded', function() {
    const movieId = window.location.pathname.split('/')[2];  //movie id from url
  
    fetch(`/movieDetails/${movieId}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json(); 
        })
        .then(movie => {
            //add movie information
            const movieTitle = document.getElementById('movie-title');
            const movieTitleHTML = document.createElement('div');
            movieTitleHTML.innerHTML = `
                <h1>${movie.title} (${movie.release_year})</h1>
            `;
            movieTitle.appendChild(movieTitleHTML);

            //movie poster
            const movieImg = document.getElementById('movie-img');
            const movieImgHTML = document.createElement('div');
            movieImgHTML.innerHTML = `
                <img src="/images/${movie.movie_poster}" alt="${movie.title}" style="max-width: 100%;"></img>
            `;
            movieImg.appendChild(movieImgHTML);

            //add production company information
            const productionDetails = document.getElementById('production-details');
            const productionHTML = document.createElement('div');
            productionHTML.innerHTML = `
                <p><strong>Director:</strong> ${movie.director_name}</p>
                <p><strong>Production Company:</strong> ${movie.company_name}</p>
                <p><strong>Year Founded:</strong> ${movie.year_founded}</p>
                <p><strong>Headquarters:</strong> ${movie.prodAddress}</p>
            `;
            productionDetails.appendChild(productionHTML);
        
            //add cast information
            const castDetails = document.getElementById('cast-details');
            const castHTML = document.createElement('div');
            if (Array.isArray(movie.cast) && movie.cast.length > 0) {
                castHTML.innerHTML = '<h3>Cast:</h3><ul>';
                movie.cast.forEach(castMember => {
                castHTML.innerHTML += `
                    <li><strong>${castMember.actor_name}</strong> as ${castMember.character_name}</li>
                `;
                });
                castHTML.innerHTML += '</ul><p></p>';
                castDetails.appendChild(castHTML);
            } else {
                castHTML.innerHTML += '<p>No cast information available.</p>';
                castDetails.appendChild(castHTML);
            }

            // Add ratings information
            const ratingsDetails = document.getElementById('ratings-details');
            const ratingsHTML = document.createElement('div');
            if (Array.isArray(movie.ratings) && movie.ratings.length > 0) {
                ratingsHTML.innerHTML = '<h3>Ratings:</h3><ul>';
                movie.ratings.forEach(rating => {
                ratingsHTML.innerHTML += `
                    <li><strong>${rating.source}:</strong> ${rating.rating} (Top 25 Rank: ${rating.top_25_rank || 'N/A'})</li>
                `;
                });
                ratingsHTML.innerHTML += '</ul><p></p>';
                ratingsDetails.appendChild(ratingsHTML);
            } else {
                ratingsHTML.innerHTML += '<p>No rating information available.</p>';
                ratingsDetails.appendChild(ratingsHTML);
            }

            //add website information
            const websiteDetails = document.getElementById('website-details');
            const websiteDetailsHTML = document.createElement('div');
            websiteDetailsHTML.innerHTML = `
                <h3>External Links:</h3>
                <p><strong>IMDb:</strong> <a href="${movie.imdb_url}" target="_blank">${movie.imdb_url}</a></p>
                <p><strong>Metacritic:</strong> <a href="${movie.metacritic_url}" target="_blank">${movie.metacritic_url}</a></p>
                <p><strong>Rotten Tomatoes:</strong> <a href="${movie.rotten_tomatoes_url}" target="_blank">${movie.rotten_tomatoes_url}</a></p>
                <p><strong>Wikipedia:</strong> <a href="${movie.wikipedia_url}" target="_blank">${movie.wikipedia_url}</a></p>
            `;
            websiteDetails.appendChild(websiteDetailsHTML);
        })

        .catch(err => {
            console.error('Error fetching movie details:', err);
        });
});
  