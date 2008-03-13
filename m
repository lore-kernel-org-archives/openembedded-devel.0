Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1JZtgf-0007ej-L4
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 21:06:04 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20080313200346.DGQC17042.fed1rmmtao103.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 13 Mar 2008 16:03:46 -0400
Received: from opus ([68.230.58.230]) by fed1rmimpo03.cox.net with bizsmtp
	id 0k371Z0064y2VvG0000000; Thu, 13 Mar 2008 16:03:07 -0400
Date: Thu, 13 Mar 2008 13:03:47 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080313200346.GJ30966@smtp.west.cox.net>
References: <47D71B8F.1030108@balister.org>
	<f96d234e0803120708r3286e264w6fbd21e6381bc235@mail.gmail.com>
	<20080313101513.3e72ca08@widy.localdomain>
	<f96d234e0803130726q446bb89dg3698e2cec8c675e3@mail.gmail.com>
	<frbhvc$gg8$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <frbhvc$gg8$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.13 (2006-08-11)
X-SA-Exim-Connect-IP: 68.230.241.43
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Git versus Hg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Mar 2008 20:06:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 13, 2008 at 04:41:32PM +0100, Koen Kooi wrote:
> Cliff Brake schreef:
> 
> | I still maintain that that tools do impact developer workflow, and
> | this should be a serious consideration when selecting tools.  What is
> | the workflow that will maximize the productivity and output of the OE
> | community?  The tool selection should follow.
> 
> Having been through the bk->mtn switchover and the re-evaluation I
> noticed that people who said "I will start contributing (much more) to
> OE if you weren't using bitkeeper" didn't actually start contributing
> *at all*, so I'm extremely sceptical of the promised influx of a
> gazillion ISVs, OEMs, ODMs and users with a switch to hg/git/vss.

As someone who (a) doesn't use / know mtn and (b) should submit more, or
at least quicker, our changes, I can say you're right here.  I've been
quite happy to grab current, whip out quilt, patch, file bugzilla &
attach.  Now, if OE switches to git, I might make drop quilt in favor of
git patch (since I still need to get better git-fu under my belt), and
probably the same with hg.  But it won't impact how much / often I
contribute at all.

-- 
Tom Rini


