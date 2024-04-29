import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String id;
  final String title;
  final String body;
  final DateTime timestamp;
  bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.timestamp,
    this.isRead = false,
  });

  // Convert a NotificationModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'timestamp': timestamp,
      'isRead': isRead,
    };
  }

  // Convert a Map to a NotificationModel
  static NotificationModel fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      isRead: map['isRead'],
    );
  }
}