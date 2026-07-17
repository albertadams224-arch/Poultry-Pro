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

extension ProductionTypeSecondaryLabel on ProductionType {
  String get secondaryLabel {
    switch (this) {
      case ProductionType.egg:
        return 'broken';
      case ProductionType.feed:
        return 'kg remaining';
      case ProductionType.vaccines:
        return 'wasted';
      case ProductionType.mortality:
        return 'missing';
    }
  }
}
