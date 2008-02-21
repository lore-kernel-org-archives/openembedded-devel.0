Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JSA8l-0000Mg-DF
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2008 13:03:06 +0100
Received: by fg-out-1718.google.com with SMTP id 13so22886fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2008 04:02:57 -0800 (PST)
Received: by 10.82.114.3 with SMTP id m3mr16748786buc.2.1203595376852;
	Thu, 21 Feb 2008 04:02:56 -0800 (PST)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id z33sm1116706ikz.0.2008.02.21.04.02.54
	(version=SSLv3 cipher=OTHER); Thu, 21 Feb 2008 04:02:55 -0800 (PST)
Date: Thu, 21 Feb 2008 14:04:39 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080221140439.2612fffe@widy.localdomain>
In-Reply-To: <fpjle1$p10$1@ger.gmane.org>
References: <E1JRbhB-0000nu-DN@linuxtogo.org>
	<20080220015817.1e33f547@widy.localdomain>
	<20080220020418.1e4dda5a@widy.localdomain>
	<1203502545.6860.13.camel@hammer.suse.cz>
	<20080220155339.67aed5d4@widy.localdomain>
	<fphs3l$jcj$1@ger.gmane.org>
	<20080220212639.6e24e7ab@widy.localdomain>
	<fpjle1$p10$1@ger.gmane.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 72.14.220.158
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: no2spam@nospam.arcornews.de
Subject: Re: what is a fixed bug?
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
X-List-Received-Date: Thu, 21 Feb 2008 12:03:06 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Thu, 21 Feb 2008 11:57:06 +0100
Rolf Leggewie <no2spam@nospam.arcornews.de> wrote:

> Junqian Gordon Xu wrote:
> > I prefer this approach to opening a separate dup ticket.
> 
> This will and has led to problems in that some A* dev has in the past
> repeatedly closed valid bugs as invalid because his interpration was
> "not an A* RC bug".  The bug of course was a perfectly valid one, if
> not for A* (they are free to choose) it was for OE.

That was at the time when there was no bug overlord for OE. Otherwise,
I'm personally pretty happy to just not include fishy bugs into
Angstrom Release set, as someone else has better plan of what to do
with those fishy bugs except closing.

> Furthermore, I don't see why my already long list of open bugs shall
> be made any longer (I have a search function defined in bugzilla)
> without merit.  

One good way to not make list of open bug longer than needed is to
close out invalid bugs. Criteria of invalidness varies though.

> Essentially, Angstrom is demanding that only they can
> close bugs because how is anyone to know whether A* intends to push a
> fix into stable?  

Communication, communication. Also, Angstrom is a one-word moniker for
"QAed and stable subset of OE", so it's not that bad as you trying it
to put.

> This aggressive behaviour of Angstrom is
> essentially what I mean by "usurpation of bugs.oe.net".  Why should
> the folks interested in OE-derived SharpROM not be afforded that
> luxury of "don't you dare to close bugs unless you have the OK from
> us"?

Folk interested in OE-derived SharpROM can dup bug as you proposed -
just to have it immediately closed out, in current cases, I guess ;-E.

> I am sorry, but I have to maintain that Distro bugs/tasks and OE
> bugs/tasks are different animals and while our tools are not ideal to
> reflect this, we need to properly represent that.  The only way I see
> to do that is to have two tickets which is right, it is two issues.
> The chain is "fix it in dev" and then Angstrom or any other distro
> not made from .dev can decide whether they want to propagate the fix.
> 
> Cloning a ticket and titling it with "push bug #123 into A* stable"
> is 5 seconds work at most, link back to original bug automatically
> included. Too much?

Yes. Why bother, if there's only one party of one person waves and
screams on that? What to talk about that right now, if bugs fixed even
in Angstrom branch are *not* closed out?

> 
> Paul wrote:
> > that's simply how it is, and let's not go thru that again.
> 
> My impression was that we had already established that bugs.oe.net was
> not Angstrom property.  Does not look like your interpretation.

Yes, but OE's tracker always included bugs for distributions. That was
for OpenZaurus, now that's the same for Angstrom. If you personally
don't get along with that distro, just take it easy.

> I think A* should fully embrace the proposed clone-solution because
> AFAICS it is the only proper one for them to have a list of tickets
> open for  A* 2007 vs. A* 2008.  The solution serves their interest.

I think it should to. So once that happen, it will be just like you
want, so keep arguing. Until then, there's just existing Release Bugs
procedure, for the lack of something better.

Ah, and there's Angstrom Coreteam, you can apply to it for it to be
changed - maybe it will set something by fiat (whereas the current
procedure is per "no objections" mode). Also, most of Angstrom Coreteam
members also OE Core developers, so hopefully, they can think of a
compromise. Or how do you like following scenario: you keep screaming
and spreading FUD, blackmailing them into making an "affirmative action
inversion" decision which would complicate life for the most common and
all-encompassing distro for the benefit of fringe fractions?

As for me, I'm personally not interested in politics and bureaucracy.
I'm interested in aims, one of which is to maintain "right here,
right now" list of Known Issue for the common distro, which is important
attribute of any mass-market product.

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


