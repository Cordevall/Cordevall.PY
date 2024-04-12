import discord
import os
from dotenv import load_dotenv
from discord import Embed

load_dotenv()


class Client(discord.Client):
    async def on_ready(self):
        print(f"Logged on as {self.user}!")
        # Fetch the channel by its ID
        logs_channel = self.get_channel(int(os.getenv("logsID")))
        if logs_channel:
            # Create an embed message
            embed = Embed(
                title="Bot Status", description=f"{self.user} is ready", color=0x00FF00
            )
            # Send the embed message to the logs channel
            await logs_channel.send(embed=embed)
        else:
            print("Logs channel not found")


intents = discord.Intents.default()
intents.message_content = True

client = Client(intents=intents)

# Run the bot
client.run(os.getenv("token"))
