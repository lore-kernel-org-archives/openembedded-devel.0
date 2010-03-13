Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NqTen-0001uw-EB
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 16:53:46 +0100
Received: (qmail 30482 invoked by uid 813007); 13 Mar 2010 15:50:43 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 Mar 2010 15:50:42 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Mar 2010 16:49:34 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.4.1; x86_64; ;
	)
References: <1268466514-13547-1-git-send-email-ulf.samuelsson@atmel.com>
In-Reply-To: <1268466514-13547-1-git-send-email-ulf.samuelsson@atmel.com>
MIME-Version: 1.0
Message-Id: <201003131649.39596.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2 1/1] linux-atmel: Add support for latest AT91 kernel
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
X-List-Received-Date: Sat, 13 Mar 2010 15:53:46 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia sobota, 13 marca 2010 o 08:48:34 Ulf Samuelsson napisa=C5=82(a):
> Add support for building AT91 2.6.30 kernel
> Vanilla 2.6.30 recipe has moved on to 2.6.30.x
>=20
> Add maxim.org.za patches + Atmel experimental patches.
> (With the exception of the SAM9M10-EK support)
> Add support for configurable NAND flash partitions
> Add support for sam9m10g45-ek
>=20
> The contents of the maxim & experimental kernel patches
> has various authors described inide the patches.

NAK - please merge it into linux_2.6.30.bb as there is really no need to=20
duplicate it.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




