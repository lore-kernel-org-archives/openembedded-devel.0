Received: from [82.208.49.253] (helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1N9wUx-0002fF-FJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 08:59:46 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 7DC611D36078; Mon, 16 Nov 2009 08:58:16 +0100 (CET)
Date: Mon, 16 Nov 2009 08:58:16 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezzor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091116075816.GF32004@ibawizard.net>
References: <alpine.LFD.2.00.0911150948430.14311@localhost>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.00.0911150948430.14311@localhost>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: any ETA on a working dev beagleboard demo image?
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
X-List-Received-Date: Mon, 16 Nov 2009 07:59:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Robert P. J. Day <rpjday@crashcourse.ca> [2009-11-15 09:56:36]:

> or perhaps start a branch named, oh, "bleeding", which, when it builds
> properly, can be merged back into development.  whatever.  but it
> strikes me that it's overwhelmingly pointless to have a development
> branch that doesn't build since that gives no one the opportunity to
> actually test it.

Bleeding = dev, for me at least.

I had problems with building dev on Ubuntu 8.10(some weird host setup, like
gcc and includes) so I upgraded to 9.04 and I can build beagleboard-demo-image
again. Last time I tried it was yesterday.

-- ynezz


