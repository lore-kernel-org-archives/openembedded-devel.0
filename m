Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KIh6w-0006dV-Ur
	for openembedded-devel@openembedded.org; Tue, 15 Jul 2008 11:46:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6F9jjI5017076
	for <openembedded-devel@openembedded.org>;
	Tue, 15 Jul 2008 10:45:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16920-03 for <openembedded-devel@openembedded.org>;
	Tue, 15 Jul 2008 10:45:31 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6F9jJPK017038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 15 Jul 2008 10:45:19 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <g5gn7j$es4$2@ger.gmane.org>
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<g5fge0$e5$1@ger.gmane.org> <g5g7io$mu3$1@ger.gmane.org>
	<g5gn7j$es4$2@ger.gmane.org>
Date: Tue, 15 Jul 2008 10:45:18 +0100
Message-Id: <1216115118.5345.30.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Core team (was: Switching SCM to git and commit/review	policy)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 15 Jul 2008 09:46:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-07-15 at 01:24 +0200, Rolf Leggewie wrote:
> Well, after this dragged on for well over half a year now and things got
> stalled several times this was not the kind of response I was expecting.
>  But I'll gladly pick up the ball you passed here to ask a more general
> question or raise a more general concern I've been having lately.

Several of us feel bad that this has dragged on. There are various
reasons for that with no one thing or person being responsible. We were
kind of hoping the OE e.V. would solve some of the problems but whilst
that is moving forwards its not going to happen soon enough so we're
trying to move the SCM issue forwards without it. There are also large
time pressures on the people involved. Personally, I know I'm at risk of
totally cracking up if I try and do too much at once so I'm moving
slowly. I'd prefer to do that than totally burn out, sorry ;-).

> Quite frankly, as of late, when it comes to OE governance, I've been
> uneasy a lot.  For one, there's this ominous group of OE core that does
> a lot of things behind closed doors.

Firstly, there isn't that much discussion "behind closed doors". Some
discussion did happen there simply because we couldn't reach a consensus
on the -devel mailing list but there has been much less that you
probably think, see the time issues mentioned above.

The results of that discussion have been made clear - we want to switch
to git, that is unanimous. The question is what kind of commit policy
goes with the change. Even reaching that much of a decision is a major
step forwards but we need to finish things off.

> It is not completely clear when
> and why it was established, why the communication is not open, who is a
> member and how it relates to ordinary members of the community.  Is OE
> still an open project?  Is anybody outside core just a little-valued
> monkey from which we gladly take code but leave out of any kind of
> steering decision?

For the record, as I understand it, the OE core team consists of:

 - Holger Freyther
 - Marcin Juszkiewicz
 - Koen Kooi
 - Richard Purdie
 - Dr. Michael Lauer
 - Graeme Gregory
 - Philip Balister

Why was this established and when? Good questions. When, I'm not sure
about, the above group of people are long standing devs who've tried to
guide the project at various times. Bar the last two people that group
of people have been guiding the project for several years. The last two
people were "invited" more recently to try and add more opinions and
remove any claims of bias.

Why? The problem is how does OE make a decision? The above group has
tried to guide the project a bit and put some kind of organisation and
decicion making process in place. The plan is to hand over to the e.V.
and maybe elect a core team properly once we're in a position to do so.
We're not trying to grab power, steal the project or do anything else
"evil", we just want to move OE forwards and try and resolve some
ongoing problematic issues.

> Is OE still an open project? 

Yes. No decisions have been made without discussion on the -devel
mailing list.

> Is anybody outside core just a little-valued
> monkey from which we gladly take code but leave out of any kind of
> steering decision?

See above. Nobody is under valued and we do try to listen to all view
points. The main reason the core team exists is to give some method of
actually making a final decision.

Personally, in time I expect the core team to be replaced with something
elected by the e.V. with clear policies on what its responsible for.
This stuff does take time though...

Cheers,

Richard





