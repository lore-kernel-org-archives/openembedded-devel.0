Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NbsTz-0002f6-RU
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 10:22:15 +0100
Received: (qmail 7141 invoked by uid 813007); 1 Feb 2010 09:19:47 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Feb 2010 09:19:47 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 1 Feb 2010 10:19:10 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc5-00011-gf6760aa; KDE/4.3.4; x86_64; ;
	)
References: <op.u7dydnc4mn1qzu@camelguo>
In-Reply-To: <op.u7dydnc4mn1qzu@camelguo>
MIME-Version: 1.0
Message-Id: <201002011019.29557.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: failed to apply oxnas.diff when building linux_2.6.24.bb for oxnas machine
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
X-List-Received-Date: Mon, 01 Feb 2010 09:22:15 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia niedziela, 31 stycznia 2010 o 08:14:01 Guo Hongruan napisa=C5=82(a):
> Hi guys,
>    I tried to building openembedded with the following configuration in my
> local.conf:
> MACHINE=3Doxnas
> DISTRO=3Dmicro
> LIBC=3Dglibc
> But when building linux_2.6.24 for oxnas, the oxnas.diff can not be
> applied to the kernel with plenty of hunks failed.

Please prepare patch which will remove oxnas support from this recipe. It i=
s=20
not building since October and Steffen wrote:

>> hipox is my job. oxnas too, but may be we can finish the support for thi=
s.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




