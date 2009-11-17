Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1NAPuD-0004eD-Hm
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 16:23:48 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 639B31D36078; Tue, 17 Nov 2009 16:22:20 +0100 (CET)
Date: Tue, 17 Nov 2009 16:22:20 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091117152220.GA15728@ibawizard.net>
References: <200911171337.35127.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <200911171337.35127.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Geode machines support changes
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
X-List-Received-Date: Tue, 17 Nov 2009 15:23:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Marcin Juszkiewicz <marcin@juszkiewicz.com.pl> [2009-11-17 13:37:17]:

> Hi

Hi,

> 3. move all target related flags from machine configs to tune-geode.inc
>    - TARGET_ARCH
>    - glibc tune (GLIBC_ADDONS, GLIBC_EXTRA_OECONF)

It's fine with me.

> Then we can consider changing TARGET_ARCH to i586 for Geode machines.

I don't have time(maybe this weekend) to do a benchmark of 486 vs 586 build,
but 586 was fast enough for me on IEI NanoGX, so I wasn't looking for any
optmizations. 

-- ynezz


