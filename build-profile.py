from github import Github
import os

g = Github(os.environ["GH_TOKEN"])
MY_NAME = "AshGreyG"

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
    
    return my_count * 1.0 / realize_count

if __name__ == "__main__" :
    lines = []

    with open("./README.md", "r", encoding="utf-8") as file :
        lines = file.readlines()
        for (index, line) in enumerate(lines) :
            if line.strip() == "<!-- Begin Realize Status -->" :
                lines.insert(index, "``` plaintext")
                lines.insert(index + 1, f"{get_percent_type_challenges()}")
                lines.insert(index + 2, "```")

    with open("./README.md", "w", encoding="utf-8") as file :
        file.writelines(lines)

    print("🎉 All data has been written into profile.")