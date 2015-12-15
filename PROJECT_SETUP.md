# Project Setup

Clone the repository for the project you are working on into a conveniently accessible location. I like to clone projects into a `projects` folder in my home directory.

```
cd ~/projects
git clone <url of project.git>
```

## Virtual Environment Setup

Create a folder for storing Python virtual environments (if you do not have one already):

```
mkdir ~/virtualenvs
```

Create a new virtual environment for the project you are working on:

```
virtualenv ~/virtualenvs/<project name>
```

Activate the virtual environment for the project:

```
source ~/virtualenvs/<project name>/bin/activate
```

You should now see "(<project name>)" on your terminal prompt. You should activate your virtual environment each time you work on a project and you need to call Python directly. This ensures that you use the Python installation for the project rather than your system installation. 

To confirm that the virtual environment is active and pointing at the appropriate Python executable, you can run this command:

```
$ which python
/home/<username>/virtualenvs/<project name>/bin/python
```

You can see that the return value should match the path to the virtual environment. 

Install Python requirements in virtual environment (be sure the virtual environment is activated as described in the previous step):

```
cd /path/to/project/root
pip install -r requirements/local.txt
```

## Database setup

Create a local postgres database for the project by running:

```
createdb <project name>
```

We do this because the Django app will expect to find a database with a name matching the project.

Migrate the database in order to apply existing database migrations (make sure you are in the virtual environment):

```
python manage.py migrate
```

You should now be able to run the Django server and open the site in a web browser on localhost:

## Run Django Server

```
python manage.py runserver
```

The console output should provide the localhost address that you can enter into your web browser to view the site. 

We can also configure the server to be run through PyCharm (instructions for this can be found in the PyCharm setup guide). 

