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
    return '${super.toString()}: DTO_Conversion: Map is missing the field $field in order to convert it into DTO $dto.';
  }
}
