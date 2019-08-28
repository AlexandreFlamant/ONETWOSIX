const youtubeSearch = require('youtube-search');

const youtubeClicks = document.querySelectorAll('.icon-play')

youtubeClicks.forEach((button) => {
  button.addEventListener('click', (e) => {
    openTrailer(e.target.dataset.movieName);
  })
})

// API CALL
const opts = {
  maxResults: 10,
  // API KEY - LOKI GOOGLE ACCOUNT
  key: 'AIzaSyDuIM_E7j65hp-5s2i63_is3Bc7ZOT1214'
};

const openTrailer = (query) => {
 youtubeSearch(query + ' trailer', opts, function(err, results) {
   if(err) return console.log(err);
   window.open(results[0]['link'], '_blank');
 });
}

