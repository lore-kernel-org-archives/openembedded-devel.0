Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1PszNP-0003bv-GS
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 16:14:39 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id F2CED1D360AC; Fri, 25 Feb 2011 16:13:15 +0100 (CET)
Date: Fri, 25 Feb 2011 16:13:15 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110225151315.GZ10042@ibawizard.net>
References: <4D66E88B.6040506@mentor.com> <4D67C447.9050906@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4D67C447.9050906@mentor.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Release-2011.03: Let the testing continue again!
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
X-List-Received-Date: Fri, 25 Feb 2011 15:14:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Tom Rini <tom_rini@mentor.com> [2011-02-25 08:01:27]:

> Given the libnl2 breakage I plan to update the branch again today around  
> 2pm (-0700) to again current to make sure folks running things over the  
> weekend don't hit that problem.

Hi,

there's another breakage - libvpx is not fetchable, their git is somehow
broken[1]. I've sent a fix to the mailing list just a few minutes ago.

1. ERROR: Function 'Fetch failed: Unable to fetch URL git://review.webmproject.org/libvpx.git;protocol=git;tag=v0.9.5 from any source.' failed.

-- ynezz


