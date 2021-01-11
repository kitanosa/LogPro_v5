# реализация будь female husb mother
mother_in_law(Person,X) :-
	female(Person),female(X),
	mother(Person,_),husb(_,X).
	
# реализация только через father mother
motherInLaw(Person3,Person1):-
	father(Person1, Child),
	mother(Person2, Child),
	mother(Person3,Person2).
