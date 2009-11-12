Received: from [85.33.2.12] (helo=smtp-out01.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1N8hSH-0006Fb-8Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 22:43:52 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 12 Nov 2009 22:42:30 +0100
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 12 Nov 2009 22:42:30 +0100
Received: from [192.168.10.100] ([79.54.10.26]) by FBCMCL01B08.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 12 Nov 2009 22:42:29 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4AFC58B0.3080000@mwester.net>
References: <alpine.LFD.2.00.0911120045170.1265@localhost>
	<200911120656.41249.holger+oe@freyther.de>
	<200911120722.09166.holger+oe@freyther.de>
	<alpine.LFD.2.00.0911120125380.1977@localhost>
	<ac9c93b10911120015j5b8cbc07j30f57f2dc68987ca@mail.gmail.com>
	<alpine.LFD.2.00.0911120727540.7268@localhost>
	<ac9c93b10911120447k496f094bg478dc05ae612b4a9@mail.gmail.com>
	<4AFC58B0.3080000@mwester.net>
Date: Thu, 12 Nov 2009 22:42:24 +0100
Message-Id: <1258062144.13299.1.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 12 Nov 2009 21:42:29.0654 (UTC)
	FILETIME=[08995B60:01CA63E1]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xterm: either fix it, or remove it. please.
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
X-List-Received-Date: Thu, 12 Nov 2009 21:43:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> Is it practical?  I think the answer is no.  In my experience, tools
> like selinux have a tendency to require inordinate amounts of
> administrative burden that just isn't practical in a development
> environment.  I think requiring that selinux be disabled on build
> hosts
> is a reasonable requirement, and will avoid wasting a lot of cycles
> that
> should be spent on OE, and not on administration (or sending lots of
> emails).
What about supporting only the unconfined user selinux
type(unconfined_u),in targeted mode?
Denis.




