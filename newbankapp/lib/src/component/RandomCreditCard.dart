import 'dart:math';


class RandomCreditCard {
  Random rng = Random(0);
  
  List<String> cardNumbers = [];
  List<String> accountNumbers = [];
  String bankBranchNumber = "9999-9";
  
  String getCardNumber() {
    String texto = "";
    
    for (int j = 0; j < 4; j++) {
      texto += rng.nextInt(10).toString();
    }
    
    for (int i = 0; i < 3; i++) {
      texto += " ";
      
      for (int j = 0; j < 4; j++) {
        texto += rng.nextInt(10).toString();
      }
    }
    
    // Check uniqueness
    if (cardNumbers.contains(texto)) {
      texto = getCardNumber();
    }
    else {
      cardNumbers.add(texto);
    }
    return texto;
  }
  
  String getAccountNumber() {
    String texto = "";
    
    for (int j = 0; j < 9; j++) {
      texto += rng.nextInt(10).toString();
    }
    texto += "-9";
    
    // Check uniqueness
    if (accountNumbers.contains(texto)) {
      texto = getAccountNumber();
    }
    else {
      accountNumbers.add(texto);
    }
    return texto;
  }
    
  String getCVV() {
    String texto = "";
    
    for (int j = 0; j < 3; j++) {
      texto += rng.nextInt(10).toString();
    }
    
    return texto;
  }
  
  String getExpiryDate() {
    DateTime today = DateTime.now();

    int month = rng.nextInt(12) + 1;
    int year = rng.nextInt(10) + today.year + 1;

    // expiryDate on format "MM/YY"
    String expiryDate = '${month.toString().padLeft(2, '0')}/${year.toString().substring(2)}';

    return expiryDate;
  }

  Map<String, dynamic> getCreditCard() {
    Map<String, dynamic> card = {
      "cardNumber": getCardNumber(),
      "accNumber": getAccountNumber(),
      "expiryDate" : getExpiryDate(),
      "bankBranch" : bankBranchNumber,
      "CVV" : getCVV(),
    };

    return card;
  }
}