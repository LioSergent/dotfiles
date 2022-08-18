import os

if __name__=="__main__":
    os.chdir("/home/liosergent/Downloads/documentation")
    for subfolder in os.listdir():
        for doc in os.listdir(subfolder): 
            no_ext = doc.split(".")[0]
            try:
                year, author, name = no_ext.split("-")
            except ValueError:
                print(f"Too many - for {doc}")
                continue
            new_name = "-".join((author, year, name)) + ".pdf"
            old_path = os.path.join(subfolder, doc)
            new_path = os.path.join(subfolder, new_name)
            os.rename(old_path, new_path)
