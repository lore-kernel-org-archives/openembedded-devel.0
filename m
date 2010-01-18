Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NWfQb-0005kM-8X for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 01:25:12 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NWfOQ-0004kF-2f
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 01:22:54 +0100
Received: from p5b3b24db.dip.t-dialin.net ([91.59.36.219])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2010 01:22:54 +0100
Received: from no2spam by p5b3b24db.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2010 01:22:54 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Mon, 18 Jan 2010 01:22:31 +0100
Message-ID: <hj09k8$km$1@ger.gmane.org>
References: <1263760344-26105-1-git-send-email-eric@eukrea.com>	<hivtt3$v2r$1@ger.gmane.org>
	<1263763723.5353.16.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b24db.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <1263763723.5353.16.camel@mattotaupa.wohnung.familie-menzel.net>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] barebox: Add recipe for this new bootloader
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
X-List-Received-Date: Mon, 18 Jan 2010 00:25:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Paul Menzel wrote:
>> Setting PR is relatively minor, but lets stay consistent :) 
> 
> Could someone please change this in the manual please [1].
> 
> »It is good practice to always define PR in your recipes, even for the
> "r0" release, so that when editing the recipe it is clear that the PR
> number needs to be updated.«

I think it's safe to say that there are two factions with regard to PR
being set to r0.  And as you can see, both have their arguments in
favor.  Even though it may sound like it, Koen's position is not the
only one.  And I guess, neither one is official.



