# mimi-brute
### Platformička pro testování úkolů na PRG

## co to umi?
### * otestovat tvoje reseni uloh z PRG pomoci verejnych zadani (ze zipu z coursewaru)
### * vyhodnotit memory leaky/segfaulty pomoci valgrinda
### * zobrazit vstupni a vystupni hodnoty pro reseni neodpovidajici referenci
### * zobrazit exit kody

note: pro zobrazeni outputu je potreba mit nainstalovany vim, pro valgrind je potreba mit valgrind, ale vysledky to bude srovnavat i bez nich

## obsluha je typu easy
### 1) naklonuj si: `git clone https://github.com/matiamic/mimi-brute`

### 2) nahrej do odpovidajici slozky svuj zdrojak (jeden/vice souboru, je to fuk), muzes to v tech slozkach klidne i programovat (mozna idealni reseni)

### 3) zkompiluj pomoci `make` a otestuj pomoci `make test`, pripadne `make testo` pro volitelne zadani 

note2: uloha 06 ma jeste moznost `make testf`, ktera spusti testovaci skript prilozeny v balicku z coursewaru  
uloha 07 ma navic moznosti `make test-int`, `make test-str` a `make test-stc`, ktere testuji link list pro odpovidajici format dat

note3: pro nevimaře: pro zavreni vsech oken vimu zmackni `esc` (pro jistotu, kdybys byl v jinem nez normalnim modu) a potom napis `:qa!` ((vykricnik, je potreba jenom, pokud jsi neco v souborech editoval)), mezi okny se prepina stisknutim `ctrl + W` a pak sipky smerem k oknu, do ktereho chces prepnout

### kdyby cokoliv, nevahej mi napsat na matiamic@fel.cvut.cz

### ukazka vystupu reseni volitelneho zadani ulohy 4:  
![Screen Shot 2021-03-12 at 14 48 33](https://user-images.githubusercontent.com/62507257/110949275-b30d3700-8342-11eb-85c8-18aa0a01ec76.png)
