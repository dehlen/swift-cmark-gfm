# swift-cmark-gfm

This is a [Github cmark-gfm](https://github.com/github/cmark-gfm) markdown parsing library as a Swift package. It keeps the original source tree in `cmark-gfm` folder as a git submodule for easy synchronization with the origin repository.  

There you can access the [original README.md](./cmark-gfm/README.md) along with the original licensing information [COPYING](./cmark-gfm/COPYING).

## Usage

Currently only the original `cmark-gfm` C API is provided. The API can be imported using the module `cmark_gfm`.

The following example illustrates a simple usage:

```swift
import cmark_gfm

func renderMarkdown(_ string: String) -> String? {
    let result = cmark_markdown_to_html(string, string.utf8.count, 0)
    if let strPointer = result {
        let output = String(cString: strPointer)
        free(result)
        return output
    }
    return nil
}
```

In a future update, a separate, more convenient Swift API will be provided.
