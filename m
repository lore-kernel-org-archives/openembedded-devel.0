Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1O7uHS-00009Y-H6
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 19:45:46 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L1P00JX3AGKGE74@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	30 Apr 2010 12:41:21 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8C57C14AF60; Fri,
	30 Apr 2010 13:41:08 -0400 (EDT)
Date: Fri, 30 Apr 2010 13:41:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100430174108.GA5713@denix.org>
References: <hrbmd4$mng$1@dough.gmane.org>
	<1272552574.3865.814.camel@trini-m4400> <hrcim7$8ge$1@dough.gmane.org>
MIME-version: 1.0
In-reply-to: <hrcim7$8ge$1@dough.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Merging RPs branch, help needed for dealing with possible	fall-out
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
X-List-Received-Date: Fri, 30 Apr 2010 17:45:48 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 29, 2010 at 08:20:55PM +0200, Koen Kooi wrote:
> On 29-04-10 16:49, Tom Rini wrote:
> > On Thu, 2010-04-29 at 12:18 +0200, Koen Kooi wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> Hi,
> >>
> >> I've been talking to RP and we both like to merge his branch as soon as
> >> the last problem (the cross lamanger) has been addressed. RP estimates
> >> that will happen early next week.
> >> But after it has been merged there might be some fallout, which we would
> >> like to have some help with. If you don't want to help out and and don't
> >> want the possible breakage: don't git pull for the time being.
> > 
> > Related, do we have people signing up for building ___ targets?  I'll
> > assume angstrom + beagleboard + beagleboard-demo will be covered :)
> 
> I'm going to do angstrom + beagle/hawkboard +
> console/beagleboard-demo/angstrom-gnome-image

I'm currently quite busy, but hopefully in a week or two will be able to do 
DaVinci and some OMAP3/L1 EVMs...

-- 
Denys


