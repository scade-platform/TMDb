import TMDb
import XCTest

final class ImagesConfigurationURLsTests: XCTestCase {

    var configuration: ImagesConfiguration!
    var emptyConfiguration: ImagesConfiguration!

    override func setUp() {
        super.setUp()
        configuration = ImagesConfiguration(
            baseURL: URL(string: "http://image.tmdb.org/t/p/")!,
            secureBaseURL: URL(string: "https://image.tmdb.org/t/p/")!,
            backdropSizes: ["w300", "w780", "w1280", "original"],
            logoSizes: ["w45", "w92", "w154", "w185", "w300", "w500", "original"],
            posterSizes: ["w92", "w154", "w185", "w342", "w500", "w780", "original"],
            profileSizes: ["w45", "w185", "h632", "original"],
            stillSizes: ["w92", "w185", "w300", "original"]
        )
        emptyConfiguration = ImagesConfiguration(
            baseURL: URL(string: "http://image.tmdb.org/t/p/")!,
            secureBaseURL: URL(string: "https://image.tmdb.org/t/p/")!,
            backdropSizes: [],
            logoSizes: [],
            posterSizes: [],
            profileSizes: [],
            stillSizes: []
        )
    }

    override func tearDown() {
        emptyConfiguration = nil
        configuration = nil
        super.tearDown()
    }

    func testBackdropURLWhenPathIsNilReturnsNil() {
        let result = configuration.backdropURL(for: nil, idealWidth: 0)

        XCTAssertNil(result)
    }

    func testBackdropURLWhenNoWidthIsGivenReturnsOriginalURL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/original/image.jpg")!

        let result = configuration.backdropURL(for: path)

