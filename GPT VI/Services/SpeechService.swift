//
//  SpeechService.swift
//  GPT VI
//
//  Created by Ethan McRae on 7/15/23.
//

import Foundation
import Speech

class SpeechService: NSObject, ObservableObject, SFSpeechRecognizerDelegate {
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en_US"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    @Published var transcribedText = ""
    @Published var isRecording = false
    @Published var isSpeechRecognitionAvailable = false
    
    override init() {
        super.init()
        self.speechRecognizer?.delegate = self
        SFSpeechRecognizer.requestAuthorization { [weak self] authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    self?.isSpeechRecognitionAvailable = true
                case .denied, .restricted, .notDetermined:
                    self?.isSpeechRecognitionAvailable = false
                @unknown default:
                    self?.isSpeechRecognitionAvailable = false
                    print("Unknown authorization state for speech recognition")
                }
            }
        }
    }
    
    func startRecording() {
        recognitionTask?.cancel()
        self.recognitionTask = nil
        
        let audioSession = AVAudioSession.sharedInstance()
        try? audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
        try? audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        let inputNode = audioEngine.inputNode
        
        guard let recognitionRequest = recognitionRequest else { fatalError("Unable to create a SFSpeechAudioBufferRecognitionRequest object") }
        
        recognitionRequest.shouldReportPartialResults = true
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) { result, error in
            if let result = result {
                self.transcribedText = result.bestTranscription.formattedString
                if result.isFinal || self.transcribedText.hasSuffix("iPhone out") {
                    self.transcribedText = self.transcribedText.replacingOccurrences(of: "iPhone out", with: "")
                    self.stopRecording()
                }
            } else if let error = error {
                print(error)
                self.stopRecording()
            }
        }
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, _: AVAudioTime) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        
        try? audioEngine.start()
        
        isRecording = true
        transcribedText = ""
    }
    
    func stopRecording() {
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        recognitionRequest?.endAudio()
        recognitionTask?.cancel()
        
        isRecording = false
    }
}

extension SpeechService {
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        OperationQueue.main.addOperation {
            self.isSpeechRecognitionAvailable = available
        }
    }
}
