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