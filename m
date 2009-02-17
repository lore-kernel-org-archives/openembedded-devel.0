Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LZXwi-0004dl-8A
	for openembedded-devel@openembedded.org; Tue, 17 Feb 2009 22:57:41 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090217215529.KTL8485.fed1rmmtao105.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Feb 2009 16:55:29 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id H9vV1b0011E665w049vVMF; Tue, 17 Feb 2009 16:55:29 -0500
X-Authority-Analysis: v=1.0 c=1 a=agTt5Vcrck8A:10 a=bl7dQ8ehPwsA:10
	a=iT_tRvze5hy6nVRhyjwA:9 a=TTtGKIbm8xGHDn2YPxn87vNn8X4A:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 17 Feb 2009 14:55:29 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090217215529.GJ11815@smtp.west.cox.net>
References: <499AD8D6.3000708@balister.org> <gnere3$16u$1@ger.gmane.org>
	<499B1606.3040406@opensimpad.org>
MIME-Version: 1.0
In-Reply-To: <499B1606.3040406@opensimpad.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Autobuilder bugs versus stable branch being updated
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
X-List-Received-Date: Tue, 17 Feb 2009 21:57:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 17, 2009 at 08:54:46PM +0100, Bernhard Guillon wrote:
> Rolf Leggewie wrote:
>> Philip,
>>
>> thank you for your comment.
>>
>> Philip Balister wrote:
>>> I think it is a but of stretch to close old autobuilder bugs with the 
>>> comment the stable branch will not be updated.
>>
>> That should not be the case (unless of course they were both of type  
>> .stable and -autobuild).
>>
> We should create a new stable branch. The old one drifted too much away  
> from .dev which makes it hard to backport things from .dev to stable.

The problem really is a policy one.  The old stable was "angstrom
snapped for 2007 here".  That's one way to do a stable branch, but not
what everyone thinks when they read "stable".  How much would it hurt to
have OE actually do releases, rather than to be, in kernel terms, mostly
like Andrew's tree (once stuff seems to work for some people, pull it
in, see what breaks)?

And of course, who would volunteer to actually try and maintain such
things and get everyone using the various branches that would have to
entail, correctly?

-- 
Tom Rini


