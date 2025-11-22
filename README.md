
# Getting Started with RISC-V on GitHub Codespaces

Follow the steps below to set up and run programs in your own Codespace.


---

## Step 1. Open the Repository

Go to:  
https://github.com/vsdip/vsd-riscv2


---

## Step 2. Create a Codespace

1. Log in with your GitHub account.
2. Click the green **Code** button.
3. Select **Open with Codespaces** → **New codespace**.
4. Wait while the environment builds. (First time may take 10–15 minutes.)


---

## Step 3. Verify the Setup

In the terminal that opens, type:

```

riscv64-unknown-elf-gcc --version
spike --version
iverilog -V

```

You should see version information for each tool.


---

## Step 4. Run Your First Program

1. Go to the `samples` folder.

2. Compile:

```

riscv64-unknown-elf-gcc -o sum1ton.o sum1ton.c

```

3. Run using Spike:

```

spike pk sum1ton.o

```

Expected output:

```

Sum from 1 to 9 is 45

````


---

## Step 5. Next Steps

* Try editing the C programs.
* Try creating your own C programs.
* You can also try Verilog programs using `iverilog`.



---

# GUI Desktop + RISC-V Flow using noVNC (Advanced)

Below steps help you work inside a full Linux GUI desktop inside Codespaces

---

## Step 6. Launch the noVNC Desktop

1. Open the **PORTS** tab in Codespaces  
2. Look for **noVNC Desktop (6080)**  
3. Click the link under **Forwarded Address**

   ![port forward](images/port_forward.png)

4. Click on **vnc_lite.html** when the browser tab opens

   ![vnc dir](images/vnc_dir.png)

5. The Linux Desktop will open

   ![desktop](images/desktop.png)


---

## Step 7. Open Terminal inside Desktop

1. Right-click anywhere on Desktop  
2. Click **Open Terminal Here**

   ![open terminal](images/open_terminal.png)


---

## Step 8. Navigate to Samples Folder

Inside the terminal:

```bash
cd /workspaces/vsd-riscv2
cd samples
ls -ltr
````

Expected:

![samples](images/samples.png)

---

## Step 9. Compile Using Native GCC (x86)

```bash
gcc sum1ton.c
./a.out
```

Expected output:

```
Sum from 1 to 9 is 45
```

![native run](images/native.png)

---

## Step 10. Compile Using RISC-V GCC & Run with Spike

```bash
riscv64-unknown-elf-gcc -o sum1ton.o sum1ton.c
spike pk sum1ton.o
```

Expected:

![spike run](images/spike.png)

---

## Step 11. Modify Code Using GUI Editor

Open editor:

```bash
gedit sum1ton.c &
```

![gedit](images/gedit.png)

Then re-compile & run again:

```bash
riscv64-unknown-elf-gcc -o sum1ton.o sum1ton.c
spike pk sum1ton.o
```

---

# You Are Now Ready 🎯

You now know how to:

✔ open GUI desktop
✔ open terminal
✔ compile using gcc
✔ compile using riscv-gcc
✔ run on Spike
✔ edit using GUI editor

You are ready to explore further 🚀

```

