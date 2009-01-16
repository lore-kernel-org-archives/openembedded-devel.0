Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LNxul-0008OU-6u
	for openembedded-devel@openembedded.org; Sat, 17 Jan 2009 00:15:47 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090116230858.QITS12540.fed1rmmtao106.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 16 Jan 2009 18:08:58 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id 4P8z1b0031E665w04P8z4e; Fri, 16 Jan 2009 18:08:59 -0500
X-Authority-Analysis: v=1.0 c=1 a=jkrGB7HfmMEA:10 a=lGI2-Ax3ql8A:10
	a=VtGtbfHmzC31pUew4rMA:9 a=ee85QwXEt4L9rHIFHmklr8eFxBYA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Fri, 16 Jan 2009 16:08:59 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090116230858.GQ6710@smtp.west.cox.net>
References: <20090111152021.47737188463@amethyst.openembedded.net>
	<20090111170659.GC17627@excalibur.local>
	<gkdanl$3ht$1@ger.gmane.org>
	<20090111175759.GE17627@excalibur.local>
	<20090111180741.GF17627@excalibur.local>
	<20090116202514.GA24280@denix.org> <gkqrif$bjr$1@ger.gmane.org>
	<20090116205723.GB24280@denix.org>
	<20090116210120.GC24280@denix.org>
MIME-Version: 1.0
In-Reply-To: <20090116210120.GC24280@denix.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Koen Kooi : mtd-utils: add 1.2.0+git for ubifs-support
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
X-List-Received-Date: Fri, 16 Jan 2009 23:15:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 16, 2009 at 04:01:20PM -0500, Denys Dmytriyenko wrote:
> On Fri, Jan 16, 2009 at 03:57:23PM -0500, Denys Dmytriyenko wrote:
> > On Fri, Jan 16, 2009 at 09:43:59PM +0100, Koen Kooi wrote:
[snip]
> > > The gettext thing has been fixed for a few days now.
> > 
> > Only gettext-native was fixed.
> 
> I meant e2fsprogs-libs-native was fixed... e2fsprogs-libs was not.

True enough, but this is probably only one of many things needing fixing
for multi-threaded bitbake, which is something else on my long-term
list.  I didn't fix the target one for, well, no real good reason I
suppose, sorry.  I'll poke it in later if someone doesn't beat me to it.

-- 
Tom Rini


