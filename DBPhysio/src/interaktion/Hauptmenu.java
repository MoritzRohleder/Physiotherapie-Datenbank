package interaktion;
import java.util.Scanner;
public class Hauptmenu {
	private String[] tabellenNamen;
	private static int wahl;
	public static Scanner sc = new Scanner(System.in);
	public static void main(String[] args) {

		do
		{
			menue();
			wahl = sc.nextInt();
			switch (wahl){
				case 1: // Anzeigen
					tabellenauswahlmenue();
					break;
				case 2: // Einfügen
					break;
				case 3: // Ändern
					break;
				case 4: // Löschen
					break;
				case 5: // Anzahl Tupel
					break;
				case 6: // Ende
					break;
				default:
					break;
			}
		}while (wahl!=6);

	}
	public static void menue()
	{
		System.out.println("(1) Anzeigen");
		System.out.println("(2) Einfuegen");
		System.out.println("(3) Aendern");
		System.out.println("(4) Loeschen");
		System.out.println("(5) Anzahl Tupel");
		System.out.println("(6) Ende");
	}
	public static void tabellenauswahlmenue()
	{

		System.out.println("(1) Tabelle1");
		System.out.println("(2) Tabelle2");
		System.out.println("(3) Tabelle3");
		System.out.println("(4) Tabelle4");
		System.out.println("(5) Tabelle5");
		System.out.println("(6) Ende");
		wahl = sc.nextInt();
		switch(wahl){
			case 1: // Tabelle 1
				break;
			case 2: // Tabelle 2
				break;
			case 3: // Tabelle 3
				break;
			case 4: // Tabelle 4
				break;
			case 5: // Tabelle 5
				break;
			default:
				break;
		}
	}
}
