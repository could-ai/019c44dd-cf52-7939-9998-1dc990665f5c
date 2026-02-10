import 'package:flutter/material.dart';

enum ClientStatus {
  draft,
  pendingBackoffice,
  inProgress,
  active,
  rejected,
}

class Client {
  final String id;
  ClientStatus status;
  
  // Step 1: ID Verification
  String? name;
  String? address;
  DateTime? dob;
  DateTime? idExpirationDate;
  String? idImagePath; // Mock path

  // Step 1: Gmail
  String? gmailAddress;
  String? gmailPassword;

  // Step 1: BetMGM
  bool betMgmRegistrationSuccess;
  String? mgmLoginScreenshotPath;
  String? mgmDepositScreenshotPath;

  // Step 2: Questionnaire
  String? bankDetails;
  String? paypalHistory;
  String? criminalRecord;
  String? ssn;
  String? riskInfo;
  Map<String, String> additionalAnswers;

  // Backoffice Assignment
  String? assignedDeviceModel;
  String? assignedPhoneNumber;
  DateTime? assignmentDate;

  // Finalization: 11 Platforms
  Map<String, bool> platformRegistrations;
  bool contractsSigned;

  Client({
    required this.id,
    this.status = ClientStatus.draft,
    this.name,
    this.address,
    this.dob,
    this.idExpirationDate,
    this.idImagePath,
    this.gmailAddress,
    this.gmailPassword,
    this.betMgmRegistrationSuccess = false,
    this.mgmLoginScreenshotPath,
    this.mgmDepositScreenshotPath,
    this.bankDetails,
    this.paypalHistory,
    this.criminalRecord,
    this.ssn,
    this.riskInfo,
    this.additionalAnswers = const {},
    this.assignedDeviceModel,
    this.assignedPhoneNumber,
    this.assignmentDate,
    this.platformRegistrations = const {
      'Platform 1': false,
      'Platform 2': false,
      'Platform 3': false,
      'Platform 4': false,
      'Platform 5': false,
      'Platform 6': false,
      'Platform 7': false,
      'Platform 8': false,
      'Platform 9': false,
      'Platform 10': false,
      'Platform 11': false,
    },
    this.contractsSigned = false,
  });
}
