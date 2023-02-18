class DBException implements Exception {
  DBException();

  @override
  String toString() {
    return 'DB_Exception';
  }
}

class DTOConvException extends DBException {
  final String dto;
  final String field;

  DTOConvException(this.dto, this.field);

  @override
  String toString() {
    return '${super.toString()}: DTO_Conversion: Map is missing field "$field" '
        'when converting into DTO "$dto".';
  }
}

class InsertionException extends DBException {
  final String table;
  final String dto;
  final String cause;

  InsertionException(this.table, this.dto, this.cause);

  @override
  String toString() {
    return '${super.toString()}: Insertion: Failed at table "$table", with DTO '
        '"$dto". Cause: "$cause".';
  }
}

class QueryException extends DBException {
  final String table;
  final String cause;

  QueryException(this.table, this.cause);

  @override
  String toString() {
    return '${super.toString()}: Query: Failed at table "$table". Cause: '
        '"$cause".';
  }
}

class UnknownException extends DBException {
  final String table;
  final String dto;
  final String cause;

  UnknownException(this.table, this.dto, this.cause);

  @override
  String toString() {
    return '${super.toString()}: Unknown: Failed at table "$table", with DTO '
        '"$dto". Cause: "$cause".';
  }
}
