abstract class BackendService {
  Future<void> joinVirtualQueue(String routeId, String userId);
  Future<void> triggerSOS(String userId, double lat, double lng);
  // Implementation will use Firebase or Supabase based on selection
}
