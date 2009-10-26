Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N2WNu-0005NA-Fm
	for openembedded-devel@openembedded.org; Mon, 26 Oct 2009 21:41:49 +0100
Received: (qmail 21802 invoked by uid 813007); 26 Oct 2009 20:40:43 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 26 Oct 2009 20:40:43 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Oct 2009 22:43:11 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc3-00052-g0eca52a; KDE/4.3.2; x86_64; ;
	)
References: <200910262125.58992.david.lanzendoerfer@o2s.ch>
In-Reply-To: <200910262125.58992.david.lanzendoerfer@o2s.ch>
MIME-Version: 1.0
Message-Id: <200910262143.12193.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] MokoTouch
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
X-List-Received-Date: Mon, 26 Oct 2009 20:41:49 -0000
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=B3ek, 26 pa=BCdziernika 2009 o 21:25:48 David Lanzend=F6rfer=
=20
napisa=B3(a):
> I'd like to have mokotouch-recipes added to OE.
=20
1. use "install -d" instead of "mkdir"
2. use "install" instead of "cp"
3. learn about DEPENDS and RDEPENDS and fix use of them
4. use "oe_runmake" instead of "make"
5. do not set PACKAGES
6. build to ${prefix} not /usr/local/
7. get rid of ugly symlinking of libraries
8. move common stuff to mokotouch.inc
9. consider changing a way of building mokotouch-* to do all from one recipe

Now I reject thinking about pushing that into repository.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




