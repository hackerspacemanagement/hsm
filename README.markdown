Hackerspace Management
=========

This code is based on Rails 3.1.3

Dependencies
------------

Before running this app, you will need:
* Ruby (version 1.9.2)
* Rails 3.1
* A working installation of "MongoDB":http://www.mongodb.org/ (version 1.6.0 or newer)

Production Environment
----------------------
    $ git clone git@github.com:rrix/hsm.git
    $ cd hsm
    $ bundle install
    $ rake db:seed

Development / Test Environment
------------------------------
    $ git clone git@github.com:rrix/hsm.git
    $ cd hsm
    $ bundle install --without production staging ci
    $ rake db:seed

Tests
-----

Tests are written using factory girl, rspec, and capybara. Factories are located in **spec/factories.rb**. Model specs are located in **spec/models**. Integration specs are in **spec/requests**.

To run the test suite:

    $ bundle exec rspec spec/

Please Remember: Edit the README
--------------------------------

If you are contributing to this project, please edit the README file to update any dependencies, usage information, etc.

Contributing
------------

If you make improvements to this application, please share with others.

Send us a message, create an "issue": , or fork the project and submit a pull request.

If you add functionality to this application, create an alternative implementation, or build an application that is similar, please contact us and we'll add a note to the README so others can find your work.


