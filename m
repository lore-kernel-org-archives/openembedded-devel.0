Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OGhDV-0002Om-QI
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 01:37:54 +0200
Received: from gandalf.denix.org ([unknown] [71.255.238.44])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L2Y00DJM6RPNHL4@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	24 May 2010 18:33:26 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7DC7914AF60; Mon,
	24 May 2010 19:33:25 -0400 (EDT)
Date: Mon, 24 May 2010 19:33:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100524233325.GJ25484@denix.org>
References: <1274733028-13432-1-git-send-email-clarson@kergoth.com>
MIME-version: 1.0
In-reply-to: <1274733028-13432-1-git-send-email-clarson@kergoth.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 1/2] Rename url params patch=<ignored>/pnum=<n> to	apply={yes, no}/striplevel=<n>
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
X-List-Received-Date: Mon, 24 May 2010 23:37:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, May 24, 2010 at 01:30:27PM -0700, Chris Larson wrote:
> From: Chris Larson <chris_larson@mentor.com>
> 
> I think this makes the behavior rather more clear.

Ironically, just earlier today I was trying to explain to somebody, that 
patch=3 does not mean or do anything...

It maybe more clear for new users, but once you use it couple times, it 
doesn't matter if it's patch/pnum or apply/striplevel. But I see where you 
going with the second patch.

> Signed-off-by: Chris Larson <chris_larson@mentor.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> diff --git a/classes/patch.bbclass b/classes/patch.bbclass
> index a739b20..6ef408f 100644
> --- a/classes/patch.bbclass
> +++ b/classes/patch.bbclass


