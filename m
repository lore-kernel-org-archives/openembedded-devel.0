Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LISJf-0007BJ-Cn
	for openembedded-devel@openembedded.org; Thu, 01 Jan 2009 19:30:43 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090101182503.ZJDJ2948.fed1rmmtao101.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 1 Jan 2009 13:25:03 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id yJQz1a00C1E665w03JQzhl; Thu, 01 Jan 2009 13:25:02 -0500
X-Authority-Analysis: v=1.0 c=1 a=LLvST7gcIdsA:10 a=0G8rmy93P40A:10
	a=wXJmYLOFOOIZkOUM-7MA:9 a=rtHFwcJr-eyXTVK9h2cA:7
	a=lEuqoOO4KcvYDvakFOwzzEm2YJwA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Thu, 1 Jan 2009 11:25:26 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090101182526.GF7040@smtp.west.cox.net>
References: <1230827114.5320.42.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1230827114.5320.42.camel@dax.rpnet.com>
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
X-List-Received-Date: Thu, 01 Jan 2009 18:30:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 01, 2009 at 04:25:14PM +0000, Richard Purdie wrote:

> Its nice to try something a bit different occasionally. For a long time
> the mechanical repetitive nature of -native and -sdk recipes has
> bothered me and people have talked about getting rid of them since
> forever. I've had ideas floating around on how to address this for a
> while and I now have a proper proposal and better still a proof of
> concept.

I'll read the whole thing again later, but in working on the canadian
SDK stuff (*poke*) I've been thinking why don't we just build the "SDK"
packages for building our own stuff?  gcc/etc are relocatible if we
build them right...

-- 
Tom Rini


