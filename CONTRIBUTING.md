# Contribution Guideline: Adding a project

First up, thank you for wanting to contribute to this project :).
This document will guide you through all the steps necessary in
order to add your project to this list.
If you encounter problems while doing so, please don't hesitate
to open an issue.

We've done our best to make it as easy as possible to add a new
project.
_You don't even need to leave the browser!_

## 1. Add a new Project yaml file

First create a new Project yaml file.
You can do so by clicking [this link](https://github.com/awesome-global-contributions/awesome-global-contributions/new/master/src).

Please name it `project_name_in_lowercase.yaml`.
We'll add the content in the next step.

## 2. Fill out the project information

Now you have two ways to add the information of the project:

1. The recommended method is to use the
    [online editor](https://awesome-global-contributions.github.io/#/create).
    This editor can automatically fetch a lot of information if
    you give it a link to a github repository.
2. The second is to copy the contents of
    [ENTRY_TEMPLATE.yaml](https://github.com/awesome-global-contributions/awesome-global-contributions/blob/master/ENTRY_TEMPLATE.yaml)
    into your new file and then fill out all of the values.

In both cases please make sure to not have more than 80 characters
in one line or else our lint-check will fail.
The online editor does a good job for it if there is enough
whitespace to insert linebreaks.

Else you can use an escaped linebreak like this:

```yaml
starsUrl: "https://img.shields.io/github/stars/org/project.svg\
           ?style=social&label=Star&maxAge=2592000"
```

In case some of the entries are not clear, all of them are
described in detail here:

### Necessary information

These include all of the information that have to be provided, if
the project should be added to this list.

- `name`: The name of the project
- `description`: This description will be presented in the markdown
    file and on the website.
    Explain why the project is awesome and why somebody might want
    to contribute to it
- `sdgs`: The [SDGs](https://www.undp.org/content/undp/en/home/sustainable-development-goals.html)
    that can be associated with the project.
    It's a simple list of the numbers of the goals.
- `license`: Simply fill out the name of the license the project uses.
    Generally we accept any that are approved by the Open Source
    Initiative (see list [here](https://opensource.org/licenses/alphabetical)).
    If you want to add a project with a different license, you can
    still create a PR, but please mention it in the description.
- `programmingLanguages`: List all of the programming languages, that
    the project uses.
    They have to be all lowercase and can use special characters
    (for example: `c#`, `javascript`)
- `repoUrl`: The URL to the repository of the project.
    This should lead you directly to the code.
- `websiteUrl`: The URL for the website of the project.
    If it doesn't have one, simply use the README of the project.
- `rating`: The friendliness rating of the project.
    Currently a 0-10 Likert scale. You should probably do this last.
    <!-- See the [guide]() to know what number to give it. -->
    > TODO: Define ratings

### Optional fields

The following elements will not lead to an error when they are not present.
If possible, they should still be filled out, but not every project will provide
the necessary data.

- `contributionGuidelinesUrl`: The URL to the contribution guidelines
    of the project.
- `logoUrl`: The URL to an image file that represents the logo of the
    project
- `starsUrl`: The Github stars link.
    Currently looks like `https://img.shields.io/github/stars/org/project.svg?style=social&label=Star&maxAge=2592000`.
    Images from other websites could also be added here.
- `numberContributors`: We regularly, automatically update the number
    of contributors.
    For this, you will have to provide a `url`, a `format` and a `accessor`.
    The script will call the URL and interpret the answer as either a JSON,
    YAML or XML file, based on the given `format`.

    The `accessor` defines how the script will interpret the resulting data.
    Valid values are: `list`, `number` and any string after a `?`
    For a list, it will count the entries and use that as the number of
    collaborators.
    When `number` is specified, it will expect the returned data to be a
    integer.
    The last option is to specify the property that will be tried to be read.

    Following is a short example of an answer and the corresponding correct
    configuration:
    ```json
    {
        "name": "example return data",
        "numberOfContributors": 14
    }
    ```
    ```yaml
    # Project configuration
    numberContributors:
        url: "https://my.awesome.project.io/api/meta-data.json"
        format: json
        accessor: "?numberOfContributors"
    ```
- `ratingComment`: A comment on the given rating
- `licenseUrl`: Link to the license of the project.
- `naturalLanguages`: While the most common language for international projects
    is English, this list hosts projects from everywhere in the world.
    List all languages that the project's company communicates in.
    (It's not necessary that the code is written in that language)
- `otherLinks`: Object with `name`, `description` and `link`.
    If you have any other interesting links relating to the project that do not
    fit into any of the other fields, feel free to add them here.

### Example based on this project

This is how the entry would look for this project:

```yaml
---
name: awesome-global-contributions
description: >
    Awesome-global-contributions list a number of
    open source projects dedicated to tackling global
    challenges and ultimately better the world.
license: CC0
programmingLanguages:
  - markdown
  - bash
rating: 5
repoUrl: "https://github.com/awesome-global-contributions/awesome-global-contributions"
sdgs: [9, 17]
websiteUrl: "https://awesome-global-contributions.github.io/"

contributionGuidelinesUrl: "https://github.com/awesome-global-contributions/awesome-global-contributions/blob/master/CONTRIBUTING.md"
logoUrl: ""
starsUrl: "https://img.shields.io/github/stars/awesome-global-contributions/awesome-global-contributions.svg?style=social&label=Star&maxAge=2592000"
numberContributors:
  url: "https://api.github.com/repos/awesome-global-contributions/awesome-global-contributions/stats/contributors"
  format: json
  accessor: list

licenseUrl: "https://github.com/awesome-global-contributions/awesome-global-contributions/blob/master/LICENSE"
naturalLanguages:
  - English
```

## 3. Send us the PR

Simply click the button and let Github create the PR for you.

Common style for both the commit and the PR title is: `proj: My great Project`

We will automatically lint the YAML file when you create the PR.
After merging it, we will also regenerate the README and json
file which is used on the website.

# Contribution Guide: Other improvements

If you have other improvements for this project, feel free to
send a PR or open an issue.

If you want to help improve the website, this is also very much
welcomed.
Since we do not maintain a contribution guide for it, just create
an issue.
We'll try to help you out as much as possible.