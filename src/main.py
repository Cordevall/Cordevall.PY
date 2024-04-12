import discord
import os
from dotenv import load_dotenv
from discord.ext import commands

load_dotenv()
bot = commands.Bot(command_prefix="!", intents=discord.Intents().all())


# Define a command that responds to "hello" with "world"
@bot.hybrid_command()
async def hello(ctx):
    """Says world"""
    await ctx.send("world")


# Run the bot
bot.run(os.getenv("token"))