        XCTAssertEqual(result, expectedResult)
    }

    func testBackdropURLWhenWidthIsVeryLargeReturnsOriginalURL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/original/image.jpg")!

        let result = configuration.backdropURL(for: path, idealWidth: 100000)

        XCTAssertEqual(result, expectedResult)
    }

    func testBackdropURLWhenWidth1280Returns1280URL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/w1280/image.jpg")!

        let result = configuration.backdropURL(for: path, idealWidth: 1280)

        XCTAssertEqual(result, expectedResult)
    }

    func testBackdropURLWhenWidth900Returns1280URL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/w1280/image.jpg")!

        let result = configuration.backdropURL(for: path, idealWidth: 900)

        XCTAssertEqual(result, expectedResult)
    }

    func testBackdropURLWhenWidth200Returns300URL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/w300/image.jpg")!

        let result = configuration.backdropURL(for: path, idealWidth: 200)

        XCTAssertEqual(result, expectedResult)
    }

    func testBackdropURLWhenConfigurationIsEmptyReturnsOriginalURL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/original/image.jpg")!

        let result = emptyConfiguration.backdropURL(for: path)

        XCTAssertEqual(result, expectedResult)
    }

    func testLogoURLWhenNoWidthIsGivenReturnsOriginalURL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/original/image.jpg")!

        let result = configuration.logoURL(for: path)

        XCTAssertEqual(result, expectedResult)
    }

    func testLogoURLWhenWidthIsVeryLargeReturnsOriginalURL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/original/image.jpg")!

        let result = configuration.logoURL(for: path, idealWidth: 100000)

        XCTAssertEqual(result, expectedResult)
    }

    func testLogoURLWhenWidth500Returns500URL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/w500/image.jpg")!

        let result = configuration.logoURL(for: path, idealWidth: 500)

        XCTAssertEqual(result, expectedResult)
    }

    func testLogoURLWhenWidth400Returns500URL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/w500/image.jpg")!

        let result = configuration.logoURL(for: path, idealWidth: 400)

        XCTAssertEqual(result, expectedResult)
    }

    func testLogoURLWhenWidth40Returns45URL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/w45/image.jpg")!

        let result = configuration.logoURL(for: path, idealWidth: 40)

        XCTAssertEqual(result, expectedResult)
    }

    func testLogoURLWhenConfigurationIsEmptyReturnsOriginalURL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/original/image.jpg")!

        let result = emptyConfiguration.logoURL(for: path)

        XCTAssertEqual(result, expectedResult)
    }

    func testPosterURLWhenNoWidthIsGivenReturnsOriginalURL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/original/image.jpg")!

        let result = configuration.posterURL(for: path)

        XCTAssertEqual(result, expectedResult)
    }

    func testPosterURLWhenWidthIsVeryLargeReturnsOriginalURL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/original/image.jpg")!

        let result = configuration.posterURL(for: path, idealWidth: 100000)

        XCTAssertEqual(result, expectedResult)
    }

    func testPosterURLWhenWidth780Returns780URL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/w780/image.jpg")!

        let result = configuration.posterURL(for: path, idealWidth: 780)

        XCTAssertEqual(result, expectedResult)
    }

    func testPosterURLWhenWidth600Returns780URL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/w780/image.jpg")!

        let result = configuration.posterURL(for: path, idealWidth: 600)

        XCTAssertEqual(result, expectedResult)
    }

    func testPosterURLWhenWidth90Returns92URL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/w92/image.jpg")!

        let result = configuration.posterURL(for: path, idealWidth: 90)

        XCTAssertEqual(result, expectedResult)
    }

    func testPosterURLWhenConfigurationIsEmptyReturnsOriginalURL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/original/image.jpg")!

        let result = emptyConfiguration.posterURL(for: path)

        XCTAssertEqual(result, expectedResult)
    }

    func testProfileURLWhenNoWidthIsGivenReturnsOriginalURL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/original/image.jpg")!

        let result = configuration.profileURL(for: path)

        XCTAssertEqual(result, expectedResult)
    }

    func testProfileURLWhenWidthIsVeryLargeReturnsOriginalURL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/original/image.jpg")!

        let result = configuration.profileURL(for: path, idealWidth: 100000)

        XCTAssertEqual(result, expectedResult)
    }

    func testProfileURLWhenWidth185Returns185URL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/w185/image.jpg")!

        let result = configuration.profileURL(for: path, idealWidth: 185)

        XCTAssertEqual(result, expectedResult)
    }

    func testProfileURLWhenWidth100Returns185URL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/w185/image.jpg")!

        let result = configuration.profileURL(for: path, idealWidth: 100)

        XCTAssertEqual(result, expectedResult)
    }

    func testProfileURLWhenWidth40Returns45URL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/w45/image.jpg")!

        let result = configuration.profileURL(for: path, idealWidth: 40)

        XCTAssertEqual(result, expectedResult)
    }

    func testProfileURLWhenConfigurationIsEmptyReturnsOriginalURL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/original/image.jpg")!

        let result = emptyConfiguration.profileURL(for: path)

        XCTAssertEqual(result, expectedResult)
    }

    func testStillURLWhenNoWidthIsGivenReturnsOriginalURL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/original/image.jpg")!

        let result = configuration.stillURL(for: path)

        XCTAssertEqual(result, expectedResult)
    }

    func testStillURLWhenWidthIsVeryLargeReturnsOriginalURL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/original/image.jpg")!

        let result = configuration.stillURL(for: path, idealWidth: 100000)

        XCTAssertEqual(result, expectedResult)
    }

    func testStillURLWhenWidth300Returns300URL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/w300/image.jpg")!

        let result = configuration.stillURL(for: path, idealWidth: 300)

        XCTAssertEqual(result, expectedResult)
    }

    func testStillURLWhenWidth190Returns300URL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/w300/image.jpg")!

        let result = configuration.stillURL(for: path, idealWidth: 190)

        XCTAssertEqual(result, expectedResult)
    }

    func testStillURLWhenWidth50Returns92URL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/w92/image.jpg")!

        let result = configuration.stillURL(for: path, idealWidth: 50)

        XCTAssertEqual(result, expectedResult)
    }

    func testStillURLWhenConfigurationIsEmptyReturnsOriginalURL() {
        let path = URL(string: "/image.jpg")!
        let expectedResult = URL(string: "https://image.tmdb.org/t/p/original/image.jpg")!

        let result = emptyConfiguration.stillURL(for: path)

        XCTAssertEqual(result, expectedResult)
    }

}