Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <Patrick.Ohly@gmx.de>) id 1H3fnn-0006Tu-LW
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jan 2007 22:43:39 +0100
Received: (qmail invoked by alias); 07 Jan 2007 21:42:05 -0000
Received: from c-134-228-76.d.dsl.de.ignite.net (EHLO ip6-localhost)
	[62.134.228.76]
	by mail.gmx.net (mp046) with SMTP; 07 Jan 2007 22:42:05 +0100
X-Authenticated: #489940
Received: from patrick by ip6-localhost with local (Exim 3.36 #1 (Debian))
	id 1H3fl5-0004xX-00; Sun, 07 Jan 2007 22:40:51 +0100
From: Patrick Ohly <Patrick.Ohly@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1662139633.20070107231632@gmail.com>
References: <20061230051641.GA30225@hezmatt.org>
	<1167506369.5626.46.camel@localhost.localdomain>
	<20061230214326.GE15188@hezmatt.org>
	<4596E33D.306@dominion.kabel.utwente.nl>
	<20061230235938.GC16490@hezmatt.org>
	<1167523571.5626.59.camel@localhost.localdomain>
	<459786C7.70000@dominion.kabel.utwente.nl>
	<1168200264.15021.54.camel@ip6-localhost>
	<1662139633.20070107231632@gmail.com>
Date: Sun, 07 Jan 2007 22:40:50 +0100
Message-Id: <1168206051.18289.14.camel@ip6-localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
Sender: Patrick Ohly <patrick@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: A question of workflow
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Jan 2007 21:43:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On So, 2007-01-07 at 23:16 +0200, Paul Sokolovsky wrote:
> Hello Patrick,
> > What do you think? Did I miss something?
> 
>   Well, why would OE core developers (err, what about non-core
> developers - we also care for contributed patches - after all, to get
> commit access to OE, you first contribute bunch of patches) - well, why
> would they do that?

Perhaps because they care enough about external contributions to make
life easier for the people preparing patches? The fact that their own
changes would also be tracked by monotone is probably less important.

I'm aware that this is not something that can be requested from
volunteers, but at least it can be suggested and perhaps someone will
find it useful and (more important) doable.

> Just in case, there's always another alternative - contributors
> just should submit patches in the perfect form, suitable for merging w/o
> tweaks.

I'm not so sure that this will work - As Koen said, having to tweak a
patch is the rule, not the exception. Just doing those tweaks instead of
striving for perfect patches might be less work also for the core
developers.

>  Obviously, it's just the same not attainable, nor it's really
> *that* important - we want people contribute more than either us or them
> to follow strict rules.

Of course, these shouldn't be strict rules, but having some guidelines
wouldn't hurt either. I think I have seen questions about "how to
contribute patches" several times on this list already.

-- 
Bye, Patrick Ohly
--  
Patrick.Ohly@gmx.de
http://www.estamos.de/


