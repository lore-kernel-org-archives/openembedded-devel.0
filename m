Received: from [216.145.245.198] (helo=mx02.dls.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mwester@dls.net>) id 1JFWNW-0003Ec-Le
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2008 16:10:03 +0100
Received: from gw.mwester.net ([209.242.5.110] helo=midnight)
	by mx02.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JFWNS-0002MY-Je
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2008 09:09:59 -0600
Message-ID: <00d201c8591b$02e350e0$6f01a8c0@mwester.net>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <E1JF7vM-0000k1-Mc@linuxtogo.org>	<413710907.20080117131841@gmail.com>	<478F4876.9030405@student.utwente.nl><1012527691.20080117145250@gmail.com>
	<fmnp24$rob$1@ger.gmane.org>
Date: Thu, 17 Jan 2008 09:09:52 -0600
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.3138
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3198
Subject: Re: [oe-commits] org.oe.dev apm: turn off wifi cards before suspend so they are fully reloaded upon resume. closes 3664.
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
X-List-Received-Date: Thu, 17 Jan 2008 15:10:14 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

"Rolf Leggewie" <no2spam@nospam.arcornews.de> writes:
[snip]
> that someone comes around who had previously been quiet on this and then
> calls my work a "mess" and generally finds very unappreciative words for
> what I've done and the time I've spent.
>
> Mickey's comment
>
> # I agree. The issue to fix is worthwile, but I would prefer seperate
> # packaging as well.
>
> sounds quite different, don't you agree?  FOSS is an incremental process.
>
> I am willing to get this not only right for me, but to everyone's
> satisfaction.  But I kindly want to ask you to consider that it is not
> only what you say but also how you say it.
>
> PS: I don't intend to and hope I did not start another flame war, but
> this is important to me.

Actually, this is important to me as well.  I've deliberately distanced 
myself from these discussions on the mailing lists, but I've also withheld a 
number of commits for *EXACTLY* the reasons pointed out by Rolf.

My last commit was the famous 2.6.23 ixp4xx kernel recipe - I'm quite 
certain everyone remembers that.  It too turned into what I've been seeing 
lately on this list (and on the angstrom list).  Mickey's comment on this 
thread is the sort of helpful, constructive criticism that will result in 
people becoming better OE developers.  The comments by some others, however, 
are the sort of comments that just result in me maintaining my own personal 
set of changes to OE -- it's just easier on my blood-pressure to deal with 
my own private overlay than to endure the guantlet of hyper-critical, 
condescending, superiority-laden emails that have characterized some of the 
past responses to my (and other's) commits.

I doubt that my contributions are of particular interest to the general 
population, but I hardly suspect that I'm alone in this -- which makes it 
rather probable that OE is missing some other, really valuable, 
contributions from those who have just "walked away" because they fear their 
bitbake recipes do not meet the level of god-like perfection demanded by a 
certain small-but-very-vocal group of developers.

C'mon folks -- teach me.  Don't beat me.


JMO.  That and 10 USD will get you a cup of coffee.

Mike (mwester)



