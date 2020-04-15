import discord
from discord.ext import commands
import random
from discord import Webhook, AsyncWebhookAdapter
import aiohttp



bot = commands.Bot(command_prefix='!')


@bot.event
async def on_ready():
    print('Bot booted up!')
    print('logged in as')
    print('{0.user}'.format(bot))
    print('_________')

@bot.command()
async def communism(ctx):
    await ctx.send('https://www.youtube.com/watch?v=PdYLRTGmQ3c')

@bot.command()
async def add(ctx, first: int, second: int):
    await ctx.send(first+secound)


@bot.command()
async def roll(ctx, dice: str):

    try:
        rolls, limit = map(int, dice.split('d'))
    except Exception:
        await ctx.send('Format has to be in NdN!')
        return

    result = ' '.join(str(random.randint(1, limit)) for r in range(rolls))
    await ctx.send(result)

@bot.command()
async def arsch(ctx):
    await ctx.send('selber.')

@bot.command()
async def choose(ctx, *choices: str):
    await ctx.send(random.choice(choices))

@bot.command(name='8ball',
             pass_context = True)
async def eight_ball(ctx):
    possible_responses = [

        'No',
        'Yes',
        'Too hard to tell',
        'It is quiet possible',
        'Definitely',
        'That is a resounding no',
    ]
    await ctx.send(random.choice(possible_responses))

@bot.command(name='hardbass',
             pass_context = True)
async def hardbass(ctx):
    possible_response = [

        'https://www.youtube.com/watch?v=y90yaLFoYoA',
        'https://www.youtube.com/watch?v=QiFBgtgUtfw',
        'https://www.youtube.com/watch?v=byMXyw7c3lM',
        'https://www.youtube.com/watch?v=VLW1ieY4Izw',
    ]
    await ctx.send(random.choice(possible_response))

@bot.command()
async def motherrussia(ctx):
    await ctx.send('https://www.youtube.com/watch?v=AyDi8kI9gp0')

@bot.command()
async def commands(ctx):
    await ctx.send('**List of all avaliabe commands:** \n \n *!commands* - shows a list of all commands \n \n *!communism* - A good bed time story for kids and adults! \n \n *!roll* - rolls a dice in NdN Format \n \n *!choose* - Putin uses an illegal algorithm based on alcohol to make a decision for you \n \n *!8ball* - Baba Wanga tells you the future \n \n *!hardbass* - nothing is better than good old hardbass. Not even Rachmaninoff. \n \n *!motherrussia* - Russia is cold, but it can be so much more, go on and see! \n \n *!how2* - Here you can get a quick example of how to use certain commands. \n \n *!anthem* - The best song you can possible hear.')

@bot.command()
async def how2(ctx, arg):
    if arg == 'roll':
        await ctx.send('```!roll 1d20```')
    elif arg == 'choose':
        await ctx.send('```!choose test test1 test2 test3```')
    elif arg == '8ball':
        await ctx.send('```!8ball is russia great?```')
    elif arg == ' ':
        await ctx.send('No command defined. Use ```!how2 <command>``` instead.')
    else:
        await ctx.send('you do not need help with this one, do you?')

@bot.command()
async def slavsquad(ctx):

    possible_pics = [

     'https://imgur.com/P0wA4pF',
     'https://imgur.com/a/esswbjE',
     'https://imgur.com/a/kQudTqG',
     'https://imgur.com/LDp2r2P',
     'https://imgur.com/Pit7qL9',
     'https://imgur.com/ORyM3Z6',
     ]
    await ctx.send(random.choice(possible_pics))

@bot.command()
async def anthem(ctx):
    await ctx.send('https://www.youtube.com/watch?v=U06jlgpMtQs')

@bot.command()
async def putin():

    choosingvars = [

        'It is unbelivable, but it is true! Alaska was sold to the US back in year 1867 for just 7.2mio$!',
        ''






    ]


    await ctx.send(random.choice(choosingvars))





bot.run('NDYxNDYwODYwNTY5NzgwMjI1.DnVKNA.tQbGf6lZcf7H-VJdvbYiHO4iQ_Q')
