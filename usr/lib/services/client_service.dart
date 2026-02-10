import 'package:flutter/material.dart';
import '../models/client_model.dart';
import 'package:uuid/uuid.dart';

class ClientService extends ChangeNotifier {
  static final ClientService _instance = ClientService._internal();
  factory ClientService() => _instance;
  ClientService._internal();

  final List<Client> _clients = [];
  final _uuid = const Uuid();

  List<Client> get clients => List.unmodifiable(_clients);

  List<Client> get pendingClients => _clients
      .where((c) => c.status == ClientStatus.pendingBackoffice)
      .toList();

  List<Client> get inProgressClients => _clients
      .where((c) => c.status == ClientStatus.inProgress)
      .toList();
      
  List<Client> get activeClients => _clients
      .where((c) => c.status == ClientStatus.active)
      .toList();

  // Create a new draft client
  Client createNewClient() {
    final newClient = Client(id: _uuid.v4());
    _clients.add(newClient);
    notifyListeners();
    return newClient;
  }

  void updateClient(Client client) {
    final index = _clients.indexWhere((c) => c.id == client.id);
    if (index != -1) {
      _clients[index] = client;
      notifyListeners();
    }
  }

  void submitApplication(String clientId) {
    final index = _clients.indexWhere((c) => c.id == clientId);
    if (index != -1) {
      _clients[index].status = ClientStatus.pendingBackoffice;
      notifyListeners();
    }
  }

  void assignDevice(String clientId, String device, String phone) {
    final index = _clients.indexWhere((c) => c.id == clientId);
    if (index != -1) {
      _clients[index].assignedDeviceModel = device;
      _clients[index].assignedPhoneNumber = phone;
      _clients[index].assignmentDate = DateTime.now();
      _clients[index].status = ClientStatus.inProgress;
      notifyListeners();
    }
  }

  void updatePlatformStatus(String clientId, String platformName, bool isRegistered) {
    final index = _clients.indexWhere((c) => c.id == clientId);
    if (index != -1) {
      _clients[index].platformRegistrations[platformName] = isRegistered;
      notifyListeners();
    }
  }

  void finalizeClient(String clientId) {
    final index = _clients.indexWhere((c) => c.id == clientId);
    if (index != -1) {
      _clients[index].status = ClientStatus.active;
      notifyListeners();
    }
  }
}
