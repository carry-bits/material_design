pin "application-md", to: "material_design/application.js"
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from MaterialDesign::Engine.root.join("app/javascript/material_design/controllers"), under: "controllers", to: "material_design/controllers"

