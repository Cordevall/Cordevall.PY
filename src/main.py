import os
import discord
from discord.ext import commands
from pyfiglet import figlet_format
from termcolor import colored
from dotenv import load_dotenv

bot = commands.Bot(command_prefix="!", intents=discord.Intents.all())


class Client(commands.Bot):
    def __init__(self):
        super().__init__(command_prefix=".", intents=discord.Intents.all())
        self.cogslist = ["cog1"]

        async def on_ready(self):
            print(" Logged in as " + self.user.name)
            synced = await self.tree.sync()

        async def setup_hook(self):
            for ext in self.cogslist:
                await self.load_extension("Cogs." + ext)


client = Client()

# Read the token from the .env file
load_dotenv()
token = os.getenv("token")

client.run(token)
