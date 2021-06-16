## What is this repository?
This repository contains config files from a private Minecraft C++ (MCPE) server. If you are a member of this server feel free to contribute to this repository.

---

## How do I contribute
Please read the `CONTRIBUTING.md` file in the root directory for more information reguarding this.

---

## I don't understand this!
Don't worry! These files do not require that you have any programming experience, thier just in JSON and PLAINTEXT for data storage. Also I'll explain them bellow. (I am assuming you understand how minecraft works for this explanation).

### server.propreties
server.propreties contains the propreties of the server (hence the name). To change the value of a proprety, change the value after the equals sign. For example `server-name=Server-Name` could be changed to `server-name=Different-Server-Name`. Here are all of the propreties and thier meanings bellow. 

- `server-name` is the name of the server in the servers menu (Allowed values: Any string without semicolon symbol.)
- `gamemode` is the default gamemode of the server. (Allowed values: "survival", "creative", or "adventure")
- `difficulty` is the game difficulty. (Allowed values: "peaceful", "easy", "normal", or "hard")
- `allow-cheats` allows command-line usage for server admin only. (Allowed values: "true" or "false")
- `max-players` is the maximum number of players aloud on the server at a given time. This will exclude players with the "ignoresplayerlimit" parameter set to true in the `whitelist.json` file. Only admin will have this parameter set to true. (Allowed values: Any positive integer)
- `online-mode` is a boolean parameter that must be set to "true" for the whitelist functionality to work. Players must be authenticated through thier Xbox Live accounts. (Allowed values: "true" or "false")
- `white-list` determines weather or not the server will be avalible to everyone on the internet, or privatly to the Xbox Live accounts specified in the `whitelist.json` file. Allowed values: "true" or "false"
- `server-port` is the port that the server should listen to. Changing this will from the default "19132" may require a firewall reconfiguration. (Allowed values: Integers in the range [1, 65535])
- `view-distance` is the server's maximum render distance. Rendering more chunks requires more resources and thus, may cause lag. (Allowed values: Positive integer equal to 5 or greater)
- `tick-distance` is the server's maximum simulation distance. Simulating more chunks requires more resources and thus, may cause lag. (Allowed values: Integers in the range [4, 12])
- `player-idle-timeout` is the amount of time (in minutes) a player must be AFK before automaticly being kicked by the server. (Allowed values: Any non-negative integer. If set to "0". the player may AFK indefinitly)
- `max-threads` is the maximum number of theads that the server is aloud to use. (Allowed values: Any positive integer. If set to "0", the server will use as many threads as possible)
- `level-name` is the name of the local savegame stored on the server. This must not change after world creation unless the world directory is edited. (Allowed values: Any string without semicolon symbol or symbols illegal for file name: /\n\r\t\f`?*\\<>|\":)
- `level-seed` is the seed for the world generator. Changing this after the world is generated may cause world coruption. (Allowed values: Any string)
- `default-player-permission` is the default permissions for new players. (Allowed values: "visitor", "member", "operator")
- `texturepack-required` is a boolean that when set to true, can be used to enforce use of "legal" resource packs. If set to false the client may use whatever resource pack they want. (Allowed values: "true" or "false")
- `content-log-file-enabled` enables logging of content errors to a file on the servers local file system. (Allowed values: "true" or "false")
- `compression-threshold` determines the smallest size of raw network payload to compress. (Allowed values: 0-65535)
- `server-authoritative-movement` allows the server to replay any clients' movement and provide corrections before sending movement packets back to other clients. See MOJANG's official documentation for more information on this in-depth subject. (Allowed values: "client-auth", "server-auth", "server-auth-with-rewind")
- `player-movement-score-threshold` is the number of incongruent time intervals needed before abnormal behavior is reported. Can be disabled by `server-authoritative-movement`.
- `player-movement-duration-threshold-in-ms` is the duration of time the server and client positions can be out of sync (as defined by player-movement-distance-threshold) before the abnormal movement score is incremented. This value is defined in milliseconds. Can be disabled by `server-authoritative-movement`.
- `correct-player-movement` will determine the client position will get corrected to the server position if the movement score exceeds the threshold. (Aloud values: "true" or "false")
- `server-authoritative-block-breaking` determines if the server will compute block mining operations in sync with the client so it can verify that the client should be able to break blocks when it thinks it can. (Aloud values: "true" or "false")

# NOTE THIS DOCUMENTATION IS NOT COMPLETE
