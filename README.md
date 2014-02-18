## Welcome to ServerFu

Rails is a web-application application built to track the
hosting companies, servers and contacts that a typical firm hosting
their customers' websites need to keep straight.

The application is in early development, and at this point only the
"Hosts" menu item has had its implementation started.

## Getting Started

1. In case you don't have rails installed, install it:

        gem install rails

2. Navigate to a place where you want to run this application, then
grab ServerFu:

        git clone git@github.com:nurelm/serverfu.git

3. Change directory to `serverfu`, create the databse, then start the
web server:

        cd serverfu
        bundle install
        rake db:migrate
        rails server

4. Go to http://localhost:3000 and you'll see the overview screen.

## Contributing

If this is something you need and would like to help out on, let us know!

## License

ServerFu is released under the [MIT License](http://www.opensource.org/licenses/MIT).
