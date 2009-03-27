Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LnG15-0002KF-Kl
	for openembedded-devel@openembedded.org; Fri, 27 Mar 2009 18:38:52 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090327173659.USNN27308.fed1rmmtao101.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 27 Mar 2009 13:36:59 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id YHd01b0074dMFYL04Hd0YK; Fri, 27 Mar 2009 13:37:00 -0400
X-Authority-Analysis: v=1.0 c=1 a=aB74IoA4QDQA:10 a=SqpPp7sK3pAA:10
	a=FFOlUc_4AAAA:8 a=6LNcd8CsWgjeJj3Qu4gA:9 a=d09U9TuP0oNvi-qy8lAA:7
	a=JZ9D_yGTl_jYXuK563cBb5RDdUkA:4 a=LY0hPdMaydYA:10 a=BlRIgfqs9KgA:10
X-CM-Score: 0.00
Date: Fri, 27 Mar 2009 10:37:00 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090327173659.GY14278@smtp.west.cox.net>
References: <1238173051-2118-1-git-send-email-khimov@altell.ru>
	<49CD0AB7.3010309@dls.net>
MIME-Version: 1.0
In-Reply-To: <49CD0AB7.3010309@dls.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] dialog: update version 1.0-20050306 ->	1.1-20080819
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
X-List-Received-Date: Fri, 27 Mar 2009 17:38:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 27, 2009 at 12:19:51PM -0500, Mike (mwester) wrote:
> Roman I Khimov wrote:
> > Previous version is obsolete and can't be found on official FTP, it is also
> > removed from Debian archives so the packages failed to build if not using
> > some distro-specific mirror.
> > 
> > Hence, update version removing the old one along the way.
> 
> No comment on this particular patch, just in general I want to note that
> one cannot assume that just because the sources for an older version
> might be unfetchable on an official download site is insufficient reason
> to delete the old recipe.
> 
> For example, nslu2-linux.org mirrors all sources used to build SlugOS;
> and there are also commonly alternate locations for older sources.

Hey, can I make a request?  Can we get a set of mirrors all distros can
inherit by default?  It'd help with these kinds of problems if by
default all distros tried the Angstrom mirror, the SlugOS mirror and any
other distro mirror (and of course, distros can say just use my
mirror..).

-- 
Tom Rini


