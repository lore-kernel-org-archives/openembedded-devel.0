Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nnbfw-0004Yz-OP for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 18:51:03 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nnbd7-0007Lu-V9 for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 18:48:05 +0100
Received: from p5b3b1abd.dip.t-dialin.net ([91.59.26.189])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Mar 2010 18:48:05 +0100
Received: from no2spam by p5b3b1abd.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Mar 2010 18:48:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): Connection refused
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 05 Mar 2010 18:47:49 +0100
Message-ID: <hmrg46$6m7$1@dough.gmane.org>
References: <1267616149.2259.4.camel@rex>	<ac9c93b11003030459h499fa3ban6f6884910ef785a@mail.gmail.com>	<1267624062.2259.58.camel@rex>	<ac9c93b11003030628n357a820elede742097eafee42@mail.gmail.com>
	<1267629590.2259.92.camel@rex>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b1abd.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <1267629590.2259.92.camel@rex>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meeting 2010/03/02
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
X-List-Received-Date: Fri, 05 Mar 2010 17:51:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Richard, let me first express my gratitude for your efforts.

Richard Purdie wrote:
> Following the procedure includes listening to feedback and acting on it.
> In the case I suspect we're talking about the commit was premature and a
> consensus was not reached.

Sorry, disagree here.  Unless you define consensus as a unanimous
decision.  This POV is out there with some people, sometimes in the form
of "I feel free to veto and block just about anything, but I will gladly
override negative feedback for my own commits".  I don't share the "You
have to have a unanimous decision" POV especially if the veto is IMHO
obviously out there for the sole reason to stall changes indefinitely
(and keep the breakage for others, which it seems some people would like
to spin as Angstrom-hunting, which is of course, bull).  Let's also not
forget, this was a non-core change and did not even need an RFC.

I strongly object to the notion that the feedback given until the commit
in question wasn't taken into account.  I feel it's quite a stunt to
even suggest otherwise, especially since there's ample and public
evidence to the contrary.  I'm not saying that suggestions made *after*
the commit couldn't and shouldn't have improved on the solution (instead
of reverting).

I do agree with Frans that there are still very many fuzzy areas as to
what is permittable in OE and what not.  I also agree with Frans that
it's becoming increasingly difficult to "move OE forward", whatever that
means for the individual.  And yes, I see the conflict between fixing
those two things.  Both effects greatly decrease the fun to hack on OE,
though, and has given OE a very slerotic feeling on my end lately.  I
fully understand Frans' feeling of "whatever you do in OE, you'll likely
get burned".

Frans, I hope I did not paraphrase your sentiments incorrectly.  Feel
free to correct me if I did.



