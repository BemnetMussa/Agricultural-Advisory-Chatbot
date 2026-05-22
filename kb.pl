% Agricultural Advisory Chatbot
% AI Course - Project 1
% Knowledge Base written in Prolog

% To run:
%   1. consult('agri_chatbot_kb.pl').
%   2. ?- input.
%   3. type yes. or no. for each question


% -- symptoms the farmer may observe --

symptom('Yellowing leaves').
symptom('Wilting of plant').
symptom('Brown or dark spots on leaves').
symptom('White powdery coating on leaves').
symptom('Stunted growth').
symptom('Rotting at base of stem').
symptom('Holes in leaves').
symptom('Orange or rust colored spots').
symptom('Excessive pest presence on crop').
symptom('Dry and cracked soil around plant').


% treatment advice for each symptom

treatment('Yellowing leaves', 'Apply nitrogen-rich fertilizer like urea and check soil pH.').
treatment('Wilting of plant', 'Water the crop immediately and improve field drainage.').
treatment('Brown or dark spots on leaves', 'Apply copper-based fungicide and remove infected leaves.').
treatment('White powdery coating on leaves', 'Spray neem oil or sulfur-based fungicide on the crop.').
treatment('Stunted growth', 'Apply balanced NPK fertilizer and check for root pests.').
treatment('Rotting at base of stem', 'Reduce watering, improve drainage, apply mancozeb fungicide.').
treatment('Holes in leaves', 'Check for caterpillars or beetles and apply insecticide.').
treatment('Orange or rust colored spots', 'Apply systemic fungicide and rotate crops next season.').
treatment('Excessive pest presence on crop', 'Use insecticide and introduce natural predators like ladybugs.').
treatment('Dry and cracked soil around plant', 'Irrigate immediately and mulch the soil to retain moisture.').


% disease rules - diagnosed based on combination of symptoms

disease(leaf_blight) :-
    farmer('Yellowing leaves', yes),
    farmer('Brown or dark spots on leaves', yes).

disease(powdery_mildew) :-
    farmer('White powdery coating on leaves', yes),
    farmer('Wilting of plant', yes).

disease(root_rot) :-
    farmer('Rotting at base of stem', yes),
    farmer('Wilting of plant', yes),
    farmer('Stunted growth', yes).

disease(stem_rust) :-
    farmer('Orange or rust colored spots', yes),
    farmer('Yellowing leaves', yes).

disease(pest_infestation) :-
    farmer('Holes in leaves', yes),
    farmer('Excessive pest presence on crop', yes).

disease(drought_stress) :-
    farmer('Dry and cracked soil around plant', yes),
    farmer('Wilting of plant', yes),
    farmer('Stunted growth', yes).

disease(nitrogen_deficiency) :-
    farmer('Yellowing leaves', yes),
    farmer('Stunted growth', yes),
    farmer('Dry and cracked soil around plant', no).

disease(fungal_infection) :-
    farmer('White powdery coating on leaves', yes),
    farmer('Brown or dark spots on leaves', yes).

% if nothing matched then we dont know the disease
disease(unknown_condition) :-
    not(disease(leaf_blight)),
    not(disease(powdery_mildew)),
    not(disease(root_rot)),
    not(disease(stem_rust)),
    not(disease(pest_infestation)),
    not(disease(drought_stress)),
    not(disease(nitrogen_deficiency)),
    not(disease(fungal_infection)).


% input - asks the farmer about each symptom one by one
% stores the answer using assert so the disease rules can use it

input :-
    dynamic(farmer/2),
    repeat,
    symptom(X),
    write('Does your crop show: '),
    write(X),
    write(' ? '),
    read(Y),
    assert(farmer(X, Y)),
    \+ not(X = 'Dry and cracked soil around plant'),
    not(output).


% output prints the diagnosis and advice at the end

output :-
    nl,
    write('--------- CHATBOT REPORT ---------'), nl,
    possible_diseases,
    nl,
    write('Recommended Actions:'), nl,
    advice,
    nl.

possible_diseases :-
    nl,
    write('Detected Condition(s):'), nl,
    disease(X),
    write('  -> '),
    write(X), nl,
    fail.
possible_diseases.

advice :-
    symptom(X),
    farmer(X, yes),
    treatment(X, Y),
    write('  * '), write(Y), nl,
    fail.
advice.
