import Foundation

/// A review.
public struct Review: Identifiable, Decodable, Equatable, Hashable {

    /// Review identifier.
    public let id: String
    /// Author of the review.
    public let author: String
    /// Review content.
    public let content: String
    /// Review date of creation.
    public var createdDate: Date? {
      guard let createdAt else {
        return nil
      }
      return DateFormatter.theMovieDatabaseISO8601.date(from: createdAt)
    }

    private let createdAt: String?

    /// Creates a new `Review`.
    ///
    /// - Parameters:
    ///    - id: Review identifier.
    ///    - author: Author of the review.
    ///    - content: Review content.
    ///    - createdAt: Review date of creation.
    public init(id: String, author: String, content: String, createdAt: Date?) {
        self.id = id
        self.author = author
        self.content = content
        self.createdAt = {
          guard let createdAt else { return nil }
          return DateFormatter.theMovieDatabaseISO8601.string(from: createdAt)
        }()
    }

}
