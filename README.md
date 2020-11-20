# swift-cmark-gfm

This is a [Github cmark-gfm](https://github.com/github/cmark-gfm) markdown parsing library as a Swift package. It keeps the original source tree in `cmark-gfm` folder as a git submodule for easy synchronization with the origin repository.  

There you can access the [original README.md](./cmark-gfm/README.md) along with the original licensing information [COPYING](./cmark-gfm/COPYING).

## Usage

### Cloning the package

It is a known restriction of the Swift package manager that it doesn't fetch submodules. Therefore you will have to clone the repository yourself and include the package to your project directly.

To ensure the submodule is properly cloned, use the following command to clone the repository:

    git clone --recursive https://github.com/dehlen/swift-cmark-gfm.git

Afterwards, the subdirectory `cmark-gfm` should contain the [cmark-gfm sources](https://github.com/github/cmark-gfm).

If you forgot the `--recursive` option while cloning the repository, you can also get the submodule by executing

    git submodule update

### Rendering Markdown

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
