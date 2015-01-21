# War

## Design Approach

- Actors
  - Game
  - Player
  - Table
- State
  - cards played on table
  - list of players
  - player's cards
  - pid for table
- Agents
  - CardsPlayed, holds played cards on the table
  - Players, holds player maps (this is the list of players)
  - :p1, holds player's cards
  - :p2, holds player's cards
  - TablePid

## Tasks

### Doing

### To Do

- tie
- player runs out of cards during a war and can't lay down 3 cards
- when is the game over?
- too much code in the Game.init. there has to be a way to simplify that.

### Done

- table figures out which card is higher
- table sends the cards to the appropriate player
- game start
  - players print out their cards
  - players play their top card
    - each card, along with the player map is added to Table

