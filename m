Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NWuRH-0000K8-3N for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 17:26:54 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NWuP6-0006bW-Gn
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 17:24:36 +0100
Received: from p5b3b31e6.dip.t-dialin.net ([91.59.49.230])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2010 17:24:36 +0100
Received: from no2spam by p5b3b31e6.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2010 17:24:36 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Mon, 18 Jan 2010 17:24:10 +0100
Message-ID: <hj21vd$32h$1@ger.gmane.org>
References: <1263760344-26105-1-git-send-email-eric@eukrea.com>	<hivtt3$v2r$1@ger.gmane.org>	<1263763723.5353.16.camel@mattotaupa.wohnung.familie-menzel.net>	<hj09k8$km$1@ger.gmane.org>	<1263820243.3675.560.camel@mill.internal.reciva.com>
	<1263824896.26227.112.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b31e6.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <1263824896.26227.112.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: include default PR or not (was: [PATCH] barebox: Add recipe for this new bootloader)
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
X-List-Received-Date: Mon, 18 Jan 2010 16:26:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Mon, 2010-01-18 at 13:10 +0000, Phil Blundell wrote:
[...]
>> only way we will get a definitive answer would be to have the TSC hand
>> down a judgement on the matter.
> 
> That would seem sensible if only to lay this matter to rest once and for
> all! It would also be good to test the TSC processes...

I would think this is too minor for the TSC to bother.  But if you want
to take it on, why should I object?  It does take up bandwidth on this
list from time to time, so much is true.  Personally, I don't think the
best option would be to rule in favor of one or the other faction,
because that's what it would be seen for.  I don't think the TSC can
really win and resolve this issue.

*If* the TSC decides to vote on this, may I propose to have it decide
that people are free to include PR as r0 or not as they see fit,
perpetuating current practice. I think that is about the only sensible
solution we can find here.  If anything were to be made definitive, it
should be that devs - when speaking "officially" or something that could
be perceived as such - ought to make sure to stress this is a matter of
(their) personal preference.

Please don't let the TSC turn into some bureaucratic monster that
regulates everything.  When in doubt, feel free to not rule at all.



