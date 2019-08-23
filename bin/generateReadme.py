#!/usr/bin/env python3
# -*- coding: utf-8 -*-


from collections import namedtuple
import json
from os.path import dirname, realpath, join

PROJECT_FILE = "projects_by_sdg.json"
ENTRY_TEMPLATE = (
    lambda p: f"""### {p.name}
{p.description}
* rating: {p.rating}
* license: {p.license}
* [website]({p.websiteUrl}) | [repo]({p.repoUrl})
"""
)


def main():
    file_path = realpath(__file__)
    root_dir = dirname(dirname(file_path))
    dist_dir = join(root_dir, "dist")
    projects_source = join(dist_dir, PROJECT_FILE)

    with open(projects_source, "r") as f:
        data = json.load(f)

    for sdg, projects in data.items():
        print(f"## {sdg}\n")
        for p in projects:
            project = namedtuple("Project", p.keys())(*p.values())
            print(ENTRY_TEMPLATE(project))


if __name__ == "__main__":
    main()
