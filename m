Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NSeD5-0007W6-HE for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 23:18:38 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NSeB4-0002uU-HF
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 23:16:30 +0100
Received: from p5b3b2a17.dip.t-dialin.net ([91.59.42.23])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2010 23:16:30 +0100
Received: from no2spam by p5b3b2a17.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2010 23:16:30 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Wed, 06 Jan 2010 23:16:05 +0100
Message-ID: <hi3235$iob$1@ger.gmane.org>
References: <1262697583.3209.23.camel@mattotaupa.wohnung.familie-menzel.net>	<hhvu64$40s$1@ger.gmane.org>
	<20100105225012.GC12135@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b2a17.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <20100105225012.GC12135@denix.org>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/1] Update unavailable whois 4.5.25 to available version 4.7.30.
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
X-List-Received-Date: Wed, 06 Jan 2010 22:18:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko wrote:
> Can you please elaborate?

Packages can always be updated.  But given the strong dispreference for
removing recipes it will lead to much less problems if OE just hosts the
sources itself.  Unfetchable upstream sources and updating recipes to
the latest versions are fairly separate issues in the prevalent OE
philosophy.  At least that is what I painfully learned.



