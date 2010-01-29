Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Nat3N-0008C6-MK
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 16:46:40 +0100
Received: from [192.168.1.12] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by drlauer-research.com (Postfix) with ESMTP id 11FB258437B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2010 17:36:51 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v1077)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <E1Naol0-0001BB-G8@melo.openembedded.org>
Date: Fri, 29 Jan 2010 16:44:15 +0100
Message-Id: <94415AF6-0778-4FAA-8EBD-D61FB655B9F3@vanille-media.de>
References: <E1Naol0-0001BB-G8@melo.openembedded.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Koen Kooi : mplayer svn: make SRCREV go backwards to fix audio and dvd playback
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
X-List-Received-Date: Fri, 29 Jan 2010 15:46:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Am 29.01.2010 um 12:11 schrieb git version control:

> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: a9e2573fd6764685720bc5532370bad2c039d9be
> URL:    =
http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=3Da9e257=
3fd6764685720bc5532370bad2c039d9be
>=20
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Fri Jan 29 11:53:32 2010 +0100
>=20
> mplayer svn: make SRCREV go backwards to fix audio and dvd playback
>=20
> * bisecting to the offending commits is nigh impossible since mplayer =
doesn't compile for about 70% of the affected revision range :(

What about bumping PE?

Cheers,

:M:



