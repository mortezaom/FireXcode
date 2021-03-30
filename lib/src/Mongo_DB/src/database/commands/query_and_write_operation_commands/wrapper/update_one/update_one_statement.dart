import 'package:firexcode/src/Mongo_DB/mongo_dart.dart';
import 'package:firexcode/src/Mongo_DB/src/database/commands/query_and_write_operation_commands/update_operation/update_statement.dart';
import 'package:firexcode/src/Mongo_DB/src/database/commands/parameters/collation_options.dart';
import 'package:firexcode/src/Mongo_DB/src/database/utils/update_document_check.dart';

class UpdateOneStatement extends UpdateStatement {
  UpdateOneStatement(Map<String, Object> q, Object u,
      {bool upsert,
      CollationOptions collation,
      List<dynamic> arrayFilters,
      String hint,
      Map<String, Object> hintDocument})
      : super(q, u,
            upsert: upsert,
            multi: false,
            collation: collation,
            arrayFilters: arrayFilters,
            hint: hint,
            hintDocument: hintDocument) {
    if (!containsOnlyUpdateOperators(u)) {
      throw MongoDartError('Invalid document in UpdateOneStatement. '
          'The document is either null or contains invalid update operators');
    }
  }
}
