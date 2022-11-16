class BookModel {
  static final bookdatas = [
    Item(
        bookname: "Une si longue lettre",
        bookauteur: "Mariama BA",
        bookcategory: "Roman",
        bookdescription: "Retrace la societe senegalaise"),
    Item(
        bookname: "Nation nègre",
        bookauteur: "Cheikh Anta",
        bookcategory: "Roman",
        bookdescription: "Retrace la societe africaine"),
    Item(
        bookname: "Père riche Père pauvre",
        bookauteur: "Robert",
        bookcategory: "Roman",
        bookdescription: "Parle d'etreprenariat"),
    Item(
        bookname: "Aventure Ambigue",
        bookauteur: "Cheikh Hamidou KANE",
        bookcategory: "Roman",
        bookdescription: "Retrace la societe senegalaise"),
    Item(
        bookname: "L'enfant Noir",
        bookauteur: "Camara Laye",
        bookcategory: "Roman",
        bookdescription: "Retrace la societe africaine"),
    Item(
        bookname: "Soudjata ",
        bookauteur: "Djibril Tamsir NIANE",
        bookcategory: "Roman",
        bookdescription: "Parle d'etreprenariat"),
    Item(
        bookname: "Maimouna",
        bookauteur: "abdoulaye SADJI",
        bookcategory: "Roman",
        bookdescription: "Retrace la societe senegalaise"),
    Item(
        bookname: "Sous l'orage ",
        bookauteur: "Seydou Bodian",
        bookcategory: "Roman",
        bookdescription: "Retrace la societe africaine"),
    Item(
        bookname: "Père riche Pere pauvre",
        bookauteur: "Robert",
        bookcategory: "Roman",
        bookdescription: "Parle d'etreprenariat"),
    Item(
        bookname: "Une si longue lettre",
        bookauteur: "Mariama BA",
        bookcategory: "Roman",
        bookdescription: "Retrace la societe senegalaise"),
    Item(
        bookname: "Nation nègre",
        bookauteur: "Cheikh Anta",
        bookcategory: "Roman",
        bookdescription: "Retrace la societe africaine"),
    Item(
        bookname: "Père riche Pere pauvre",
        bookauteur: "Robert",
        bookcategory: "Roman",
        bookdescription: "Parle d'etreprenariat")
  ];
}

class Item {
  final String bookname;
  final String bookauteur;
  final String bookcategory;
  final String bookdescription;

  Item(
      {required this.bookname,
      required this.bookauteur,
      required this.bookcategory,
      required this.bookdescription});
}
