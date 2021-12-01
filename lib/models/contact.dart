class Contact {
  late final String name;
  late final int accountNumber;

  Contact(
      this.name,
      this.accountNumber,
      );

  @override
  String toString() {
    return 'Contact{name: $name, accountNumber: $accountNumber}';
  }
}