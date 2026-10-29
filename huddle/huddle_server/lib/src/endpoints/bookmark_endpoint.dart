import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class BookmarkEndpoint extends Endpoint {
  static final List<Bookmark> _bookmarks = [
    Bookmark(
      id: 1,
      studentId: 1,
      itemType: 'event',
      itemId: 1,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Bookmark(
      id: 2,
      studentId: 1,
      itemType: 'community',
      itemId: 2,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  Future<bool> toggleBookmark(
    Session session,
    int studentId,
    String itemType,
    int itemId,
  ) async {
    final idx = _bookmarks.indexWhere(
      (b) => b.studentId == studentId && b.itemType == itemType && b.itemId == itemId,
    );

    if (idx >= 0) {
      _bookmarks.removeAt(idx);
      return false; // unbookmarked
    } else {
      _bookmarks.add(
        Bookmark(
          id: _bookmarks.length + 1,
          studentId: studentId,
          itemType: itemType,
          itemId: itemId,
          createdAt: DateTime.now(),
        ),
      );
      return true; // bookmarked
    }
  }

  Future<bool> isBookmarked(
    Session session,
    int studentId,
    String itemType,
    int itemId,
  ) async {
    return _bookmarks.any(
      (b) => b.studentId == studentId && b.itemType == itemType && b.itemId == itemId,
    );
  }

  Future<List<Bookmark>> getBookmarks(
    Session session,
    int studentId, {
    String? itemType,
  }) async {
    return _bookmarks.where((b) {
      if (b.studentId != studentId) return false;
      if (itemType != null && itemType.isNotEmpty && b.itemType != itemType) {
        return false;
      }
      return true;
    }).toList();
  }
}
