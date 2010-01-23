Received: from smtp-out112.alice.it ([85.37.17.112])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NYkFF-0003KA-9s
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 18:58:04 +0100
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out112.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 23 Jan 2010 18:55:42 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 23 Jan 2010 18:55:42 +0100
Received: from [192.168.1.116] ([80.117.36.21]) by FBCMCL01B06.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sat, 23 Jan 2010 18:55:42 +0100
From: gnutoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hinc1j$ess$1@ger.gmane.org>
References: <hihuv8$b6u$1@ger.gmane.org>  <hinc1j$ess$1@ger.gmane.org>
Date: Sat, 23 Jan 2010 18:55:39 +0100
Message-Id: <1264269339.3738.1.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 23 Jan 2010 17:55:42.0879 (UTC)
	FILETIME=[481242F0:01CA9C55]
X-SA-Exim-Connect-IP: 85.37.17.112
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] Move udev cache creation after checkroot
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
X-List-Received-Date: Sat, 23 Jan 2010 17:58:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2010-01-14 at 16:08 +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> It received 2 Acks, no NAKs, works well in the field: it's applied now
> 
> On 12-01-10 14:54, Koen Kooi wrote:
> > Hi,
> > 
> > What's your opinion on attached (untested) patch? If there's some
> > consensus that this is a step in the right direction I'll create a
> > working & tested patch to commit.
> > 
> > Nota bene: I'm not going to discuss the merits of udev caching, only the
> > impact of this patch to the current situation.
> > 
> > regards,
> > 
> > Koen
I tested it today(sorry for testing late)
And boot still hang with udev + ro
maybe it fixes a different issue then

Denis.




