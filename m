Received: from [206.46.173.15] (helo=vms173015pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N1XXC-0003dW-5F
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 05:43:21 +0200
Received: from gandalf.denix.org ([71.251.63.147]) by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KS0001Y12AE2KTZ@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	23 Oct 2009 22:42:14 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3501D14AF60; Fri,
	23 Oct 2009 23:42:14 -0400 (EDT)
Date: Fri, 23 Oct 2009 23:42:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091024034214.GA30861@denix.org>
References: <200910230504.57681.holger+oe@freyther.de>
	<1256301732.4529.161.camel@mill.internal.reciva.com>
	<hbs95i$p6r$1@ger.gmane.org> <200910240432.54335.holger+oe@freyther.de>
MIME-version: 1.0
In-reply-to: <200910240432.54335.holger+oe@freyther.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Sat, 24 Oct 2009 03:43:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Oct 24, 2009 at 04:32:54AM +0200, Holger Hans Peter Freyther wrote:
> On Friday 23 October 2009 14:56:18 Koen Kooi wrote:
> > How about this one:
> > http://dominion.thruhere.net/git/cgit.cgi/openembedded/commit/?h=koen/stati
> > c-libs-rework&id=bfa6dd452da52a4516a712f288030c3571ed6c4c ?
> 
> Could you push this as shared/static-libs-rework or tell me how to git clone 
> your tree?

http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=koen/static-libs-rework

-- 
Denys


