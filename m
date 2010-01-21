Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NY6Ec-0007a2-UR for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 00:14:46 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NY6CO-0002A7-31
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 00:12:24 +0100
Received: from p5b3b3748.dip.t-dialin.net ([91.59.55.72])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 00:12:24 +0100
Received: from no2spam by p5b3b3748.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 00:12:24 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 22 Jan 2010 00:11:54 +0100
Message-ID: <hjan00$419$1@ger.gmane.org>
References: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>	<201001211102.11252.holger+oe@freyther.de>	<883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>	<hj9giu$mfp$1@ger.gmane.org>
	<1264111223.7697.31.camel@utx.utx.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b3748.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <1264111223.7697.31.camel@utx.utx.cz>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Getting patches committed
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
X-List-Received-Date: Thu, 21 Jan 2010 23:14:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Stanislav Brabec wrote:
> org.openembedded.open (or .staging or .public)

funny thing.  I was discussing something like this with RP just when you
sent this mail.  It's not as straightforward as it may sound, though.
First of all, I think we'd need several, possibly unlimited number of
FFA branches.  Second, RP and I agreed that security implications are a
concern if we allow commit access completely uninhibited.

>> OE needs a stronger community culture.  Too many devs are just contempt
>> with "my stuff works fine for me".
> 
> Not as easy as it sounds. OE is a heterogeneous environment. Knowing
> that things may break on some platform need non-trivial knowledge.

If things are non-trivial, they should be reviewed.  If a committer is
unsure, when in doubt, go for a review.

I'm talking of things like new bb recipes that can really do no harm
unless someone explicitly builds them.  There are still a number of them
in the bug tracker that are 2, 3 or even more years old.  There really
is no excuse for that IMHO, not even "I'm not interested in the recipe
in question".  Recently, I closed a significant number of tickets with
recipes that had been reinvented and committed by somebody else in the
meantime.  What a waste of time on both sides



