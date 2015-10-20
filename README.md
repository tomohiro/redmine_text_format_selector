Redmine Text Format Selector
================================================================================

![GitHub Tag](https://img.shields.io/github/tag/Tomohiro/redmine_text_format_selector.svg)

This is a redmin plugin that adds text format selector to a specified project.


Installation
--------------------------------------------------------------------------------

Add the gem to `$REDMINE_DIR/Gemfile.local`:

```ruby
gem 'redmine_text_format_selector', github: 'Tomohiro/redmine_text_format_selector'
```

Run `bundle` and then restart your Redmine.


Usage
--------------------------------------------------------------------------------

Create a custom field to projects.

### Custom field configuration

Item            | Value
--------------- | --------------------------------------------------------------
Format          | List
Name            | Text Format
Possible Values | textile<br>markdown


LICENSE
--------------------------------------------------------------------------------

&copy; 2014 - 2015 Tomohiro TAIRA.

This project is licensed under the [GNU General Public License v2](http://www.gnu.org/licenses/old-licenses/gpl-2.0.html).
