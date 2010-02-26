Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NkzDI-0000rW-IM
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 13:22:41 +0100
Received: (qmail 27675 invoked by uid 813007); 26 Feb 2010 12:19:51 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 26 Feb 2010 12:19:51 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Feb 2010 13:18:45 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.3.4; x86_64; ;
	)
References: <1267186167-28814-1-git-send-email-Bernhard.Guillon@opensimpad.org>
In-Reply-To: <1267186167-28814-1-git-send-email-Bernhard.Guillon@opensimpad.org>
MIME-Version: 1.0
Message-Id: <201002261318.46211.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-2.6.29: atngw100 - add bridge module to defconfig, bump PR
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
X-List-Received-Date: Fri, 26 Feb 2010 12:22:41 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 26 lutego 2010 o 13:09:27 Bernhard.Guillon@opensimpad.org=
=20
napisa=C5=82(a):
> From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
>=20
>=20
> Signed-off-by: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
> ---
>  recipes/linux/linux-2.6.29/atngw100/defconfig

Can you merge all things into recipes/linux/linux/atngw100/defconfig? It wa=
s=20
generated with 2.6.29 kernel and I would like to be able to use this=20
configuration with 2.6.30-33 kernels as well.

I cannot test this on device now.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




