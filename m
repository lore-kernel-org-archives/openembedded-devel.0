Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RObr0-0001tc-J9
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 22:08:10 +0100
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LUG00KN1QEMBM5W@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	10 Nov 2011 15:01:34 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 06C2414AF5D; Thu,
	10 Nov 2011 16:01:34 -0500 (EST)
Date: Thu, 10 Nov 2011 16:01:33 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111110210133.GD20602@denix.org>
References: <4EBBE67F.20300@freyther.de> <j9gufv$35d$1@dough.gmane.org>
	<20111110185732.GC20602@denix.org> <j9hbvk$b8u$2@dough.gmane.org>
MIME-version: 1.0
In-reply-to: <j9hbvk$b8u$2@dough.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: RFC Creation of a meta-telephony repository
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
X-List-Received-Date: Thu, 10 Nov 2011 21:08:10 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Nov 10, 2011 at 09:25:24PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Op 10-11-11 19:57, Denys Dmytriyenko schreef:
> >> Op 10-11-11 15:58, Holger Freyther schreef:
> >>> Hi all, sysadmins,
> >>> 
> >>> could someone create a meta-telephony repository for me?
> >> 
> >> Why not use github/gitorious/etc for it?
> > 
> > Do you have a hidden anti-OpenEmbedded agenda here? ;-)
> > 
> > Seriously though, why is it better than oe.org hosting?
> 
> It has less constraints. You should know, since you were the one telling me
> that oe.org is resource constrained and we can't host too many layers.
> 
> I haven't seen enough reason to place the burden for this layer on the OE
> admin team instead of doing 'self' hosting on gitorious/github/etc/

Well, first of all, when we had constrained resources at oe.org, we were 
trying to limit the number of commercial layers, assuming that the company 
behind such layer is well capable of providing hosting for their product. 
That would mean BSP layers from semis, like Intel, TI, Freescale etc. or 
commercial distro layers from OSVs, such as Mentor, Montavista etc.
We always welcomed community layers on oe.org, even BSP layers for platforms 
that had no official commercial support, but also distro, apps and other 
layers, as long as they had "supported by community" status.

And second, since now we have new servers graciously donated by The Linux 
Foundation, we should not object to new community layers hosted on oe.org. 
I'd let our admins comment on the burden, though.

-- 
Denys


