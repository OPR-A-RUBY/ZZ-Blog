____ 1. Устанавливаем Rais

gem install rails

____ 2. Переходим в папку, где будет создаваться папка с нашим приложением внутри. И вводим команду создания нового приложенеия на RAILS

rails new ZZ-Blog

# Будет создана папка ZZ_Blog, в ней ещё куча папок и файлов. Затем автоматически запуститься установка необходимых гемов: bundle install
# и потом ещё куча зависимостей. Всё автоматически.
# Процесс не быстрый придётся подождать ...
# 13.05.2020 - у меня получилось 16.886 файлов и 2985 папок

____ 3. Дальше смотрим, на запус RAILS т.е. вводим коменду:

rails server

# будет примерно такой вывод в терминале:
# => Booting Puma
# => Rails 6.0.3 application starting in development 
# => Run `rails server --help` for more startup options
# Puma starting in single mode...
# * Version 4.3.3 (ruby 2.6.0-p0), codename: Mysterious Traveller
# * Min threads: 5, max threads: 5
# * Environment: development
# * Listening on tcp://127.0.0.1:3000
# * Listening on tcp://[::1]:3000
# Use Ctrl-C to stop

# По адресу http://localhost:3000/
# смотрим стартовую картинку RUBY on RAILS
# здесь же видны версии Rails и Ruby
# у меня вот так:
# Rails version: 6.0.3
# Ruby version: ruby 2.6.0p0 (2018-12-25 revision 66547) [x86_64-linux]

4. Делаем репозиторий в github.com

____ 4.1. На сайте создаём пустой репозиторий с именем, как имя главной папки нашего приложения.

____ 4.2. Далее запускаем в терминале, открытом внутри основной папки приложения 

# echo "# Bad-App" >> README.md
# git init
# git add README.md
# git commit -m "first commit"
# git remote add origin https://github.com/OPR-A-RUBY/Bad-App.git
# git push -u origin master

# Аналогичные эффект должен получиться через ungit 
# Здесь можно подключ нашу папку к репозиторию через Fetch from origin
# вводим имя: origin
# url: git@github.com:OPR-A-RUBY/ZZ-Blog.git
# Внимание! именно SSH иначе придётся вводить логин и пароль

____ 4.3. Запускаем ungit 

____ 5. Создаём контроллер Home # index
# Далее все команды выполняются в терминале открытом в главной папке приложения

rails g controller home index
# Здесь сщздаётся контроллер home с экшеном index 
# Экшен это акция

# Так мы создали контроллер который будет выполняться при обращении к странице 
http://localhost:3000/home/index

____ 6. Создаём модель Zamet, с набором свойств

rails g model Zamet z_title:string z_body:text
# Running via Spring preloader in process 8453
#       invoke  active_record
#       create    db/migrate/20200514173342_create_zamets.rb
#       create    app/models/zamet.rb
#       invoke    test_unit
#       create      test/models/zamet_test.rb
#       create      test/fixtures/zamets.yml


# Проверяем наличие новых файлов.

rails db:migrate

# Проверяем наличие таблицы в db.

____ 7. Добавляем маршруты. Сначала смотрим что уже есть:

rake routes
# выводит нам все существующие маршруты и контроллеры с экшенами к ним

# например одна строка описывает один маршрут:
#
#   /------------------------ название переменной маршрута
#   |        /--------------- метод 
#   |        |        /------ маршрут 
#   |        |        |                         /---------- контроллер
#   V        V        V                         V    V----- экшен 
  home_index GET    /home/index(.:format)       home#index

# файл настройки маршрутов можно увидеть в config/routes.rb

____ 7.1. Заходим в файл настройки машрутизации и вводим туда

resources :zamets

# Это позволило создать 8 НОВЫХ МАРШРУТОВ, которые можно увидеть через
rake routes

# вот фрагмент вывода команды:
home_index GET    /home/index(.:format)       home#index
    zamets GET    /zamets(.:format)           zamets#index
           POST   /zamets(.:format)           zamets#create
 new_zamet GET    /zamets/new(.:format)       zamets#new
edit_zamet GET    /zamets/:id/edit(.:format)  zamets#edit
     zamet GET    /zamets/:id(.:format)       zamets#show
           PATCH  /zamets/:id(.:format)       zamets#update
           PUT    /zamets/:id(.:format)       zamets#update
           DELETE /zamets/:id(.:format)       zamets#destroy

           