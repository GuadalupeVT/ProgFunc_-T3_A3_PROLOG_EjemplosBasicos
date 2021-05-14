mujer(ana).
mujer(maria).
mujer(luisa).
mujer(fabiola).
mujer(esther).
mujer(rocio).
mujer(diana).
mujer(vanessa).
mujer(martha).
mujer(olivia).

hombre(hugo). adulto(hugo).
hombre(paco).
hombre(luis).
hombre(mario).
hombre(marco).
hombre(juan). ninio(juan).
hombre(pedro).
hombre(raul).
hombre(gabriel).
hombre(sergio).

:- discontiguous hombre/1.
madre(ana,sergio).
madre(ana,maria).
madre(ana,luis).
madre(martha,diana).
madre(olivia,raul).

padre(raul,rocio).
padre(marco,hugo).
padre(pedro,gabriel).
padre(sergio,paco).
padre(hugo,sergio).

% hijas
% abuelos

%listado de PADRES y MADRES de familia con sus hijos%
padres_familia(X,Y) :- padre(X,Y) ; madre(X,Y).

%listado de PADRES y MADRES de familia%
padres(X) :- padre(X,_) ; madre(X,_).

% listado PADRES
papas(X) :- padre(X,_).

% listado MADRES
mamas(X) :- madre(X,_).

%HIJOS
hijos(Y) :-  hombre(Y) , padres_familia(_,Y).
hijo(Y) :- (padre(_, Y) ; madre(_, Y) ), hombre(Y).

%HIJAS
hijas(Y) :-  mujer(Y) , padres_familia(_,Y).
hija(Y) :- (padre(_, Y) ; madre(_, Y) ), mujer(Y).

%ABUELOS
%abuelo(Z, Y) :- padre(Z, X) , (padre(X, Y) ; madre(X, Y)), hombre(Z).

%ABUELA
%abuela(X,Y) :- madre(X,Y) , (padre(X, Y) ; madre(X, Y)), mujer(_).

%ESPOSOS
esposo(Z, Y) :- padre(Z, X) , madre(Y, X).


%Agregar una regla para identificar a los ABUELOS.
abuelo(Z) :- padre(Z, X) , (padre(X, Y) ; madre(X, Y)), hombre(Z).

%Agregar una regla para identificar a las ABUELAS. 
abuela(Z) :- madre(Z, X) , (padre(X, Y) ; madre(X, Y)), mujer(Z).

%Agregar una regla para identificar a una PERSONA. 
persona(P) :- hombre(P) ; mujer(P).

%Agregar una regla para identificar a un NIETO
nieto(Y) :- padre(Z, X) , (padre(X, Y) ; madre(X, Y)), hombre(Y).

%Agregar una regla para identificar a un NIETA
nieta(Y) :- madre(Z, X) , (padre(X, Y) ; madre(X, Y)), mujer(Y).

%Agregar una regla para identificar a los HERMANOS
hermanos(X,Y) :- ((madre(Z,X) , madre(Z,Y)); (padre(Z,X) , padre(Z,Y))), not(X==Y) , hombre(X), hombre(Y).

%Agregar una regla para identificar a las HERMANAS
hermanas(X,Y) :- ((madre(Z,X) , madre(Z,Y)); (padre(Z,X) , padre(Z,Y))), not(X==Y) , mujer(X), mujer(Y).

%Agregar una regla para identificar a las PAREJAS.
parejas(Z, Y) :- padre(Z, X) , madre(Y, X).


%Agregar una CONSULTA para probar cada una una de las reglas anteriores. (Agregarlo como comentario para poder verificarlas después).
%abuelo(ABUELO).
%abuelo(sergio).
%abuela(ABUELA).
%abuela(ana).
%persona(PERSONA).
%persona(ana).
%nieto(NIETO).
%nieto(paco).
%nieta(NIETA).
%hermanos(H1,H2).
%hermanos(luis,sergio).
%hermanas(H1,H2).
%hermanas(maria,ana).
%parejas(ESPOSO,ESPOSA).


