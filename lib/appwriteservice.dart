import 'package:appwrite/appwrite.dart';

class AppwriteService {
  late Client _client;
  late Databases _database;
  final String databaseId = '67492e9900122c7db635'; // Your database ID
  final String textCollectionId = '674a842d00228d905bd7'; // Text collection ID
  final String tasksCollectionId =
      '674a8574000554189fcb'; // Tasks collection ID
  final String listsCollectionId =
      '674a84c60023f8f1fabe'; // Lists collection ID

  AppwriteService() {
    _client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1') // Appwrite endpoint
        .setProject('67492d9d00384f3f9b7b'); // Your project ID

    _database = Databases(_client);
  }

  /// Fetch all notes
  Future<List<Map<String, dynamic>>> fetchNotes() async {
    try {
      final documents = await _database.listDocuments(
        databaseId: databaseId,
        collectionId: textCollectionId,
      );
      return documents.documents.map((doc) => doc.data).toList();
    } catch (e) {
      print('Error fetching notes: $e');
      throw Exception('Error fetching notes');
    }
  }

  /// Fetch all tasks
  Future<List<Map<String, dynamic>>> fetchTasks() async {
    try {
      final documents = await _database.listDocuments(
        databaseId: databaseId,
        collectionId: tasksCollectionId,
      );
      return documents.documents.map((doc) => doc.data).toList();
    } catch (e) {
      print('Error fetching tasks: $e');
      throw Exception('Error fetching tasks');
    }
  }

  /// Fetch all lists
  Future<List<Map<String, dynamic>>> fetchLists() async {
    try {
      final documents = await _database.listDocuments(
        databaseId: databaseId,
        collectionId: listsCollectionId,
      );
      return documents.documents.map((doc) => doc.data).toList();
    } catch (e) {
      print('Error fetching lists: $e');
      throw Exception('Error fetching lists');
    }
  }

  /// Create a new note
  Future<void> createNote(String title, String content) async {
    try {
      await _database.createDocument(
        databaseId: databaseId,
        collectionId: textCollectionId,
        documentId: 'unique()', // Auto-generate a unique ID
        data: {
          'title': title,
          'content': content,
          'created_at': DateTime.now().toIso8601String(), // Add a timestamp
        },
      );
    } catch (e) {
      print('Error creating note: $e');
      throw Exception('Error creating note');
    }
  }

  /// Create a new task
  Future<void> createTask(String task) async {
    try {
      await _database.createDocument(
        databaseId: databaseId,
        collectionId: tasksCollectionId,
        documentId: 'unique()',
        data: {
          'task': task,
          'isCompleted': false, // Default to false for new tasks
          'created_at': DateTime.now().toIso8601String(), // Add timestamp
        },
      );
    } catch (e) {
      print('Error creating task: $e');
      throw Exception('Error creating task');
    }
  }

  /// Create a new list
  Future<void> createList(String title, List<String> items) async {
    try {
      await _database.createDocument(
        databaseId: databaseId,
        collectionId: listsCollectionId,
        documentId: 'unique()',
        data: {
          'title': title,
          'items': items,
          'created_at': DateTime.now().toIso8601String(), // Add timestamp
        },
      );
    } catch (e) {
      print('Error creating list: $e');
      throw Exception('Error creating list');
    }
  }

  /// Delete a document
  Future<void> deleteDocument(String collectionId, String documentId) async {
    try {
      await _database.deleteDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: documentId,
      );
    } catch (e) {
      print('Error deleting document: $e');
      throw Exception('Error deleting document');
    }
  }
}
