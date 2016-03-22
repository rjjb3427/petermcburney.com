# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

src = ['assets/artwork/copic/numa.jpg','assets/artwork/copic/turtle.jpg','assets/artwork/sketches/snake.jpg',
    'assets/artwork/copic/harley.jpg','assets/artwork/copic/owl.jpg','assets/artwork/sketches/turtles.jpg']

test = getRandomInt(0, 5)
# console.log test

getRandomInt = (min, max) ->
  Math.floor(Math.random() * (max - min + 1)) + min

setInterval ->
  console.log src[4]
,5000
