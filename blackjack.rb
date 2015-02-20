
cards = [{"Two_Clubs"=>2}, {"Two_Hearts"=>2}, {"Two_Spades"=>2}, {"Two_Diamonds"=>2},
{"Three_Clubs"=>3}, {"Three_Hearts"=>3}, {"Three_Spades"=>3}, {"Three_Diamonds"=>3},
{"Four_Clubs"=>4}, {"Four_Hearts"=>4}, {"Four_Spades"=>4}, {"Four_Diamonds"=>4},
{"Five_Clubs"=>5}, {"Five_Hearts"=>5}, {"Five_Spades"=>5}, {"Five_Diamonds"=>5},
{"Six_Clubs"=>6}, {"Six_Hearts"=>6}, {"Six_Spades"=>6}, {"Six_Diamonds"=>6},
{"Seven_Clubs"=>7}, {"Seven_Hearts"=>7}, {"Seven_Spades"=>7}, {"Seven_Diamonds"=>7},
{"Eight_Clubs"=>8}, {"Eight_Hearts"=>8}, {"Eight_Spades"=>8}, {"Eight_Diamonds"=>8},
{"Nine_Clubs"=>9}, {"Nine_Hearts"=>9}, {"Nine_Spades"=>9}, {"Nine_Diamonds"=>9},
{"Ten_Clubs"=>10}, {"Ten_Hearts"=>10}, {"Ten_Spades"=>10}, {"Ten_Diamonds"=>10},
{"Jack_Clubs"=>10}, {"Jack_Hearts"=>10}, {"Jack_Spades"=>10}, {"Jack_Diamonds"=>10},
{"Queen_Clubs"=>10}, {"Queen_Hearts"=>10}, {"Queen_Spades"=>10}, {"Queen_Diamonds"=>10},
{"King_Clubs"=>10}, {"King_Hearts"=>10}, {"King_Spades"=>10}, {"King_Diamonds"=>10},
{"Ace_Clubs"=>[1,11]}, {"Ace_Hearts"=>[1,11]}, {"Ace_Spades"=>[1,11]}, {"Ace_Diamonds"=>[1,11]}]

player_cards = []
player_points = 0

puts "Welcome to the Blackjack game!"
puts "Rules:\nThe Bank stand at 17.\nInsurance pays 2 to 1" 

while player_points < 21 do 

	puts "Do you want a card?? (hit or stand)"
	input = gets.chomp

	if input == "hit"
			card = cards.delete_at(rand(0...cards.size))  
	else 
			puts "You stand with #{player_points} points"
			 break
	end
	player_cards << card
	card_name = card.keys.first

	if card.values.first.class == Fixnum
			card_value = card.values.first 
	elsif card.values.first.class == Array && player_points <= 11
			card_value = card.values.first.last
	else
			 card_value = card.values.first	   
	end

	player_points += card_value
	puts "You got #{card_name}(#{card_value} points)..\nYou have #{player_points} points"
end

if player_points > 21
	puts "You went too far :("
elsif player_points == 21 
	puts "Oh! Blackjack!! ;)"
end

bank_cards = []
bank_points = 0

while bank_points < 17 do

	card = cards.delete_at(rand(0...cards.size)) 
	bank_cards << card
	card_name = card.keys.first

		if card.values.first.class == Fixnum
				card_value = card.values.first 
		elsif card.values.first.class == Array && bank_points <= 11
				card_value = card.values.first.last
		else
				 card_value = card.values.first  
		end

	bank_points += card_value

	puts
	puts "The bank got #{card_name}(#{card_value} points)\nTotal points of the Bank:#{bank_points}!" 
end
puts
puts "Resolution:"
puts "Your points: #{player_points} vs Bank points: #{bank_points}"

if player_points <= 21 && bank_points <= 21
	if player_points > bank_points 
		puts "You won! :) Congratulation !!" 
	elsif player_points < bank_points
		puts "You lose! :( maybe next time mate..." 
	else
		puts "It's a tie!"
	end
elsif player_points > 21 && bank_points <= 21
		puts "You lose! :( maybe next time mate..." 	
elsif player_points <= 21 && bank_points > 21
		puts "You won! :) Congratulation !!" 
else
		puts "Both lose :/"
end



	