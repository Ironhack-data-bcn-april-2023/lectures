![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Lab | Encapsulation & modularization

## Iteration 0 - Setting up

Create folders and files so that your lab looks like this:

```
images/
data/
src/
Iteration 1.ipynb
Iteration 2.ipynb
main.py
.gitignore
README.md
```

## Iteration 1 - Imperative programming
Follow the instructions in your jupyter notebook. Iteration 1

## Iteration 2 - Encapsulation: Imperaitive to functional,
Follow the instructions in your jupyter notebook: Iteration 2

## Iteration 3 - Modularization: creating your own modules
Here we will find a place for the functions we have defined.
On the src folder, create three different python files. It should look like this:

```
src/
    extraction.py
    cleaning.py
    visualization.py
```

Copy the functions from Iteration 2 into these python files. Each function should go to a different file.

## Iteration 4 - Importing your own modules

Now, for practice, will import our own functions into a jupyter notebook. This time we won't see as much code.

- Create a notebook called `Pipeline.ipynb`
- On it, import your own functions

```python
import src.extraction as extract
import src.cleaning as clean
import src.visualization as viz
```

Then, **call** the functions:

```python
df = extract.downloading_file("the link")
(...)
```

Notice how we will be using the `df = ...`. We do this to save the result of that function into a variable. That way, we will be able to refer to it again and pass it to the next function as an argument if needed.

Repeat the process for the three functions.

Make sure you include markdown cells for titles, images (if needed), etc.

## Iteration 5 - Create an executable python file

Now that everything works, copy all the code into the `main.py` and save it. Make sure you also add the needed libraries.

- Save
- Go to your terminal
- On the root, run: `python manin.py` and see the magic happen.

## Iteration 6

Your repo is almost ready. Make sure:

- You don't have any temp or cached files. If you do, delete them and add them to the .gitignore (check out the .gitignore from the lectures repo)
- You don't have any information that doesn't add value: duplicated notebooks, messy drafts, tests, etc
- The Pipeline notebook is commented: you include markdown for titles, you include images in markdown, etc.
- Your functions do have docstrings.
- Your repo now should look like this:

```src
images/
data/
src/
    extraction.py
    cleaning.py
    visualization.py
Iteration 1.ipynb
Iteration 2.ipynb
Pipeline.ipynb
main.py
.gitignore
README.md
```

Do you want to get rid off Iteration 1 & Iteration 2?

## BONUS: Iteration 7

Use argparse to parametrize the input of your functions.
