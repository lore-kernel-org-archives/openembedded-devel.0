Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nhm3T-0007fI-OL for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 16:43:14 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nhm0r-0004Yo-Et for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 16:40:29 +0100
Received: from p5b3b189d.dip.t-dialin.net ([91.59.24.157])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 16:40:29 +0100
Received: from no2spam by p5b3b189d.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 16:40:29 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Wed, 17 Feb 2010 16:39:56 +0100
Message-ID: <hlh2km$psg$1@ger.gmane.org>
References: <b6ebd0a51002151538o524cdf17s228535e93b28d4d4@mail.gmail.com>	<hldk2b$5tt$2@ger.gmane.org>	<ac9c93b11002160039j717d1611wbdd1d2fac220dd55@mail.gmail.com>
	<1266311966.6436.110.camel@rex>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b189d.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <1266311966.6436.110.camel@rex>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: contrib tree (was: Cleanup / janitors)
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
X-List-Received-Date: Wed, 17 Feb 2010 15:43:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> I'd like to see a contrib tree which anyone can be given access to.
> People can queue commits in this, then someone with access to OE.dev can
> just pull (or cherrypick) from it.

Yes, I think that is a good idea and we discussed this earlier.  Maybe
we can use the mob branch on repo.or.cz?  That would save us the admin
overhead and worries.  On my request, the repo.or.cz admin recently
added support for an infinite number of mob branches rather than just a
single mob branch, so contributors can commit conflicting things for
review as well.  Unfortunately, I haven't yet found the time to test the
new setup.



