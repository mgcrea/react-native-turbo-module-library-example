// NativeLocalStorage.swift

import Foundation

@objc(NativeLocalStorage)
public class NativeLocalStorage: NSObject {
  private let localStorage: UserDefaults

  override public init() {
    localStorage = UserDefaults(suiteName: "local-storage") ?? UserDefaults.standard
    super.init()
  }

  @objc
  public func setItem(_ value: String, key: String) {
    localStorage.set(value, forKey: key)
  }

  @objc
  public func getItem(_ key: String) -> String? {
    return localStorage.string(forKey: key)
  }

  @objc
  public func removeItem(_ key: String) {
    localStorage.removeObject(forKey: key)
  }

  @objc
  public func clear() {
    localStorage.dictionaryRepresentation().keys.forEach { localStorage.removeObject(forKey: $0) }
  }
}
