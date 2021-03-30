import 'package:bson/bson.dart';
import 'package:firexcode/src/Mongo_DB/mongo_dart.dart'
    show BsonBinary, MongoDartError, MongoMessage;

class MongoResponseMessage extends MongoMessage {
  MongoMessage deserialize(BsonBinary buffer) {
    throw MongoDartError('Must be implemented');
  }

  static int extractOpcode(BsonBinary buffer) {
    buffer.readInt32();
    buffer.readInt32();
    buffer.readInt32();
    var opcodeFromWire = buffer.readInt32();
    buffer.offset -= 16;
    return opcodeFromWire;
  }
}
