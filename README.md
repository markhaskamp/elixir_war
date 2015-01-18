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
  - Players, holds player maps (this is the lsit of players)
  - :p1, holds player's cards
  - :p2, holds player's cards
  - TablePid

## Tasks

### Doing

### To Do

- table figures out which cards is higher
- table sends the cards to the appropriate player

### Done

- game start
  - players print out their cards
  - players play their top card
    - each card, along with the player map is added to Table

