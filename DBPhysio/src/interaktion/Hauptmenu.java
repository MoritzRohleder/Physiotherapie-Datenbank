package interaktion;
import java.util.Scanner;
public class Hauptmenu {
	private static final String[] tabellen={"patient","kursteilnahme","kurs","mitarbeiter","qualifikation", "qualifiziert"};
	private static final int[] stellen = {13,3,5,5,3,2};
	private static int wahl;
	public static Scanner sc = new Scanner(System.in);
	public static void main(String[] args) {

		do
		{
			menue();
			wahl = sc.nextInt();
			switch (wahl){
				case 1: // Anzeigen
					System.out.println(dbverbindung.DBManager.showTable(tabellen[tabellenauswahlmenue()]));
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
	
	public static int tabellenauswahlmenue() {
		System.out.printf("(1) %s\n", tabellen[0]);
		System.out.printf("(2) %s\n", tabellen[1]);
		System.out.printf("(3) %s\n", tabellen[2]);
		System.out.printf("(4) %s\n", tabellen[3]);
		System.out.printf("(5) %s\n", tabellen[4]);
		System.out.println("(6) Ende");
		return sc.nextInt() - 1;
		/*switch(wahl){
			case 0: // Tabelle 1
				break;
			case 1: // Tabelle 2
				break;
			case 2: // Tabelle 3
				break;
			case 3: // Tabelle 4
				break;
			case 4: // Tabelle 5
				break;
			default:
				break;
		}*/
	}
}
