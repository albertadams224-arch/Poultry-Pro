enum ProductionType { egg, feed, vaccines, mortality }

extension ProductionTypeLabel on ProductionType {
  String get label {
    switch (this) {
      case ProductionType.egg:
        return 'Egg';
      case ProductionType.feed:
        return 'Feed';
      case ProductionType.vaccines:
        return 'Vaccines';
      case ProductionType.mortality:
        return 'Mortality';
    }
  }
}
