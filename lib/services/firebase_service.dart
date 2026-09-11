import 'package:cloud_firestore/cloud_firestore.dart';
import 'backend_service.dart';

class FirebaseService implements BackendService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> joinVirtualQueue(String routeId, String userId) async {
    // Scaffolded for actual implementation
    await _firestore.collection('queues').doc(routeId).collection('passengers').doc(userId).set({
      'joinedAt': FieldValue.serverTimestamp(),
      'status': 'waiting',
    });
  }

  @override
  Future<void> triggerSOS(String userId, double lat, double lng) async {
    await _firestore.collection('sos_alerts').add({
      'userId': userId,
      'location': GeoPoint(lat, lng),
      'timestamp': FieldValue.serverTimestamp(),
      'status': 'active',
    });
  }
}
