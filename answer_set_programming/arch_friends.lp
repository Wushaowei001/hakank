% 
% Arch friends puzzle (Dell Logic Puzzles) in ASP.
% 
% Problem formulation from 
% http://brownbuffalo.sourceforge.net/ArchFriendsClues.html
% """
% Title: Arch Friends
% Author: Mark T. Zegarelli
% Publication: Dell Logic Puzzles
% Issue: April, 1998
% Page: 7
% Stars: 1
%
% Harriet, upon returning from the mall, is happily describing her four shoe 
% purchases to her friend Aurora. Aurora just loves the four different kinds 
% of shoes that Harriet bought (ecru espadrilles, fuchsia flats, purple pumps, 
% and suede sandals), but Harriet can't recall at which different store (Foot 
% Farm, Heels in a Handcart, The Shoe Palace, or Tootsies) she got each pair. 
% Can you help these two figure out the order in which Harriet bought each 
% pair of shoes, and where she bought each?
%
% 1. Harriet bought fuchsia flats at Heels in a Handcart.
% 2. The store she visited just after buying her purple pumps was not Tootsies.
% 3. The Foot Farm was Harriet's second stop.
% 4. Two stops after leaving The Shoe Place, Harriet bought her suede sandals.
% 
% Determine: Order - Shoes - Store 
% """

%
% 
% This was created by Hakan Kjellerstrand, hakank@bonetmail.com
% See also http://www.hakank.org/answer_set_programming/
%

% Answer:
% 1, purple pumps, The Shoe Place
% 2, ecru espadrilles, Foot Farm
% 3, suede sandals, Tooties
% 4, fuchsia flats, Heels in a Handcart 


shoes(ecru_espadrilles;fuchsia_flats;purple_pumps;suede_sandals).
shops(foot_farm;heels_in_a_handcart;the_shoe_palace;tootsies).

order(1..4).

% all differents
1 { shoe(Shoe, Order) : order(Order) } 1 :- shoes(Shoe).
1 { shoe(Shoe, Order) : shoes(Shoe)} 1 :- order(Order).

1 { shop(Shop, Order) : order(Order) } 1 :- shops(Shop).
1 { shop(Shop, Order) : shops(Shop)} 1 :- order(Order).


% 1. Harriet bought fuchsia flats at Heels in a Handcart.
c1 :- 
    shoe(fuchsia_flats, Order), 
    shop(heels_in_a_handcart, Order).
:- not c1.

% 2. The store she visited just after buying her purple pumps was not Tootsies.
c2 :- 
    shoe(purple_pumps, PP), 
    shop(tootsies, T), 
    PP + 1 != T.
:- not c2.

% 3. The Foot Farm was Harriet's second stop.
shop(foot_farm, 2).

% 4. Two stops after leaving The Shoe Place, Harriet bought her suede sandals.
c4 :- 
    shop(the_shoe_palace, SP), 
    shoe(suede_sandals, SS), SP + 2 == SS.
:- not c4.


%
% output
%
x(Order, Shoe, Shop) :- shop(Shop, Order), shoe(Shoe, Order).

#hide.
#show x(Order, Shoe, Shope).