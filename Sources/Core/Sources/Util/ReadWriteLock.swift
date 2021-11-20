import Darwin

/// A wrapper around the rwlock C api (`pthread_rwlock_t`).
public class ReadWriteLock {
  private var lock = pthread_rwlock_t()
  
  public init() {
    pthread_rwlock_init(&lock, nil)
  }
  
  deinit {
    pthread_rwlock_destroy(&lock)
  }
  
  /// Acquire the lock for reading.
  public func acquireReadLock() {
    pthread_rwlock_rdlock(&lock)
  }
  
  /// Acquire the lock for writing.
  public func acquireWriteLock() {
    pthread_rwlock_wrlock(&lock)
  }
  
  /// Unlock the lock.
  public func unlock() {
    pthread_rwlock_unlock(&lock)
  }
}