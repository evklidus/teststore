String refactorPrice({required int price, required bool withComma, required bool withZeros}) {
  List<String> newPrise = price.toString().split('');
  if (newPrise.length == 4) {
    if (withComma) {
    newPrise.insert(1, ',');
    }
  }
  // if (newPrise.length == 5) {
  //   if (withComma) {
  //   newPrise.insert(4, ',');
  //   }
  // }
  // if (newPrise.length == 6) {
  //   if (withComma) {
  //   newPrise.insert(3, ',');
  //   }
  // }
  newPrise.insert(0, '\$');
  if (withZeros) {
    newPrise.add('.00');
  }
  return newPrise.join();
}