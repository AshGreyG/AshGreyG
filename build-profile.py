from github import Github, Auth
import os
import math
import datetime

g = Github(auth = Auth.Token(os.environ["GH_TOKEN"]))
MY_NAME = "AshGreyG"

def percent_visualize(num: float) -> str :
    """
    This function is to visualize the working process
    ░   ->  0%
    ▒   ->  1%
    ▓   ->  3%
    █   ->  5%
    """

    num_percent_5 = math.floor(num / 5)
    num_percent_3 = math.floor((num - num_percent_5 * 5) / 3)
    num_percent_1 = math.floor(num - num_percent_5 * 5 - num_percent_3 * 3)
    return "█" * num_percent_5 + "▓" * num_percent_3 + "▒" * num_percent_1 + "░" * (20 - num_percent_5 - num_percent_3 - num_percent_1)

def get_percent_type_challenges() -> float :
    """
    This function is to get the work progress of `To-Realize-Type-Challenges`
    """

    my_repo = g.get_repo(f"{MY_NAME}/To-Realize-Type-Challenges")
    my_content = my_repo.get_contents("questions")
    my_count = sum(1 for content in my_content if content.type == "file")

    realize_repo = g.get_repo("type-challenges/type-challenges")
    realize_content = realize_repo.get_contents("questions")
    realize_count = sum(1 for content in realize_content if content.type == "dir")
    
    return round(my_count * 100.0 / realize_count, 2)

def get_percent_underscore() -> float :
    """
    This function is to get the work progress of `To-Realize-Underscore`
    """

    my_repo = g.get_repo(f"{MY_NAME}/To-Realize-Underscore")
    my_content = my_repo.get_contents("modules")
    my_count = sum(1 for content in my_content if content.type == "file")

    realize_repo = g.get_repo("jashkenas/underscore")
    realize_content = realize_repo.get_contents("modules")
    realize_count = sum(1 for content in realize_content if content.type == "file")

    return round(my_count * 100.0 / realize_count, 2)

def realize_row(title: str, percent: float) -> str :
    return "{:<30} {:<20} {:>8}%\n".format(
        title,
        percent_visualize(percent),
        percent
    )

REALIZE_DATA = [
    ["To-Realize-Type-Challenges", get_percent_type_challenges()],
    ["To-Realize-Underscore",      get_percent_underscore()]
]

# --------------------- #
# Get the Goal of Today #
# --------------------- #

def get_today_goal() -> str :
    now = datetime.datetime.now()
    today = datetime.datetime.today().strftime("%Y-%m-%d")
    found_today_marker = False
    return_str = ""

    with open("./Todo" + now.year + "/" + str(now.month).zfill(2) + ".md") as file :
        lines = file.readlines()

    for lin in lines :
        if line[2:12] == today :
            found_today_marker = True
            return_str += line
        elif found_today_marker and line[2] == " " :
            return_str += line
        elif found_today_marker and line[2] != " " :
            return return_str

if __name__ == "__main__" :
    with open("./README.md", "r", encoding="utf--8") as file :
        lines = file.readlines()

    updated_lines = []
    found_marker = False
    for line in lines :
        if line.strip() == "<!-- Begin Realize Status -->" :
            found_marker = True
            updated_lines.append(line)
            updated_lines.append("``` plaintext\n")

            for realize in REALIZE_DATA :
                updated_lines.append(realize_row(realize[0], realize[1]))

            updated_lines.append("```\n")
        elif line.strip() == "<!-- End Realize Status -->" :
            found_marker = False
            updated_lines.append(line)
        elif line.strip() == "<!-- Begin Goal of Today -->" :
            found_marker = True
            updated_lines.append(line)
            updated_lines.append(get_today_goal())
        elif line.strip() == "<!-- End Goal of Today -->" :
            found_marker = False
            updated_lines.append(line)
        elif not found_marker :
            updated_lines.append(line)

    with open("./README.md", "w", encoding="utf-8") as file:
        file.writelines(updated_lines)

    print("🎉 All data has been written into profile.")