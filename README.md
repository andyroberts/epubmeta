# epubmeta
Extracts metadata information from EPUB files. Supports EPUB2 and EPUB3 formats.

*This lib is a fork of `epubinfo`, which had not been updated since 2014.*

## Usage

```ruby
require 'epubmeta'
EPUBMeta.get('path/to/epub/file.epub')
```

Which returns a `EPUBMeta::Models::Book` instance, please refer to the [API documentation](http://rubydoc.info/gems/epubmeta/frames) from here on

## Changelog

**0.6.0** *May 06, 2020*

* Support reading rendition property. Accessible via `Book.fixed_layout?`
* Update nokogiti dependency to `>= 1.10.8` to mitigate CVE-2020-7595

**0.5.4** *Februry 04, 2020*

* Update rubyzip dependency to `~> 1.3.0` to mitigate CVE-2019-16892

**0.5.3** *November 26, 2019*

* Update nokogiri dependency to `>= 1.10.4` to mitigate CVE-2019-5477
* Update yard dependency to `>= 0.9.20` to mitigate CVE-2019-1020001

**0.5.2** *October 09, 2018*

* Remove `redcarpet` dependency
* Update gemspec to use correct runtime and development dependency syntax

**0.5.1** *October 09, 2018*

* Update rubyzip dependency due to security vulnerability
* Fix gemspec dependencies to use up-to-date versions (as found in the Gemfile)

**0.5.0** *August 10, 2018*

* Convert module name EPUBMeta
* Fix cover metadata parsing bug (credit: @Gizmokid2005)

** < 0.5.0 **

* Changelog for previous versions (pre-fork) can be found in the [epubinfo changelog](https://github.com/chdorner/epubinfo#changelog).

## Contributing to epubmeta
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2018--2020 Andrew Roberts. 
Copyright (c) 2012--2014 Christof Dorner. 
See LICENSE.txt for further details.