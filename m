Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NqThP-0004us-4s
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 16:56:28 +0100
Received: (qmail 2979 invoked by uid 813007); 13 Mar 2010 15:53:25 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 Mar 2010 15:53:25 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Mar 2010 16:52:31 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.4.1; x86_64; ;
	)
References: <1268463659-12912-1-git-send-email-ulf.samuelsson@atmel.com>
In-Reply-To: <1268463659-12912-1-git-send-email-ulf.samuelsson@atmel.com>
MIME-Version: 1.0
Message-Id: <201003131652.32514.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2 1/1] x11-at91sam9-image: x11-gpe-image with additions
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
X-List-Received-Date: Sat, 13 Mar 2010 15:56:28 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia sobota, 13 marca 2010 o 08:00:59 Ulf Samuelsson napisa=C5=82(a):
> Create an image based on x11-gpe-image but with
> a lot of applications added;

=46ew notes:

1. As it is based on x11-gpe-image then do "require x11-gpe-image.bb" in fi=
rst
   line instead of copying whole recipe.

2. Do not use ANGSTROM_EXTRA_INSTALL as this is distroism - use IMAGE_INSTA=
LL
   like it should be used.

3. What about adding some description to recipe?

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




