/* Knowledge Base */  
food_type(starches, mandazi).
food_type(starches, bread). 

food_type(proteins, eggs).
food_type(proteins, sausages).
food_type(proteins, fish).
food_type(proteins, chicken).

food_type(vegetables, spinach).
food_type(vegetables, sukuma_wiki).
food_type(vegetables, kunde).

food_type(fruits, avocado).
food_type(fruits, banana).
food_type(fruits, mango).
food_type(fruits, apple).

food_type(drinks, tea).
food_type(drinks, coffee).
food_type(drinks, juice).
food_type(drinks, milk).
food_type(drinks, water).

/* Recommendations based on BMI and meal times */
recommend_food(BMI, morning, Recommendation) :-
    bmi_category(Category, BMI),
    recommend_meal(Category, morning, Recommendation).

recommend_food(BMI, lunch, Recommendation) :-
    bmi_category(Category, BMI),
    recommend_meal(Category, lunch, Recommendation).

recommend_food(BMI, dinner, Recommendation) :-
    bmi_category(Category, BMI),
    recommend_meal(Category, dinner, Recommendation).

recommend_meal('Underweight', morning, [Starch, Protein, Fruit, Drink]) :-
    food_type(starches, Starch),
    (Starch = mandazi ; Starch = bread),
    food_type(proteins, Protein),
    food_type(fruits, Fruit),
    food_type(drinks, Drink),
    (Drink = tea ; Drink = coffee).

recommend_meal('Underweight', lunch, [Starch, Protein, Vegetable, Fruit, Drink]) :-
    food_type(starches, Starch),
    food_type(proteins, Protein),
    food_type(vegetables, Vegetable),
    food_type(fruits, Fruit),
    food_type(drinks, Drink),
    (Drink = juice ; Drink = water).

recommend_meal('Underweight', dinner, [Starch, Protein, Vegetable, Fruit, Drink]) :-
    food_type(starches, Starch),
    food_type(proteins, Protein),
    food_type(vegetables, Vegetable),
    food_type(fruits, Fruit),
    food_type(drinks, Drink),
    (Drink = juice ; Drink = water).

recommend_meal('Normal', morning, [Starch, Protein, Fruit, Drink]) :-
    food_type(starches, Starch),
    (Starch = mandazi ; Starch = bread),
    food_type(proteins, Protein),
    food_type(fruits, Fruit),
    food_type(drinks, Drink),
    (Drink = tea ; Drink = coffee ; Drink = milk).

recommend_meal('Normal', lunch, [Starch, Protein, Vegetable, Fruit, Drink]) :-
    food_type(starches, Starch),
    food_type(proteins, Protein),
    food_type(vegetables, Vegetable),
    food_type(fruits, Fruit),
    food_type(drinks, Drink),
    (Drink = juice ; Drink = water).

recommend_meal('Normal', dinner, [Starch, Protein, Vegetable, Fruit, Drink]) :-
    food_type(starches, Starch),
    food_type(proteins, Protein),
    food_type(vegetables, Vegetable),
    food_type(fruits, Fruit),
    food_type(drinks, Drink),
    (Drink = juice ; Drink = water).

recommend_meal('Overweight', morning, [Starch, Protein, Fruit, Drink]) :-
    food_type(starches, Starch),
    (Starch = mandazi ; Starch = bread),
    food_type(proteins, Protein),
    food_type(fruits, Fruit),
    food_type(drinks, Drink),
    (Drink = tea ; Drink = coffee).

recommend_meal('Overweight', lunch, [Starch, Protein, Vegetable, Fruit, Drink]) :-
    food_type(starches, Starch),
    (Starch = bread),
    food_type(proteins, Protein),
    food_type(vegetables, Vegetable),
    food_type(fruits, Fruit),
    food_type(drinks, Drink),
    (Drink = juice ; Drink = water).

recommend_meal('Overweight', dinner, [Starch, Protein, Vegetable, Fruit, Drink]) :-
    food_type(starches, Starch),
    (Starch = bread),
    food_type(proteins, Protein),
    food_type(vegetables, Vegetable),
    food_type(fruits, Fruit),
    food_type(drinks, Drink),
    (Drink = juice ; Drink = water).

recommend_meal('Obese', morning, [Starch, Protein, Fruit, Drink]) :-
    food_type(starches, Starch),
    (Starch = mandazi ; Starch = bread),
    food_type(proteins, Protein),
    food_type(fruits, Fruit),
    food_type(drinks, Drink),
    (Drink = tea ; Drink = coffee).

recommend_meal('Obese', lunch, [Starch, Protein, Vegetable, Fruit, Drink]) :-
    food_type(starches, Starch),
    (Starch = bread),
    food_type(proteins, Protein),
    food_type(vegetables, Vegetable),
    food_type(fruits, Fruit),
    food_type(drinks, Drink),
    (Drink = juice ; Drink = water).

recommend_meal('Obese', dinner, [Starch, Protein, Vegetable, Fruit, Drink]) :-
    food_type(starches, Starch),
    (Starch = bread),
    food_type(proteins, Protein),
    food_type(vegetables, Vegetable),
    food_type(fruits, Fruit),
    food_type(drinks, Drink),
    (Drink = juice ; Drink = water).

/* BMI Categories */
bmi_category('Underweight', BMI) :- BMI < 18.5.
bmi_category('Normal', BMI) :- BMI >= 18.5, BMI < 25.
bmi_category('Overweight', BMI) :- BMI >= 25, BMI < 30.
bmi_category('Obese', BMI) :- BMI >= 30.

/* Query */
start :-
    write('Welcome to the Nutrition Advisor!'), nl,
    write('Please enter your weight (in kg): '),
    read(Weight),
    write('Please enter your height (in meters): '),
    read(Height),
    BMI is Weight / (Height * Height),
    write('Your BMI is: '), write(BMI), nl,
    write('Please enter the time of the day (morning, lunch, or dinner): '),
    read(Time),
    recommend_food(BMI, Time, Recommendation),
    write('Recommended meal: '), write(Recommendation), nl.
