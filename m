Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1KrFL5-0007nO-JB
	for openembedded-devel@openembedded.org; Sat, 18 Oct 2008 19:11:43 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20081018171132.WOBK29505.fed1rmmtao107.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sat, 18 Oct 2008 13:11:32 -0400
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id UHBX1a0021E665w04HBXYg; Sat, 18 Oct 2008 13:11:31 -0400
X-Authority-Analysis: v=1.0 c=1 a=1Le64-iiJ8FaIlgfSHUA:9
	a=bHiJ6Hea4yRfZm4wLhBJWHBgwDMA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sat, 18 Oct 2008 10:11:30 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081018171130.GB2679@smtp.west.cox.net>
References: <1224320609.5215.15.camel@dax.rpnet.com>
	<1224341977.3140.112.camel@mill.internal.reciva.com>
	<1224344240.5215.48.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1224344240.5215.48.camel@dax.rpnet.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Some open issues
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
X-List-Received-Date: Sat, 18 Oct 2008 17:11:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 18, 2008 at 04:37:20PM +0100, Richard Purdie wrote:
> On Sat, 2008-10-18 at 15:59 +0100, Phil Blundell wrote:
[snip]
> > i) why this is a terribly big issue in the first place (i.e. what the
> > real-world impact of the corruption is going to be); or
> 
> There is no impact on the current metadata, just the history. It depends
> how much value we place on that.

And with 'git bisect' good history is very valuable for fixing
long-standing bugs.  Or at least can be.

-- 
Tom Rini


