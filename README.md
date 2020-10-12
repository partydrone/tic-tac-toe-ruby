# Tic Tac Toe
This is a basic command-line version of Tic Tac Toe written in Ruby. There are
Two ways to run the game.

## Requirements
Create a Tic Tac Toe game with these features:

- [x] A way for each player to take their turn and enter their move
- [x] Only valid moves are allowed
- [x] Detect when one player has won
- [x] Detect when there is a tie
- [x] Show the current game board
- [x] Show the current score

## Installation
First, clone this repository to your computer.

```bash
$ git clone https://github.com/partydrone/tic-tac-toe-ruby.git tic-tac-toe-ruby
```

### Local
Make sure you have Ruby installed on your computer and install the necessary gems.

```bash
$ bundle install
```

### Docker
Install [Docker Desktop for Mac or Windows](https://www.docker.com/products/docker-desktop),
then build and start a container.

```bash
$ docker-compose build
$ docker-compose run --rm ruby bash
```

## Playing

Execute the Ruby script to run the game.

```bash
$ ruby ./lib/tic_tac_toe.rb
```
