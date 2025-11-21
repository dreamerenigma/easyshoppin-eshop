class AddressData {
  final String city;
  final String street;
  final String building;
  final double rating;
  final bool isFavorite;
  final String deliveryType;
  final bool freeDelivery;

  AddressData({
    required this.city,
    required this.street,
    required this.building,
    required this.rating,
    this.isFavorite = false,
    required this.deliveryType,
    this.freeDelivery = true,
  });
}

final List<AddressData> testAddresses = List.generate(20, (index) => AddressData(
  city: 'Москва',
  street: 'Улица Примерная',
  building: 'Дом ${index + 1}${index % 2 == 0 ? "к1" : ""}',
  rating: (3 + (index % 3)).toDouble(),
  isFavorite: index % 5 == 0,
  deliveryType: 'Пункт выдачи',
  freeDelivery: true,
));
