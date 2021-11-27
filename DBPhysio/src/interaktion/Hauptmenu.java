/**
 * Datenbanken 1 Projekt:
 * 
 * Topic: Physiotherapie
 * 
 * @author Moritz Rohleder
 * @author Leon Michael Barratt
 * @author Bastian Litzmann
 * @version 1
 */
package interaktion;
import java.util.Scanner;
import dbverbindung.DBManager;

public class Hauptmenu {

	private static final String[] tabellen={"patient","kursteilnahme","kurs","mitarbeiter","qualifikation", "qualifiziert"};
	private static final int[] stellen = {13,3,5,5,3,2};
	private static int wahl;
	public static Scanner sc = new Scanner(System.in);
	public static void main(String[] args) {
		do {
			System.out.println("(1) Anzeigen");
			System.out.println("(2) Einfuegen");
			System.out.println("(3) Aendern");
			System.out.println("(4) Loeschen");
			System.out.println("(5) Abfragen");
			System.out.println("(6) Ende");
			wahl = sc.nextInt();
			switch (wahl){
				case 1: //Tabelle anzeigen
					System.out.println(dbverbindung.DBManager.showTable(tabellen[tabellenauswahl()]));
					break;
				case 2: //Einfügen von einem Datensatz in eine Tabelle
					insert(tabellenauswahl());
					break;
				case 3: //Ändern eines oder mehrere Werte in einem oder mehrerer Datensätze einer Tabelle
					update(tabellenauswahl());
					break;
				case 4: //löschen eines datensatzes einer tabelle
					delete(tabellenauswahl());
					break;
				case 5: //spezielle vordefinierte abfragen
					abfragen();
					break;
				case 6: // Ende
					break;
				default:
					break;
			}
		}while (wahl!=6);
	}
	/**
	 * Made to reduce redundancy in code
	 * @return returns a number fitting the table choice given
	 */
	private static int tabellenauswahl() {
		System.out.printf("(1) %s\n", tabellen[0]);
		System.out.printf("(2) %s\n", tabellen[1]);
		System.out.printf("(3) %s\n", tabellen[2]);
		System.out.printf("(4) %s\n", tabellen[3]);
		System.out.printf("(5) %s\n", tabellen[4]);
		System.out.printf("(6) %s\n", tabellen[5]);
		return sc.nextInt() - 1;
	}
	/**
	 * This Method gives the DBManager Data for an insertion of a new row for the choosen table
	 * 
	 * @param table An integer giving the position of a table in the predefined array
	 */
	private static void insert(int table) {
		String[] eingabe = new String[stellen[table]];
		String eingaben;
		for(int i=0;i<stellen[table];i++){
			eingaben = sc.nextLine();
			eingabe[i] = eingaben;
		}
		DBManager.insert(tabellen[table], eingabe);
	}
	
	private static void update(int table) {
		
	}
	/**
	 * Metho
	 * @param table
	 */
	private static void delete(int table) {
		System.out.println(dbverbindung.DBManager.showTable(tabellen[table]));
		System.out.println("Wie viele Primärschlüssel gibt es: ");
		int wahl = sc.nextInt();
		String[] columns = new String[wahl];
		System.out.println("Die Column auswählen:");
		columns[0] = sc.nextLine();
		int[] primaryKeys = new int[wahl];
		for(int i=0;i<columns.length;i++){
			columns[i] = sc.nextLine();
		}
		System.out.println("Bitte wählen sie die Primärschlüssel aus:");
		for(int i=0;i<primaryKeys.length;i++){
			primaryKeys[i] = sc.nextInt();
		}
		DBManager.delete(tabellen[table], columns, primaryKeys);
	}
	/**
	 * Gives a return from the database regarding the choice selected
	 */
	private static void abfragen() {
		System.out.println("(1) Anzahl der Tupel pro Qualifikation");
		System.out.println("(2) Anzahl Teilnehmer pro Kurs");
		System.out.println("(3) Anzahl Teilnehmer eines bestimmten Kurses");
		System.out.println("(4) Liste aller Teilnehmer eines Kurses");
		System.out.println("(5) Anzahl der Mitarbeiter mit einer Qualifikation, pro Qualifikation");
		System.out.println("(6) Anzahl der Mitarbeiter mit einer bestimmten Qualifikation");
		System.out.println("(7) Liste der Mitarbeiter mit einer bestimmten Qualifikation");
		System.out.println("(8) Zurück");
		int auswahl = sc.nextInt();
		
		switch(auswahl) {
		case 1: //Anzahl der Tupel pro Qualifikation 
			System.out.println(dbverbindung.DBManager.getChildren());
			break;
		case 2: //Anzahl Teilnehmer pro Kurs 
			System.out.println(dbverbindung.DBManager.getParticipantCountAll());
			break;
		case 3: //Anzahl Teilnehmer eines Kurses 
			getParticipantCount();
			break;
		case 4: //Liste der Teilnehmer eines Kurses 
			getParticipants();
			break;
		case 5: //Anzahl Mitarbeiter pro Qaulifikation 
			System.out.println(dbverbindung.DBManager.getEmployeeCountAll());
			break;
		case 6: //Anzahl Mitarbeiter mit einer bestimmten Qualifikation
			getEmployeeCount();
			break;
		case 7: //Liste der Mitarbeiter mit einer bestimmten Qaulifikation 
			getEmployeeList();
			break;
		case 8: //Zurück
			break;
		default:
			break;
		}
	}

	private static void getParticipantCount() {
		//TODO
	}
	
	private static void getParticipants() {
		//TODO
	}
	
	private static void getEmployeeCount() {
		//TODO
	}
	
	private static void getEmployeeList() {
		//TODO
	}
}