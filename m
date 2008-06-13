Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1K7DPI-0001mI-VL
	for openembedded-devel@openembedded.org; Fri, 13 Jun 2008 19:50:11 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20080613174931.LRJG2752.fed1rmmtao104.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Jun 2008 13:49:31 -0400
Received: from localhost ([68.230.59.19]) by fed1rmimpo02.cox.net with bizsmtp
	id dVpV1Z00P0QtwrG04VpVEX; Fri, 13 Jun 2008 13:49:32 -0400
Date: Fri, 13 Jun 2008 10:49:29 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080613174929.GG29216@smtp.west.cox.net>
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<74d0deb30806130306tf5ca604t7238ab26d715e03@mail.gmail.com>
	<f96d234e0806130543u7fb1e71an1f75c50a76c0d859@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <f96d234e0806130543u7fb1e71an1f75c50a76c0d859@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 13 Jun 2008 17:51:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 13, 2008 at 08:43:49AM -0400, Cliff Brake wrote:

[snip]
> One of the differences with the OE meta data is that its structure is
> rather flat instead of a nice hierarchy like the kernel.  Another
> problem is an update in one of the core components can often have
> unforeseen consequences in other packages.  So I don't think there is
> any substitute for a lot of testing.  A lot of the work to keep it all
> going is simply busy-work -- updating URI's, adding new versions of
> packages, etc, so I would hate to slow that down.  How about coming up
> with a list of directories/files that need mail list review:

Here's my 2 cents, as occasional contributor without write access and
without a good friend with write access.  Whatever the process, things
need to not get "lost" either in the ML noise or in the bugzilla,
possibly waiting for the "maintainer" to speak up.

-- 
Tom Rini


