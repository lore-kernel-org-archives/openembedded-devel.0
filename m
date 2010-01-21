Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NXw0C-00066c-PE for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 13:19:11 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NXvy0-0003tf-7u
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 13:16:52 +0100
Received: from p5b3b3748.dip.t-dialin.net ([91.59.55.72])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 13:16:52 +0100
Received: from no2spam by p5b3b3748.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 13:16:52 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 21 Jan 2010 13:16:26 +0100
Message-ID: <hj9giu$mfp$1@ger.gmane.org>
References: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>	<201001211102.11252.holger+oe@freyther.de>
	<883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b3748.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>
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
X-List-Received-Date: Thu, 21 Jan 2010 12:19:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Dr. Michael Lauer wrote:
> I fully agree. I'm neither using patchwork nor do I find patches on the list a good idea.
> I'd welcome for-oe-upstream trees that would contain patches that -- if good -- we could
> just pull from.

Yes, me too would prefer to pull another branch from somewhere and
cherry-pick from it over other solutions.

I have two questions.

1) is it possible to host such a free-for-all branch somewhere?
2) although generally not a good idea, would it be possible to rebase
   this branch frequently so that the unapplied patches always come
   up first in "git log"?

OE needs a stronger community culture.  Too many devs are just contempt
with "my stuff works fine for me".



