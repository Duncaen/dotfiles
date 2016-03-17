if [ -x /usr/bin/python -o -x /usr/bin/python3 ]; then
  alias djrs="python manage.py runserver 0.0.0.0:8000"
  alias djcs="python manage.py collectstatic"
  alias djm="python manage.py migrate"
  alias djmm="python manage.py makemigrations"
  alias djcu="python manage.py createsuperuser"
fi
