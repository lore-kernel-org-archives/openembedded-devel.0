Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Nd2Wt-00076c-RD
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 15:18:02 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 3AA87491264
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Feb 2010 15:15:33 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 4 Feb 2010 15:16:13 +0100
Message-ID: <4B6AD697.2070003@dresearch.de>
Date: Thu, 04 Feb 2010 15:15:51 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W217652A5FD6DFB2C0B4E2FD8570@phx.gbl>	<4B684D9D.2030001@dresearch.de>
	<4B699C5A.70909@dresearch.de>	<20100203162120.GB26844@xora-build.xora.org.uk>	<4B6AC59A.90000@dresearch.de>
	<ac9c93b11002040549p1536be1di20d94a83468ec0bf@mail.gmail.com>
In-Reply-To: <ac9c93b11002040549p1536be1di20d94a83468ec0bf@mail.gmail.com>
X-OriginalArrivalTime: 04 Feb 2010 14:16:13.0475 (UTC)
	FILETIME=[9B73AF30:01CAA5A4]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem in bitbaking
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
X-List-Received-Date: Thu, 04 Feb 2010 14:18:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> For me it also build for both i686 (machine eee701) and beagleboard.
> key difference is probably that for me glib got build as part of
> console-image. Didn't try a solo build of glib.

May be that's the point.

It looks like the problem occurs when configuring glib-2.0-native only
(which is not part of console-image???).

Steffen



