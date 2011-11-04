Strawberry Cough
================

Strawberry Cough lets you access your Rails 3 routes in your JavaScripts.

Example
-------

    # In your routes.rb

    resources :widgets
    root :to => "widgets#index"

With Strawberry Cough, you get access to URL helpers in JavaScript via the
`Routes` object.

    // In any JavaScript file

    Routes.widgetsPath();          // "/widgets"
    Routes.newWidgetPath();        // "/widgets/new"
    Routes.newWidgetPath("xml");   // "/widgets/new.xml"
    Routes.rootPath();             // "/"

Installation
------------

To install, just add the following line to your Gemfile.

    gem 'strawberry_cough'

Then `//= require routes` in the JavaScript manifest file.

If you want a differently named JavaScript file add
`somefile.js.strawberry_cough` to your javascript assets.

Notes
-----

Right now, Strawberry Cough is **Rails 3.1 only**.

It uses Rails' asset pipeline to generate the route file.
In development/test environments add config.assets.compile=true.

Authors
-------

  * Craig Savolainen ([maedhr](http://github.com/maedhr))
  * Nate Smith ([nwjsmith](http://github.com/nwjsmith))

License
-------

Copyright 2011, Three Wise Men Inc. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

   1. Redistributions of source code must retain the above copyright notice,
      this list of conditions and the following disclaimer.

   2. Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THREE WISE MEN, INC "AS IS" AND ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
EVENT SHALL THREE WISE MEN, INC OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are
those of the authors and should not be interpreted as representing official
policies, either expressed or implied, of Three Wise Men Inc.

  [1]: http://api.rubyonrails.org/classes/Rails/Railtie.html "Railties docs"
