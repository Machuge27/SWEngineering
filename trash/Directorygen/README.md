
# Directory Structure Generator

This is a simple script that helps you create a directory structure and files based on a `.md` file.

## 📌 How It Works
1. The script reads a file named `structure.md` located on your Desktop.
2. It generates folders and files described in the `.md` file, along with placeholder content if comments are provided.
3. The output is created in a folder named `pytest-guide` at the specified location.

---

## 📂 How To Use
1. Save your desired directory structure as a file called `structure.md` on your **Desktop**.
2. Save the script as `generate_structure.py`.
3. Open your terminal and navigate to the directory containing the script.

4. Run the script with the command:
```bash
python generate_structure.py <path_to_target_directory>
```
Replace `<path_to_target_directory>` with the path where you want the `pytest-guide` folder to be created.

---

## 📋 Example Structure.md
```markdown
pytest-guide/
├── README.md                       # Main documentation overview
├── 1_introduction/
│   ├── README.md                   # Introduction to pytest
│   └── why_pytest.md               # Comparison with other frameworks
├── 2_installation/
│   ├── README.md                   # Installation instructions
│   └── verifying_installation.md   # How to verify installation
```

---

## 📂 Generated Structure Example
```
pytest-guide/
├── README.md (contains: "# Main documentation overview")
├── 1_introduction/
│   ├── README.md (contains: "# Introduction to pytest")
│   └── why_pytest.md (contains: "# Comparison with other frameworks")
├── 2_installation/
│   ├── README.md (contains: "# Installation instructions")
│   └── verifying_installation.md (contains: "# How to verify installation")
```

---

## ✅ Notes
- The `structure.md` file must always be placed on your **Desktop**.
- If a comment is present in the `.md` file, it is saved as placeholder content in the generated files.

Happy coding! 🚀
