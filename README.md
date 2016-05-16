# Übung 4: Integer, Schleifen und Sprünge

1. Schreiben Sie ein 32 Bit Assemblerprogramm, welches die Fakultät der Zahl `n` berechnet. `n` sei als 32 Bit Variable `n` gegeben und das Ergebnis soll in der 32 Bit Variable `ergebnis` gespeichert werden. Ein Überlauf der verfügbaren 32 Bit der Ergebnisvariable muss nicht abgefangen werden.

2. Die Fibonaccizahlen `F(n)` sind als Reihe mit `F(n) = F(n−1) + F(n−2)` definiert, dabei gilt `F(0) = 0` und `F(1) = 1`. Schreiben Sie ein 32 Bit Assemblerprogramm, welches die *n*-te Fibonacci-Zahl berechnet, wobei `n` in einer 32 Bit Variable `n` gegeben sei und das Ergebnis in der 64 Bit Variable `ergebnis` gespeichert wird. Offensichtlich wachsen solche Zahlen unbeschränkt, daher soll, um auch große Fibonacci-Zahlen berechnen zu können, das zu entwickelnde Programm 64 Bit breite Fibonacci-Zahlen berechnen. Das zu entwickelnde Programm soll dabei jedoch ein 32 Bit Programm sein und die entsprechenden 32 Bit Register nutzen und **kein** 64 Bit Programm mit 64 Bit breiten Registern! Somit passen die zu berechnenden 64 Bit breiten Ganzzahlen nicht in ein einzelnes Register, so dass hier eine besondere Vorgehensweise bei der Berechnung notwendig ist. Falls ein Überlauf der verfügbaren 64 Bit auftritt, soll die Berechnung abgebrochen und das Ergebnis auf 0 gesetzt werden.

3. Schreiben Sie den entsprechenden 32 Bit Assemblercode zu den nachfolgend angegebenen C-Codefragmenten. Der Datentyp `int` sei hier 4 Bytes breit.

**Fragment 1**:

	int a = 0;
	int b = 7;
	
	if (a++ == 0) {
		b = 1;
	} else {
		b = 0;
	}
	
**Fragment 2**:
	
	int a[10];
	for (int i = 0; i < 10; i++) {
		a[i] = i;
	}
	
**Fragment 3**:

	int i = 10;
	int ergebnis = 1;
	
	while (--i) {
		ergebnis *= i;
	}
	
**Zusatzaufgabe:** Anhand eines 32 Bit Assemblerprogramms soll geprüft werden, ob eine gegebene 32 Bit Zahl `testvalue` eine Fibonacci-Zahl `F(n)` ist. Ist dies der Fall, so soll die Variable `ergebnis` den entsprechenden Index `n` der Fibonacci-Zahl enthalten, ansonsten 0. 
