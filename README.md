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

### valid_known_packs.json

`valid_known_packs.json` is a JSON file that contains all "legal" packs to be used on the server. The data is stored as pack objects inside of an array with the first array item being the format object. The pack object only has one attribute which is the `file_version`. This is set to "2" because of the file-structure MOJANG is using right now. All objects after the format object are pack objects. These have four attributes:

- `file_system` is the filesystem type of the server's local filesystem.
- `path` is the additive path of the resource or behaviour pack relation to the `bedrock_server.exe` file.
- `uuid` is the universally-unique identifier of the resource or behaviour pack. This is used for duplicate and overide checks.
- `version` is the minimum supported minecraft version for the pack. For example a pack designed for 1.12 will run in 1.17, but not 1.9.

Behavour packs are always enabled for everyone, but resource pack application is optional for each client. If you want all clients to use the same texture-packs and disable thier own, the `texturepack-required` proprety in `server.propreties` must be set to "true" for all clients to see these textures. If a pack is not defined correctly, it will be interpereted as the vanilla resources and behaviours.

### whitelist.json
`whitelist.json` is a JSON file that contains account details of players that are "allowed" to connect to the server. The data is stored as player objects inside of an array. Each player object has three attributes:

- `ignoresPlayerLimit` which determines if this player object should ignore the player cap when connecting to the server. (Aloud values: "true" or "false")
- `name` which is the Xbox Live gamertag of the player who shall be aloud to connect to the server. (Aloud values: any string)
- `xuid` which is the Xbox Live account XUID of the player who shall be aloud to connect to the server. (Aloud values: any string)

If a gamertag or XUID, is not found within the whitelist, the acount will not be aloud to connect to the server. Note that the whitelist will only be functional if `online-mode` and `white-list` propreties are set to true in the `server.propreties` file.

# NOTE THIS DOCUMENTATION IS NOT COMPLETE
