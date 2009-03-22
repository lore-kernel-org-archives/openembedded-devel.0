Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LlELd-0004OI-UB
	for openembedded-devel@openembedded.org; Sun, 22 Mar 2009 04:27:42 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090322032626.ILMB15318.fed1rmmtao105.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sat, 21 Mar 2009 23:26:26 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id W3SR1b0074dMFYL043SRKA; Sat, 21 Mar 2009 23:26:26 -0400
X-Authority-Analysis: v=1.0 c=1 a=jnDkwDkONH0A:10 a=NfGtUH3zczzwe6oF5skA:9
	a=4CXqvqJbpCTPkD0GdgSW8T-v_4cA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sat, 21 Mar 2009 20:26:25 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090322032625.GK14278@smtp.west.cox.net>
References: <1237688443.23799.4.camel@ed-hp-laptop>
MIME-Version: 1.0
In-Reply-To: <1237688443.23799.4.camel@ed-hp-laptop>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: rootfs directory broken symlinks
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
X-List-Received-Date: Sun, 22 Mar 2009 03:27:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 21, 2009 at 07:20:43PM -0700, ed wrote:

> Is it normal after doing a build to find a bunch of broken sym links in
> the build/tmp/rootfs directory?

tmp/rootfs is not a usable directory for anything outside of the build
process, really.

-- 
Tom Rini


