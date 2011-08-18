Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Qu3LK-0004jE-AU
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 16:13:10 +0200
Received: (qmail 27624 invoked by uid 1003); 18 Aug 2011 14:08:29 -0000
Received: from unknown (HELO ?172.17.171.238?)
	(philip@opensdr.com@206.191.100.2)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	18 Aug 2011 14:08:29 -0000
Message-ID: <4E4D1CDC.4040508@balister.org>
Date: Thu, 18 Aug 2011 07:08:28 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110621 Fedora/3.1.11-1.fc14 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1f806520f152cbda2bc4aa7cbfde0dbfea7dc9b7.1313655444.git.Martin.Jansa@gmail.com>	<30fb538629c6a307b0e574028a11ae196e8a791f.1313655444.git.Martin.Jansa@gmail.com>	<1313656223.4016.12.camel@mattotaupa>	<20110818083723.GA6465@jama.jama.net>	<1313657121.4016.21.camel@mattotaupa>
	<4E4CF908.5080107@eukrea.com>	<4E4D1663.7060703@balister.org>
	<20110818134718.GD6465@jama.jama.net>
In-Reply-To: <20110818134718.GD6465@jama.jama.net>
Subject: Re: [meta-efl][PATCH 2/2] e-wm: remove SHR specific patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Aug 2011 14:13:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 08/18/2011 06:47 AM, Martin Jansa wrote:
> On Thu, Aug 18, 2011 at 06:40:51AM -0700, Philip Balister wrote:
>> On 08/18/2011 04:35 AM, Eric Bénard wrote:
>>> Hi Paul,
>>>
>>> Le 18/08/2011 10:45, Paul Menzel a écrit :
>>>> Thank you for the explanation. So to find out if some distribution or
>>>> machine adapts something I might find interesting I need to look in all
>>>> layer (repositories) to find it instead of looking in one recipe.
>>>
>>> yes, that's one of the "benefits" of using the new OE ...
>>
>> On the other hand, if a distro or machine adapts something in a way you
>> do not like, it does not impact you.
>
> well if they adapted it with machine/distro override then it didn't
> impact you too unless you were using that distro or that machine..
>
> now you'll have the same override if you're using that distro because
> you'll have their meta-distro and the same with machine and its
> meta-bsp.

Remind me not to reply to email until after the coffee takes effect.

Philip


