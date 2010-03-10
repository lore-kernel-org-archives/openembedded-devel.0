Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NpMln-0007CI-4O
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 15:20:23 +0100
Received: (qmail 20648 invoked by uid 813007); 10 Mar 2010 14:17:23 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 10 Mar 2010 14:17:23 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Mar 2010 15:16:42 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.4.1; x86_64; ;
	)
References: <20100204113145.GR3401@jama> <4B96CAD2.90901@atmel.com>
In-Reply-To: <4B96CAD2.90901@atmel.com>
MIME-Version: 1.0
Message-Id: <201003101516.43175.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: pointercal ignored?
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
X-List-Received-Date: Wed, 10 Mar 2010 14:20:23 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 9 marca 2010 o 23:25:22 Ulf Samuelsson napisa=C5=82(a):
> I have built a custom variant of x11-gpe-image for the SAM9M10.

Which machine in OE covers that board? I have to admit that I did not tried=
 to=20
hack mine.
=20
> When gpe is started, the Y direction seems to be compressed.
> When I start the calculator and press at the top of the screen,
> the calculator buttons 5 mm below gets pressed.
> When I press at the bottom of the screen, the buttons 5 mm above
> gets pressed.
>=20
> Changing /etc/pointercal manually seems to have no effect
>=20
> It's like pointercal gets ignored.
>=20
> When others run the same kernel with minor config changes
> using the stable branch ans xserver-kdrive, this phenomena
> does not happen.

Check do you have kdrive or xorg with evdev or tslib driver.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




