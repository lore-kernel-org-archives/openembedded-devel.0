Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1P07Vi-0007Lb-8i
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 08:48:28 +0200
Received: (qmail 9585 invoked by uid 813007); 27 Sep 2010 06:48:17 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 27 Sep 2010 06:48:17 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Sep 2010 08:49:32 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.35-22-generic; KDE/4.5.1; x86_64; ; )
References: <AANLkTi=yzQKfFvBDGM2JtTGoz+Zq40M0VcaZVYOxcaWy@mail.gmail.com>
In-Reply-To: <AANLkTi=yzQKfFvBDGM2JtTGoz+Zq40M0VcaZVYOxcaWy@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201009270849.33205.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc 4.5 - linaro into OE
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
X-List-Received-Date: Mon, 27 Sep 2010 06:48:28 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia sobota, 25 wrze=C5=9Bnia 2010 o 19:48:54 Khem Raj napisa=C5=82(a):
> Hi
>=20
> I have ported some patches from linaro into OE gcc 4.5, they work fine
> and the tests results look good
> it should improve the performance too. It would be nice if somebody
> could try this out and report any
> issues. Results of my gcc testsuite run are here
>=20
> http://uclibc.org/~kraj/gcc-results/
>=20
> I will post any performance results if I do
>=20
> The git branch is khem/import-linaro-gcc-4.5

Nice work Khem!

I added gcc 4.4/linaro recently into OE - gcc-cross(-initial|-intermediate)=
=20
builds fine, gcc and gcc-cross-sdk fail.

I am also working on adding gcc 4.5/linaro as new set of recipes instead of=
=20
patching gcc 4.5.inc file.

Both versions use tarballs of our (Linaro) releases.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




