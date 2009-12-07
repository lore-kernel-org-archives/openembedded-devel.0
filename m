Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NHYrm-0006bn-Sp
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 09:22:50 +0100
Received: (qmail 27261 invoked by uid 813007); 7 Dec 2009 08:21:09 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 7 Dec 2009 08:21:08 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 7 Dec 2009 09:21:26 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc7-00029-ga9366e6-dirty; KDE/4.3.2;
	x86_64; ; )
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
In-Reply-To: <1260139496-21442-3-git-send-email-leon@sidebranch.com>
MIME-Version: 1.0
Message-Id: <200912070921.27555.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] cyclone3_starter.conf: New machine/board for architecture nios2.
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
X-List-Received-Date: Mon, 07 Dec 2009 08:22:50 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia niedziela, 6 grudnia 2009 o 23:44:38 Leon Woestenberg napisa=C5=82(a):
> These adds the Altera Cyclone III FPGA Starter Kit which can
> run a nios2 soft-core SoC processor.
>=20
> Tested-by: Walter Goossens <walter.goossens@axon.tv>
> Tested-by: Leon Woestenberg <leon@sidebranch.com>
> Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
> ---
>  conf/machine/cyclone3_starter.conf |    7 +++++++

Do not use underscore in names as this conflicts with OVERRIDES.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




