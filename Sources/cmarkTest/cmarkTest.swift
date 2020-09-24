import XCTest
@testable import cmark_gfm

class cmarkTest: XCTestCase {

    func renderMarkdown(_ string: String) -> String? {
        let result = cmark_markdown_to_html(string, string.utf8.count, 0)
        if let strPointer = result {
            let output = String(cString: strPointer)
            free(result)
            return output
        }
        return nil
    }
    
    func testVersion() {
        let versionString = cmark_version_string()
        let version = cmark_version()
        print("Version: \(String(cString: versionString!)), as Int: \(String(format: "%08x", version))")
        XCTAssert(versionString != nil, "Version could be read")
    }

    func testHeader1() {
        let markdown = "# Header 1"
        let html = renderMarkdown(markdown)
        XCTAssertEqual(html, "<h1>Header 1</h1>\n")
    }
    
    func testCurlyQuotes() {
        let markdown = "“This is a quote”\nFollowed by some text"
        let html = renderMarkdown(markdown)
        XCTAssertEqual(html, "<p>“This is a quote”\nFollowed by some text</p>\n")
    }
}
