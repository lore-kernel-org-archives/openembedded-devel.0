Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OqPli-0000Jl-US
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 14:16:51 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 3607449127F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 14:16:20 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 31 Aug 2010 14:16:20 +0200
Message-ID: <4C7CF29F.6090806@dresearch.de>
Date: Tue, 31 Aug 2010 14:16:31 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.8) Gecko/20100802 Lightning/1.0b2 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1282916906-21411-1-git-send-email-sledz@dresearch.de>	<4C77C60E.3080106@dresearch.de>	<AANLkTinuV6vLXXKJ_hrkNs-23cauS8OZA6gpyZySz-=s@mail.gmail.com>	<4C7A46EA.9040609@dresearch.de>
	<1283256795.13038.210.camel@mill.internal.reciva.com>
In-Reply-To: <1283256795.13038.210.camel@mill.internal.reciva.com>
X-OriginalArrivalTime: 31 Aug 2010 12:16:20.0303 (UTC)
	FILETIME=[51E8BDF0:01CB4906]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rsyslog: keep rsyslog running as long as possible on shutdown
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
X-List-Received-Date: Tue, 31 Aug 2010 12:16:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 31.08.2010 14:13, schrieb Phil Blundell:
> Yes, the DISTRO maintainers would have the final say about start/stop
> levels (and, indeed, whether to use sysvinit at all).  But it seems
> sensible for the package to provide reasonable defaults that would be
> acceptable to some/most distros.

OK. What's the best way to get the distro maintainers attention (and acks)?

Steffen

BTW: There's a new version of this patch (see later in this thread).



