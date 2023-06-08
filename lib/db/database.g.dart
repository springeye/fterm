// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  SSHConfigDao? _configDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `SSHConfig` (`id` TEXT NOT NULL, `title` TEXT NOT NULL, `host` TEXT NOT NULL, `port` INTEGER NOT NULL, `username` TEXT NOT NULL, `password` TEXT, `privateKey` TEXT, `passphrase` TEXT, `authType` INTEGER NOT NULL, `jump_server` TEXT, FOREIGN KEY (`jump_server`) REFERENCES `SSHConfig` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  SSHConfigDao get configDao {
    return _configDaoInstance ??= _$SSHConfigDao(database, changeListener);
  }
}

class _$SSHConfigDao extends SSHConfigDao {
  _$SSHConfigDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _sSHConfigInsertionAdapter = InsertionAdapter(
            database,
            'SSHConfig',
            (SSHConfig item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'host': item.host,
                  'port': item.port,
                  'username': item.username,
                  'password': item.password,
                  'privateKey': item.privateKey,
                  'passphrase': item.passphrase,
                  'authType': item.authType.index,
                  'jump_server': item.jumpServer
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SSHConfig> _sSHConfigInsertionAdapter;

  @override
  Future<List<SSHConfig>> findAllSSHConfig() async {
    return _queryAdapter.queryList('SELECT * FROM SSHConfig',
        mapper: (Map<String, Object?> row) => SSHConfig(
            id: row['id'] as String,
            title: row['title'] as String,
            host: row['host'] as String,
            port: row['port'] as int,
            username: row['username'] as String,
            password: row['password'] as String?,
            privateKey: row['privateKey'] as String?,
            passphrase: row['passphrase'] as String?,
            authType: AuthType.values[row['authType'] as int],
            jumpServer: row['jump_server'] as String?));
  }

  @override
  Future<SSHConfig?> findSSHConfigById(String id) async {
    return _queryAdapter.query('SELECT * FROM SSHConfig WHERE id = ?1',
        mapper: (Map<String, Object?> row) => SSHConfig(
            id: row['id'] as String,
            title: row['title'] as String,
            host: row['host'] as String,
            port: row['port'] as int,
            username: row['username'] as String,
            password: row['password'] as String?,
            privateKey: row['privateKey'] as String?,
            passphrase: row['passphrase'] as String?,
            authType: AuthType.values[row['authType'] as int],
            jumpServer: row['jump_server'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> addSSHConfig(SSHConfig config) async {
    await _sSHConfigInsertionAdapter.insert(config, OnConflictStrategy.replace);
  }
}
