# ConPar: Conditional Particle Suppressor (Fabric / Quilt)

![ConPar Icon](conpar-icon.png)

**ConPar** is a smart performance mod for Fabric and Quilt mod loaders. It automatically and conditionally suppresses non-essential particles based on your system's performance and player combat status, ensuring stable FPS during critical moments.

## ✨ Key Features

* **FPS-Driven Suppression:** Particles are automatically suppressed if your FPS drops below a set threshold (Default: 50 FPS).
* **Critical Combat Mode:** Particle suppression activates when player health is low (Default: 10 health points / 5 hearts) to boost performance during intense fights.
* **Manual Toggle (Keybind):** You can manually switch the suppression function ON or OFF by pressing the **`K`** key (Default keybind).

---

## 🚀 Installation for Players

1.  Ensure you have either the **Fabric** or **Quilt** mod loader installed for your target Minecraft version.
2.  Download the **`ConParMod-X.X.X.jar`** file from the Modrinth or CurseForge page.
3.  Place the file into your game's **`mods`** folder.

## 🛠️ Building the Mod (For Developers)

As **ConPar** is an open-source project (MIT licensed), you can build the `.jar` file directly from the source code.

### Prerequisites:

* **Java Development Kit (JDK) 17** or newer.
* **Git** (to clone the repository).

### Build Steps:

1.  **Clone the project:**
    ```bash
    git clone [Insert your GitHub Repository Link here]
    cd conpar
    ```

2.  **Run the Gradle Build:**
    ```bash
    # On Windows
    ./gradlew build

    # On Linux/macOS
    chmod +x gradlew
    ./gradlew build
    ```

3.  **Find the Result:** The final mod file (`conpar-x.x.x.jar`) will be located in the `build/libs/` folder.

---

## 📜 Licensing

This project is licensed under the **MIT License**. You are free to use, modify, and distribute the code as described in the [LICENSE.txt] file.

© [2025] [dabdob_craft]
