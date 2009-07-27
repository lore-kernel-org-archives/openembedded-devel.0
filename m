Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MVM3o-0001Re-3X
	for openembedded-devel@openembedded.org; Mon, 27 Jul 2009 10:59:56 +0200
Received: (qmail 32250 invoked by uid 813007); 27 Jul 2009 08:45:16 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 27 Jul 2009 08:45:16 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jul 2009 10:44:39 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc3-00104-g3553fe1; KDE/4.2.96; x86_64; ;
	)
References: <alpine.LFD.2.00.0907250800110.9021@localhost>
	<alpine.LFD.2.00.0907251719260.3720@localhost>
	<200907270743.12287.holger+oe@freyther.de>
In-Reply-To: <200907270743.12287.holger+oe@freyther.de>
MIME-Version: 1.0
Message-Id: <200907271044.40262.marcin@juszkiewicz.com.pl>
Subject: Re: getting bitbake-1.8.12 for the org.openembedded.dev branch?
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
X-List-Received-Date: Mon, 27 Jul 2009 08:59:56 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=C5=82ek, 27 lipca 2009 o 07:43:12 Holger Hans Peter Freyther=
=20
napisa=C5=82(a):

> Marcin, Koen. Do you switch from dev to stable? How do you do that?
> Do you have two complete build trees for stable/dev?

I have OE metadata in ~/devel/oe/openembedded/ and use it to any builds=20
which use .dev branch. I also use that directory for all pushing stuff=20
(for .dev, stable/2009 and others).

Builds are stored in ~/devel/build/NAME-OF-BUILD/ directory. They are=20
mostly from .dev tree.

To build from stable/2009 I have ~/devel/build/stable/ directory which=20
contains copy of OE metadata (without pushing).

=46or .dev builds I use Bitbake from ~/devel/bitbake/ which contains GIT=20
tree with master (1.9.x) branch selected.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




