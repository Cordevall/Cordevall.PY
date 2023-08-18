import discord
from discord.ext import commands
from pyfiglet import figlet_format
from termcolor import colored

intents = discord.Intents.default()
bot = commands.Bot(command_prefix='!', intents=intents)

@bot.event
async def on_ready():
    # Generate ASCII art
    ascii_art = figlet_format("Discord bot Is Online")
    # Print it in color
    print(colored(ascii_art, 'blue'))

@bot.command()
async def botinfo(ctx):
    await ctx.send('Bot Is Made By Eveeify')

# Read the token from the .env file
with open('.env', 'r') as file:
    token = file.read().strip("token")

bot.run(token)