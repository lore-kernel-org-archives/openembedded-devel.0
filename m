Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NrNQh-0003ra-3C
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 04:26:55 +0100
Received: from gandalf.denix.org ([unknown] [71.251.59.195])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KZC00CTNUR833KA@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	15 Mar 2010 22:23:38 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4D4D214AF60; Mon,
	15 Mar 2010 23:23:32 -0400 (EDT)
Date: Mon, 15 Mar 2010 23:23:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100316032332.GA18102@denix.org>
References: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
	<1267392928.13054.1.camel@andromeda> <hmgjc2$sgd$1@dough.gmane.org>
	<BE689342-3D28-4D8F-A58C-36885368CE0F@vanille-media.de>
	<20100301150245.GC12022@jama>
	<ly634xpm2z.fsf_-_@ensc-virt.intern.sigma-chemnitz.de>
MIME-version: 1.0
In-reply-to: <ly634xpm2z.fsf_-_@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.11
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: bitbake-dev@lists.berlios.de
Subject: Re: bitbake -b with BBCLASSEXTENDed recipes
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
X-List-Received-Date: Tue, 16 Mar 2010 03:26:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 15, 2010 at 05:48:52PM +0100, Enrico Scholz wrote:
> Martin Jansa <martin.jansa@gmail.com> writes:
> 
> > Is it possible to implement some support for old functionality like
> > bitbake -c clean -b path.to.recipe.with.BBCLASSEXTEND.bb
> > ...
> > It's really hard to implement something like prefixing -b path with
> > "virtual:native:"
> 
> Bitbake must be patched for this; see
> https://www.cvg.de/people/ensc/0008-bbclassextend.patch

Care to send it to the bitbake-dev mailing list?

-- 
Denys


