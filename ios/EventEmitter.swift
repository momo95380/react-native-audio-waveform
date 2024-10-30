class EventEmitter {

  /// Shared Instance.
  public static var sharedInstance = EventEmitter()

  // ReactNativeEventEmitter is instantiated by React Native with the bridge.
  private static var eventEmitter: AudioWaveformsEventEmitter!

  private init() {}

  // When React Native instantiates the emitter it is registered here.
  func registerEventEmitter(eventEmitter: AudioWaveformsEventEmitter) {
    EventEmitter.eventEmitter = eventEmitter
  }

  func dispatch(name: String, body: Any?) {
    // Check if the event is a gesture-related event and ignore it
    if name.lowercased().contains("gesture") || 
       name.lowercased().contains("swipe") || 
       name.lowercased().contains("tap") || 
       name.lowercased().contains("pinch") || 
       name.lowercased().contains("pan") || 
       name.lowercased().contains("rotate") || 
       name.lowercased().contains("press") {
      return
    }
    EventEmitter.eventEmitter.sendEvent(withName: name, body: body)
  }

  /// All Events which must be support by React Native.
  lazy var allEvents: [String] = {
    var allEventNames: [String] = ["onDidFinishPlayingAudio", "onCurrentDuration", "onCurrentExtractedWaveformData", "onCurrentRecordingWaveformData"]
    
    // Ensure gesture events are not included
    // Append all events here
    
    return allEventNames
  }()

}
