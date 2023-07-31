# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "alpinejs", to: "https://unpkg.com/alpinejs@3.10.5/dist/cdn.min.js"
pin "@alpinejs/persist", to: "https://unpkg.com/@alpinejs/persist@3.10.5/dist/cdn.min.js"
pin "@alpinejs/collapse", to: "https://unpkg.com/@alpinejs/collapse@3.10.5/dist/cdn.min.js"
pin "alpine-turbo-drive-adapter", to: "https://cdn.jsdelivr.net/npm/alpine-turbo-drive-adapter@2.0.x/dist/alpine-turbo-drive-adapter.min.js"
pin "@hotwired/turbo", to: "https://ga.jspm.io/npm:@hotwired/turbo@7.2.4/dist/turbo.es2017-esm.js"
pin "@rails/actioncable/src", to: "https://ga.jspm.io/npm:@rails/actioncable@7.0.4/src/index.js"
pin "@rails/actioncable", to: "https://ga.jspm.io/npm:@rails/actioncable@7.0.4/app/assets/javascripts/actioncable.esm.js"
pin "@rails/actiontext", to: "https://ga.jspm.io/npm:@rails/actiontext@7.0.4/app/assets/javascripts/actiontext.js"
pin "stimulus", to: "https://ga.jspm.io/npm:stimulus@3.1.1/dist/stimulus.js"
