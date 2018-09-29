Sample
=================================

## Text

plain  
*italic*  
**strong**  
***italic strong***  
~~scratch~~  
日本語にほんごニホンゴ

## Code block

### With backticks

```
puts 123
```

### With indent

    puts 123

### With specific language

```language-ruby
markdown = Redcarpet::Markdown.new(renderer, extensions = {})
puts markdown
puts $file
```

### Command line

```command-line
ls -la
tail /var/log/access.log
```

## Image

![alt text][logo]

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 2"

## List

### Unorderd

- first
  - a
  - b
  - c
- second
- third

### Orderd

1. first
  - a
  - b
  - c
2. second
3. third

## table  

| header 1 | header 2 |
| -------- | -------- |
| cell 1   | cell 2   |
| cell 3   | cell 4   |

## Quote

> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## Link

[Link](http://example.com)    
http://example.com/autolink
