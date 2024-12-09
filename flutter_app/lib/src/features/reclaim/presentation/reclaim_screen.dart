import 'package:flutter/material.dart';
import 'package:reclaim_sdk/reclaim.dart';
import 'package:reclaim_sdk/utils/types.dart';
import 'package:url_launcher/url_launcher.dart';

class ReclaimExample extends StatefulWidget {
  @override
  _ReclaimExampleState createState() => _ReclaimExampleState();
}

class _ReclaimExampleState extends State<ReclaimExample> {
  String _status = '';
  String _proofData = '';

  Future<void> _startVerificationSession(ReclaimProofRequest request) async {
    await request.startSession(
      onSuccess: _handleProofSuccess,
      onError: _handleProofError,
    );
  }

  void _handleProofSuccess(dynamic proof) {
    print('Proof received: $proof');
    // check if proof is of type String
    var proofDataValue = '';
    if (proof is String) {
      // For custom callback URL, the proof is a just a string message suggesting the proof is successfully sent and the user should check their backend for the proof
      proofDataValue = proof;
    } else {
      proofDataValue =
          'Extracted data: ${proof.claimData.context}\n\nFull proof: ${proof.toString()}';
    }
    setState(() {
      _status = 'Proof received!';
      _proofData = proofDataValue;
    });
  }

  void _handleProofError(Exception error) {
    _handleError('Error in proof generation', error);
  }

  void _handleError(String message, dynamic error) {
    print('$message: $error');
    setState(() => _status = '$message: ${error.toString()}');
  }

  Future<ReclaimProofRequest> _initializeProofRequest() async {
    final reclaimProofRequest = await ReclaimProofRequest.init(
      "",
      "",
      "",
      ProofRequestOptions(
        log: true,
        useAppClip: true,
      ),
    );
    return reclaimProofRequest;
  }

  Future<String> _generateRequestUrl(ReclaimProofRequest request) async {
    final requestUrl = await request.getRequestUrl();
    print('Request URL: $requestUrl');
    return requestUrl;
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      final launched = await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
      if (launched) {
        setState(() => _status = 'Session started. Waiting for proof...');
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  Future<void> startReclaimSession() async {
    try {
      print('Starting Reclaim session');
      final reclaimProofRequest = await _initializeProofRequest();
      final requestUrl = await _generateRequestUrl(reclaimProofRequest);
      await _launchUrl(requestUrl);
      await _startVerificationSession(reclaimProofRequest);
    } catch (error) {
      _handleError('Error starting Reclaim session', error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reclaim SDK Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: startReclaimSession,
              child: const Text('Start Reclaim Session'),
            ),
            const SizedBox(height: 20),
            Text(_status, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            if (_proofData.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                  child: Text(_proofData),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
