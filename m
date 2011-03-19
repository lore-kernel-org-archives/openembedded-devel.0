Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q0kcJ-0007Th-5w for openembedded-devel@lists.openembedded.org;
	Sat, 19 Mar 2011 02:06:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2J14M88015590
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 01:04:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15243-06 for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 01:04:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2J14GV7015584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 01:04:16 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300443329.9054.53.camel@phil-desktop>
References: <20110311081950.GG7353@excalibur.local>
	<1300385432.2298.33.camel@saphir> <1300396447.30423.2113.camel@rex>
	<AANLkTi=9DUeh3eyaW=fQciA_Qk51yvqbBP_792n8fwQD@mail.gmail.com>
	<1300443329.9054.53.camel@phil-desktop>
Date: Sat, 19 Mar 2011 01:03:58 +0000
Message-ID: <1300496638.30423.2249.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: OE Bugzilla Future
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
X-List-Received-Date: Sat, 19 Mar 2011 01:06:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-03-18 at 10:15 +0000, Phil Blundell wrote:
> On Fri, 2011-03-18 at 08:57 +0100, Frans Meulenbroeks wrote:
> > 2011/3/17 Richard Purdie <richard.purdie@linuxfoundation.org>:
> > > On Thu, 2011-03-17 at 19:10 +0100, Michael 'Mickey' Lauer wrote:
> > >> I'm in favor of keeping it, cleaning it up, and improve
> > >> the integration with patchwork / git. Throwing it away
> > >> would be a very bad sign to all those countless people
> > >> who've gone through the pains of actually working with
> > >> the bugtracker.
> > >
> > > The simple question is who is actually going to sort out the mess its
> > > in?
> > >
> > > Who is going to look after it on a continuing basis?
> > >
> > > If there isn't ownership, nothing is going to change.
> > 
> > Actually I feel the real problem is that:
> > - people did not want to get bugs assigned to them (at least that was
> > what someone told me in the past)
> > - we're lacking a good notion of package or recipe ownership, so even
> > if we had someone acting as a bug manager, (s)he would have a hard
> > time to find out who to assign an issue to.
> 
> Yes, agreed.  A few people have tried in the past to take responsibility
> for bugzilla itself (in infrastructure terms) and I would be happy
> enough to do that for the future.  But it clearly is not reasonable to
> expect the Bugzilla maintainer(s) to be personally responsible for
> fixing every bug that gets reported.

This is the key question. Who is responsible for fixing bugs?

The recipe's original author?
The maintainer?
The reporter?
The bugzilla maintainer?
The TSC?

The answer in general is whoever has time and an interest in it and none
of the above.

> As you say, the real issue here seems to be that someone (presumably the
> TSC) needs to determine the workflow that OE is going to use and then
> convince the developers to stick to it.

Here lies the problem. All OE's developers are effectively volunteers.
We have no means to convince developers to stick to anything. Volunteer
developers have a tendency to rebel as soon as it even remotely looks
like someone might "force" them to do something :).

I put the smile in as I don't mean this in a bad way but I do think we
need to understand that few people have the time to dive into other
people's problems. This is the underlying issue and I don't think
anything has changed for OE. I don't think there is anything magic the
TSC can do either.

Yocto has different dynamics and I think those could be useful for some
of this and can help improve things for the better but its never a free
for all. Yocto has, can and will look at certain bugs but the scope
needs to be constrained, certainly to OE-Core.

Cheers,

Richard





