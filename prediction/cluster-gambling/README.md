# Clustering Bustabit Gambling Behavior
_Identify what patterns and behaviors of gambling persist_

## Objective
The similarities and differences in the behaviors of different people have long been of interest, particularly in psychology and other social science fields. Understanding human behavior in particular contexts can help us to make informed decisions. Consider a game of poker - understanding why players raise, call, and fold in various situations can provide a distinct advantage competitively.

Along these lines, we are going to focus on the behavior on online gamblers from a platform called Bustabit. There are a few basic rules for playing a game of Bustabit:

1. You bet a certain amount of money (in Bits, which is 1 / 1,000,000th of a Bitcoin) and you win if you cash out before the game busts.
2.  Your win is calculated by the multiplier value at the moment you cashed out. For example, if you bet 100 and the value was 2.50x at the time you cashed out, you win 250. In addition, a percentage Bonus per game is multiplied with your bet and summed to give your final Profit in a winning game. Assuming a Bonus of 1%, your Profit for this round would be (100 x 2.5) + (100 x .01) - 100 = 151
3. The multiplier increases as time goes on, but if you wait too long to cash out, you may bust and lose your money.
4. Lastly, the house maintains slight advantages because in 1 out of every 100 games, everyone playing busts.

## Data
The data we will be working with includes over 40000 games of Bustabit by a bit over 4000 different players, for a total of 50000 rows (one game played by one player). The data includes the following variables:

- Id - Unique identifier for a particular row (game result for one player)
- GameID - Unique identifier for a particular game
- Username - Unique identifier for a particular player
- Bet - The number of Bits (1 / 1,000,000th of a Bitcoin) bet by the player in this game
- CashedOut - The multiplier at which this particular player cashed out
- Bonus - The bonus award (in percent) awarded to this player for the game
- Profit - The amount this player won in the game, calculated as (Bet CashedOut) + (Bet Bonus) - Bet
- BustedAt - The multiplier value at which this game busted
- PlayDate - The date and time at which this game took place
