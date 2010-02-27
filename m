Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NlRj1-0006v0-Bo
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Feb 2010 19:49:19 +0100
Received: (qmail 10722 invoked by uid 813007); 27 Feb 2010 18:46:29 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 27 Feb 2010 18:46:29 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Feb 2010 19:45:17 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.3.4; x86_64; ;
	)
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
	<201002271904.22479.marcin@juszkiewicz.com.pl>
	<ac9c93b11002271040i221bdb10o22cad1cf1551b6fb@mail.gmail.com>
In-Reply-To: <ac9c93b11002271040i221bdb10o22cad1cf1551b6fb@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201002271945.18454.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] recipes/images/${distro}
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
X-List-Received-Date: Sat, 27 Feb 2010 18:49:19 -0000
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Dnia sobota, 27 lutego 2010 o 19:40:32 Frans Meulenbroeks napisa=B3(a):

> I just wanted to suggest a more sensible and clear naming scheme and
> clean up a little bit, but apparently this is not appreciated :-(

> (and yes, I also think it makes sense to remove old orphaned unused
> 5-year-old recipes, but guess I'm alone here too).

The problem is that we do not know who uses them. We can remove ones which =
no=20
one is using or alter them in any way - thats why we are using SCM so users=
=20
can revert any change.

> Guess I'd better not propose to remove some of those 26 (yes,
> twenty-six!) glib recipes (or 8 abiword recipes )

Oh cleanups... Too much things to get cleaned, reorganized etc :(

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




