Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LusPK-0000mS-6H
	for openembedded-devel@openembedded.org; Fri, 17 Apr 2009 20:03:42 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090417175920.RUIB15318.fed1rmmtao105.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 17 Apr 2009 13:59:20 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id ghzJ1b00M4dMFYL04hzJuW; Fri, 17 Apr 2009 13:59:18 -0400
X-Authority-Analysis: v=1.0 c=1 a=C1szGUHcE44A:10 a=PGPu3ob2VHUA:10
	a=ViR93OXvZi97mdRGBHsA:9 a=37Tgj2cwji1mhVZRtsh2FdbGqkYA:4
X-CM-Score: 0.00
Date: Fri, 17 Apr 2009 10:59:18 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090417175918.GT17629@smtp.west.cox.net>
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-4-git-send-email-khimov@altell.ru>
	<20090416221015.GP17629@smtp.west.cox.net>
	<200904170835.02172.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <200904170835.02172.khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 04/11] gcc 4.2.4: add gcc-multilib64dir.patch
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
X-List-Received-Date: Fri, 17 Apr 2009 18:06:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 17, 2009 at 08:35:01AM +0400, Roman I Khimov wrote:
> On Friday 17 April 2009 02:10:15 Tom Rini wrote:
> > On Wed, Apr 15, 2009 at 04:35:53PM +0400, Roman I Khimov wrote:
> > > ---
> > >  recipes/gcc/files/gcc-multilib64dir.patch |   43
> > > +++++++++++++++++++++++++++++ recipes/gcc/gcc-4.2.4.inc                 |
> > >    1 +
> > >  2 files changed, 44 insertions(+), 0 deletions(-)
> > >  create mode 100644 recipes/gcc/files/gcc-multilib64dir.patch
> >
> > Does this apply as-is to 4.1 and 4.3 too?  If not, lets name it
> > gcc-4.2.x-multilib64dir.patch.
> 
> Not tried yet. Again, this is primarily for review/feedback on overall 
> approach. If everything is OK, then I can try add more gcc/glibc versions as 
> already done with binutils.

I think we're all in agreement that the approach (do what Debian does)
is fine.  So lets move on to making sure most distro's can easily take
this in :)

-- 
Tom Rini


