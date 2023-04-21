# Roulete_Game

Roulette game made using VHDL for the Altera DE2-115 board (Cyclone IV E). Input bets through slider switches and receive outputs through the HEX displays.

KEY(1): used for resetting game.
KEY(0): used for reading switch values (user bets)

The user places the following quantities on the switches:
Bet 0: Amount to bet ($0-$7): Switches 2-0
 Number to bet on (0-36): Switches 8-3
 Bet 1: Amount to bet ($0-$7): Switches 9-11
 Colour to bet on (0-1): Switch 12 [red=1, black=0]
 Bet 2: Amount to bet ($0-$7): Switches 15-13
 Dozen to bet on (0,1 or 2): Switches 17-1