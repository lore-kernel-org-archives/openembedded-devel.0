Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1K8O1K-00040z-Jf
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jun 2008 01:21:54 +0200
Received: from andromeda.vanille.de (e180145204.adsl.alicedsl.de
	[85.180.145.204])
	by drlauer-research.com (Postfix) with ESMTP id 7DF9C584C32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2008 01:23:54 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jun 2008 01:21:04 +0200
User-Agent: KMail/1.9.9
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<87mylpqccr.fsf@neumann.lab.ossystems.com.br>
	<g35sln$rc9$1@ger.gmane.org>
In-Reply-To: <g35sln$rc9$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200806170121.04385.mickey@vanille-media.de>
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
X-List-Received-Date: Mon, 16 Jun 2008 23:21:55 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Montag 16 Juni 2008 16:17:30 schrieb Rolf Leggewie:
> Sounds good to me, at least the most realistic proposal I saw so far.
> Because it deals better with some short-comings in the "have every patch
> touched by two devs"
>
> 1) we already have a *HUGE* backlog of patches in our bug tracker[1].
>    This will only grow bigger if we require even more human intervention
> 2) it does not treat every patch the same, differentiation is needed
>    IMHO, as well as efficiency and (semi)-automatic processes
>
> Basically, I am fine with "commit to dev, test out, fix regressions if
> present".  OTOH, "prevent regressions up front by reviewing everything"
> will slow down .dev to a crawl, I am afraid.  Don't we have stable for
> that very reason (less volatile code) and with exactly the "2 ACKs per
> commit"-policy?   I am all for review for big changes and where
> efficiently possibly, but I fail to see the value of it for example for
> the type of work that I often do (the busy-work that Cliff Brake so
> eloquently described on June 13th).
>
> With the huge number of open bugs and things that need fixing which have
> been untouched for ages, I am not convinced that slowing things down
> even further is a step in the right direction.

I have to agree here. Rather than becoming overbeaurocratic I'd like us to use 
the less painful branching and merging to implement changes to critical 
sections in the metadata.

-- 
:M:


