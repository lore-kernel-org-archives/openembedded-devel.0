Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LSGXS-0006tX-DO
	for openembedded-devel@openembedded.org; Wed, 28 Jan 2009 20:57:30 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090128194945.RPBE8485.fed1rmmtao105.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 28 Jan 2009 14:49:45 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id 97pi1b00P1E665w047pinn; Wed, 28 Jan 2009 14:49:45 -0500
X-Authority-Analysis: v=1.0 c=1 a=LLvST7gcIdsA:10 a=0G8rmy93P40A:10
	a=NYPxYQ4lhqP8vnbqAmIA:9 a=4sb2mgbvxssimJ53EJFj6NLjYJAA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 28 Jan 2009 12:49:42 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090128194942.GI15885@smtp.west.cox.net>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
	<1230858713.10424.4.camel@dax.rpnet.com>
	<1231462490.6467.85.camel@dax.rpnet.com>
	<20090117044728.GT6710@smtp.west.cox.net>
	<20090122181026.GN5233@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090122181026.GN5233@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: RFC: "Virtual" native and sdk recipes
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
X-List-Received-Date: Wed, 28 Jan 2009 19:57:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 22, 2009 at 11:10:26AM -0700, Tom Rini wrote:
> On Fri, Jan 16, 2009 at 09:47:28PM -0700, Tom Rini wrote:
> > On Fri, Jan 09, 2009 at 12:54:50AM +0000, Richard Purdie wrote:
> > [snip]
> > > a) We push my tree into OE
> > 
> > Done on your behalf now.
> > 
> > > b) You rebase onto my tree's changes and adjust the EXEEXT stuff.
> > > 
> > > c) You add changes which add the EXEEXT changes only to existing 
> > >    recipes and commit that.
> > > 
> > > d) The checksums.ini changes are a no brainer.
> > > 
> > > e) You start adding the totally new files to OE directly in a logical 
> > >    sequence of something like:
> > > 
> > >    i) Add canadian core classes (classes/canadian*)
> > >    ii) Add mingw new recipes
> > >    iii) Add misc support recipes (gmp/mprf-canadian)
> > >    iv) Add new binutils recipes
> > >    v) Add new gcc recipes
> > 
> > OK, this is the trini/canadian-merge branch.
> 
> I would like to merge those new recipes (not the changes to existing
> stuff) on the 26th, if no one objects.

A few days later even, and done.  I'm going to start a new thread for my
next round of comment-getting.

-- 
Tom Rini


