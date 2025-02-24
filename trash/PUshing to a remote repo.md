<!-- Link => git@github.com:PLP-WebTechnologies/safaricom-hook-introduction-to-html-week-1-Machuge27.git -->

# Got a link to a remote repo and i need to push a file from my computer

Sure! Follow these steps:

### 1. **Clone the Repository (if not done already)**  
```bash
git clone <remote-repo-link>
cd <repo-name>
```

### 2. **Add Your File**  
Copy the file you want to push into the repository folder.

### 3. **Stage the File**  
Run:  
```bash
git add <file-name>
```

### 4. **Commit Your Changes**  
```bash
git commit -m "Add <file-name>"
```

### 5. **Push to Remote**  
```bash
git push origin <branch-name>
```

**Note:** Replace `<branch-name>` with the branch you're working on (usually `main` or `master`).

Done!

# Without cloning

Yes, it can be done without cloning by creating the file in a temporary directory. Here’s how:

### Steps:

1. **Initialize a Temporary Git Repo**  
   ```bash
   mkdir temp-repo
   cd temp-repo
   git init
   ```

2. **Add the Remote Repo**  
   ```bash
   git remote add origin <remote-repo-link>
   ```

3. **Create or Copy the File**  
   Add the file to this directory.

4. **Stage and Commit the File**  
   ```bash
   git add <file-name>
   git commit -m "Add <file-name>"
   ```

5. **Push to Remote Repo**  
   ```bash
   git push origin <branch-name>
   ```

6. **Cleanup**  
   Delete the `temp-repo` directory after pushing:  
   ```bash
   cd ..
   rm -rf temp-repo
   ``` 

This avoids cloning the full repository.


-- -
$ git push
fatal: The current branch master has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin master

To have this happen automatically for branches without a tracking
upstream, see 'push.autoSetupRemote' in 'git help config'.

This happens because your local branch isn't linked to the remote branch. Use the suggested command:

```bash
git push --set-upstream origin master
```

This will:
- Push your branch to the remote.
- Set the remote branch as the upstream for future `git push` or `git pull` commands.

Alternatively, you can enable auto-setup for all branches:
```bash
git config --global push.autoSetupRemote always
``` 

This will automatically link branches to the remote when you push them for the first time.

## Downloadings a specific folder from a repository

To download a **specific file** from a GitHub repository (or similar platforms like GitLab/Bitbucket) without cloning the entire repo, here are the easiest methods:

---

### **1. Using the GitHub Web Interface** (Simplest)
1. Go to the repository (e.g., `github.com/username/repo`).
2. Navigate to the specific file you want (e.g., `src/file.txt`).
3. Click the file to open it.
4. Click the **"Raw"** button (top-right) to view the raw content.
5. **Right-click** the page and select **"Save As"** to download the file.

---

### **2. Using `git` (Sparse Checkout)**  
If you want to download a single file/folder **without cloning the entire repo**:
```bash
# Initialize a new empty repo
mkdir temp-dir && cd temp-dir
git init

# Enable sparse checkout
git config core.sparseCheckout true

# Specify the file/folder to download (e.g., "src/file.txt")
echo "src/file.txt" >> .git/info/sparse-checkout

# Link the remote repo
git remote add origin https://github.com/username/repo.git

# Pull only the specified file
git pull origin main  # Replace "main" with the branch name
```

![alt](./python_pracs/images/cloning%20specific%20folder.jpg)

---

### **3. Using `wget` or `curl`**  
For public repositories, you can directly download the raw file via its URL:
```bash
# Replace with the raw file URL (use the "Raw" button to get the link)
wget https://raw.githubusercontent.com/username/repo/main/path/to/file.txt

# Or using curl
curl -O https://raw.githubusercontent.com/username/repo/main/path/to/file.txt
```

---

### **4. Using GitHub CLI (`gh`)**  
If you have the [GitHub CLI](https://cli.github.com/) installed:
```bash
gh repo view username/repo --files  # List files
gh repo download username/repo --pattern "path/to/file.txt"
```

---

### **5. Third-Party Tools**  
- **DownGit**: Visit [https://minhaskamal.github.io/DownGit](https://minhaskamal.github.io/DownGit), paste the file’s GitHub URL, and download it.
- **GitZip**: Browser extensions like [GitZip](https://chrome.google.com/webstore/detail/gitzip-for-github/ffabmkklhbepgcgfonabamgnfafbdlkn) let you download individual files/folders.

---

### **Notes**:
- For **private repositories**, you’ll need to authenticate (e.g., via `git` with a personal access token or SSH key).
- Replace `username`, `repo`, `main`, and file paths with your actual values.