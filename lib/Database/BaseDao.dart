import 'package:blue_love_app/Database/DatabaseContex.dart';
import 'package:blue_love_app/Models/BaseModel.dart';
import 'package:sembast/sembast.dart';

abstract class BaseDao<TEntity extends BaseModel> {
  final String name;
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are tEntity objects converted to Map
  late StoreRef<int, Map<String, Object?>> _store;

  BaseDao(this.name) {
    _store = intMapStoreFactory.store(name);
  }

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await DatabaseContext().database;

  Future insert(TEntity tEntity) async {
    await _store.add(await _db, tEntity.toMap());
  }

  Future update(TEntity tEntity) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(tEntity.id));
    await _store.update(
      await _db,
      tEntity.toMap(),
      finder: finder,
    );
  }

  Future delete(TEntity tEntity) async {
    final finder = Finder(filter: Filter.byKey(tEntity.id));
    await _store.delete(
      await _db,
      finder: finder,
    );
  }

  Future<TEntity> get({Finder? finder}) async {
    // Finder object can also sort data.
    final recordSnapshots = await _store.findFirst(
      await _db,
      finder: finder ?? Finder(),
    );

    // Making a TEntity out of RecordSnapshot

    final tEntity =
        BaseModel.getType<TEntity>()!.fromMap(recordSnapshots!.value);
    // An ID is a key of a record from the database.
    tEntity.id = recordSnapshots.key;
    return tEntity as TEntity;
  }

  Future<List<TEntity>> getAll({Finder? finder}) async {
    // Finder object can also sort data.

    final recordSnapshots = await _store.find(
      await _db,
      finder: finder ?? Finder(),
    );

    // Making a List<TEntity> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final tEntity = BaseModel.getType<TEntity>()!.fromMap(snapshot.value);
      // An ID is a key of a record from the database.

      return tEntity as TEntity;
    }).toList();
  }
}
