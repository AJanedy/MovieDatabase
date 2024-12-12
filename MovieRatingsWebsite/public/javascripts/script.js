document.addEventListener('DOMContentLoaded', function() {
    fetch('/movies')
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json(); 
      })
      .then(movies => {
        const movieList = document.getElementById('movie-list');
        const movieCards = []; //array to store the movie elements for sorting later
        
        //loop through movies to create cards
        if (movies.length > 0) {
          movies.forEach(movie => {
            const movieHTML = document.createElement('div');
            movieHTML.classList.add('col-md-2', 'mb-4'); //bootstraps columns

            //sorting datam only
            movieHTML.setAttribute('data-rating', movie.average_rating);
            movieHTML.setAttribute('data-year', movie.release_year);

            //grab poster from images via movie_id
            var moviePosterUrl = `../images/${movie.movie_id}.jpg`;

            //check to see if image exists
            var img = new Image();
            img.onload = function() {
                //image exists
                movieHTML.innerHTML = `
                <div class="movie-card">
                    <a href="/movie/${movie.movie_id}">
                        <img src="${moviePosterUrl}" alt="${movie.title}" class="card-img-top" style="width:100%; height: auto;">
                        <div class="card-body">
                            <h5 class="card-title">${movie.title}</h5>
                        </div>
                    </a>
                </div>
                `;
                movieList.appendChild(movieHTML);
                movieCards.push({ element: movieHTML, movie: movie });
            };
            img.onerror = function() {
                //failed, use the default image
                moviePosterUrl = '../images/default.jpg';
                movieHTML.innerHTML = `
                <div class="card">
                    <a href="/movie/${movie.movie_id}">
                        <img src="${moviePosterUrl}" alt="${movie.title}" class="card-img-top" style="width:100%; height: auto;">
                        <div class="card-body">
                            <h5 class="card-title">${movie.title}</h5>
                        </div>
                    </a>
                </div>
                `;
                movieList.appendChild(movieHTML);
                movieCards.push({ element: movieHTML, movie: movie });
            };
            img.src = moviePosterUrl;
            });
        } else {
            movieList.innerHTML = '<p>No movies found</p>';
        }
        
        //sort list
        const sortBySelect = document.getElementById('sort-movies');
        function sortMovies(criteria) {
          let sortedMovies;

          //clear movie list before sorting
          movieList.innerHTML = '';

          if (criteria === 'title-ASC') {
            sortedMovies = movieCards.sort((a, b) => a.movie.title.localeCompare(b.movie.title));
          } else if (criteria === 'title-DESC') {
            sortedMovies = movieCards.sort((a, b) => b.movie.title.localeCompare(a.movie.title))
          } else if (criteria === 'rating-DESC') {
            sortedMovies = movieCards.sort((a, b) => b.movie.average_rating - a.movie.average_rating);
          } else if (criteria === 'rating-ASC') {
            sortedMovies = movieCards.sort((a, b) => a.movie.average_rating - b.movie.average_rating);
          } else if (criteria === 'year-ASC') {
            sortedMovies = movieCards.sort((a, b) => a.movie.release_year - b.movie.release_year);
          } else if (criteria === 'year-DESC') {
            sortedMovies = movieCards.sort((a, b) => b.movie.release_year - a.movie.release_year);
          }

          sortedMovies.forEach(item => {
            movieList.appendChild(item.element);
          });
        }

        //listener for the sorting dropdown
        sortBySelect.addEventListener('change', (event) => {
          const selectedCriteria = event.target.value;
          sortMovies(selectedCriteria);
        });
        
        })
        .catch(function(err) {
        console.error('Error fetching movies:', err);
        });
});