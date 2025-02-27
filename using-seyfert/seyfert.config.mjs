import { config } from "seyfert";

export default config.bot({
    token: process.env.BOT_TOKEN ?? "",
    locations: {
        base: "src", // replace with "src" if using bun
    },
    intents: ["Guilds"],
    // This configuration is optional, in case you want to receive interactions via HTTP
    // This allows you to use both the gateway and the HTTP webhook
    publicKey: "dcfef5a9bf8af8d40829217c5a4b9e0359ae58f4f8dc144f062e74aa13e5f7c5", // replace with your public key
    port: 5000, // replace with your application's port
});