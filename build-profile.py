from github import Github, Auth
import os

g = Github(auth = Auth.Token(os.environ["GH_TOKEN"]))
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
    
    return round(my_count * 100.0 / realize_count, 2)

if __name__ == "__main__" :
    with open("./README.md", "r", encoding="utf--8") as file :
        lines = file.readlines()

    updated_lines = []
    found_marker = False
    for line in lines :
        if line.strip() == "<!-- Begin Realize Status -->" :
            found_marker = True
            updated_lines.append(line)
            updated_lines.append("``` plaintext")
            updated_lines.append(f"{get_percent_type_challenges()}")
            updated_lines.append("```")
        elif line.strip() == "<!-- End Realize Status -->" :
            found_marker = False
            updated_lines.append(line)
        elif not found_marker :
            updated_lines.append(line)

    with open("./README.md", "w", encoding="utf-8") as file:
        file.writelines(updated_lines)

    print("🎉 All data has been written into profile.")