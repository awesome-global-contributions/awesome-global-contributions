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
SDG = [
    "No poverty",
    "Zero hunger",
    "Good health and well-being",
    "Quality education",
    "Gender equality",
    "Clean water and sanitation",
    "Affordable and clean energy",
    "Decent work and economic growth",
    "Industry, Innovation and infrastructure",
    "Reduced inequalities",
    "Sustainable cities and communities",
    "Responsible consumption and production",
    "Climate action",
    "Life below water",
    "Life on land",
    "Peace, Justice and strong institutions",
    "Partnerships for the goals",
]


def main():
    file_path = realpath(__file__)
    root_dir = dirname(dirname(file_path))
    dist_dir = join(root_dir, "dist")
    projects_source = join(dist_dir, PROJECT_FILE)

    with open(projects_source, "r") as f:
        data = json.load(f)

    for sdg, projects in data.items():
        print(f"## SDG {sdg}: {SDG[int(sdg)-1]}\n")
        for p in projects:
            project = namedtuple("Project", p.keys())(*p.values())
            print(ENTRY_TEMPLATE(project))


if __name__ == "__main__":
    main()
