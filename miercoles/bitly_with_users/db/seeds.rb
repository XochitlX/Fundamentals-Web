
User.create
User.create(name: "xochitl", email: "xoch@", password: "xo")
User.create(name: "juan", email: "jua@", password: "ju")
User.create(name: "july", email: "jul@", password: "ju")
User.create(name: "manuel", email: "manu@", password: "ma")

Url.create(user_id: 3, long_url: "https://github.com/XochitlX/Data-Base/blob/master/jueves/maraton_active/app/models/maraton.rb", short_url: "a1", click_count: 0)
Url.create(user_id: 1, long_url: "https://github.com/XochitlX/Data-Base/blob/master/jueves/maraton_active/db/migrate/20121011144238_create_tasks.rb", short_url: "a2", click_count: 0)
Url.create(user_id: 1, long_url: "https://twitter.com/lanadelrey?lang=es", short_url: "a3", click_count: 0)
Url.create(user_id: 1, long_url: "http://guides.rubyonrails.org/association_basics.html", short_url: "a4", click_count: 0)
Url.create(user_id: 3, long_url: "http://www.locomotion.mx/challenges/465/?course=1&week=6&day=4", short_url: "a5", click_count: 0)
Url.create(user_id: 2, long_url: "http://www.locomotion.mx/challenges/465/?course=1&week=6&day=4", short_url: "a6", click_count: 0)
