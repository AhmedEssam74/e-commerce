extension CapitalizeFirst on String {
  String capitalizeFirst() {
    return split(' ') 
        .map((word) => word.isEmpty
            ? word
            : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}')
        .join(' '); 
  }
}
