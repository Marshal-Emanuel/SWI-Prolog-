/* Knowledge Base */
food_type(starches, ugali).
food_type(starches, chapati).
food_type(starches, rice).
food_type(starches, matoke).
food_type(vegetables, sukuma_wiki).
food_type(vegetables, kunde).
food_type(vegetables, managu).
food_type(proteins, nyama_choma).
food_type(proteins, fish).
food_type(proteins, beans).
food_type(dairy, maziwa_mala).
food_type(dairy, ghee).
food_type(fruits, mango).
food_type(fruits, banana).
food_type(fruits, avocado).

/* BMI Categories */
bmi_category(Underweight, BMI) :- BMI < 18.5, Underweight = true.
bmi_category(Normal, BMI) :- BMI >= 18.5, BMI < 25, Normal = true.
bmi_category(Overweight, BMI) :- BMI >= 25, BMI < 30, Overweight = true.
bmi_category(Obese, BMI) :- BMI >= 30, Obese = true.

/* Recommendations based on BMI and meal times */
recommend_food(BMI, morning) :-
    bmi_category(Underweight, BMI),
    write('Recommended morning meal: Bread with avocado and a glass of milk.').

recommend_food(BMI, morning) :-
    bmi_category(Normal, BMI),
    write('Recommended morning meal: Mandazi with tea or coffee.').

recommend_food(BMI, morning) :-
    bmi_category(Overweight, BMI); bmi_category(Obese, BMI),
    write('Recommended morning meal: Oatmeal with fruits and a glass of water.').

recommend_food(BMI, afternoon) :-
    bmi_category(Underweight, BMI),
    write('Recommended afternoon meal: Rice with fish and kunde.').

recommend_food(BMI, afternoon) :-
    bmi_category(Normal, BMI),
    write('Recommended afternoon meal: Ugali with nyama choma and managu.').

recommend_food(BMI, afternoon) :-
    bmi_category(Overweight, BMI); bmi_category(Obese, BMI),
    write('Recommended afternoon meal: Chapati with sukuma wiki and ghee.').

recommend_food(BMI, dinner) :-
    bmi_category(Underweight, BMI),
    write('Recommended dinner meal: Chapati with beans and maziwa mala.').

recommend_food(BMI, dinner) :-
    bmi_category(Normal, BMI),
    write('Recommended dinner meal: Rice with fish and avocado.').

recommend_food(BMI, dinner) :-
    bmi_category(Overweight, BMI),
    write('Recommended dinner meal: Ugali with sukuma wiki and ghee.').

recommend_food(BMI, dinner) :-
    bmi_category(Obese, BMI),
    write('Recommended dinner meal: Matoke with nyama choma and managu.').

/* Predicate to calculate BMI */
calculate_bmi(Weight, Height, BMI) :-
    BMI is Weight / (Height * Height).

/* Query */
start :-
    write('Welcome to the Nutrition Advisor!'), nl,
    write('Please enter your weight (in kg): '),
    read(Weight),
    write('Please enter your height (in meters): '),
    read(Height),
    calculate_bmi(Weight, Height, BMI),
    write('Your BMI is: '), write(BMI), nl,
    write('Please enter the time of the day (morning, afternoon, or dinner): '),
    read(Time),
    recommend_food(BMI, Time).
