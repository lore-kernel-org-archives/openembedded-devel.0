Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GuShO-0007nU-L9
	for openembedded-devel@openembedded.org; Wed, 13 Dec 2006 12:54:58 +0100
Received: (qmail 1026 invoked by uid 813007); 13 Dec 2006 11:48:34 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 13 Dec 2006 11:48:34 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
Organization: OpenEmbedded
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Dec 2006 12:48:27 +0100
User-Agent: KMail/1.9.5
References: <E1GuDwk-0002kI-IJ@linuxtogo.org>
	<193365758.20061212220007@vanille-media.de>
	<200612130851.38002.openembedded@hrw.one.pl>
In-Reply-To: <200612130851.38002.openembedded@hrw.one.pl>
MIME-Version: 1.0
Message-Id: <200612131248.27578.openembedded@hrw.one.pl>
Subject: Re: [oe-commits] org.oe.dev removal.txt: Push bluez*2.* removal to a month later, as it is known to be used by OPIE.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Dec 2006 11:54:58 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =B6roda, 13 grudnia 2006 08:51, Marcin Juszkiewicz napisa=B3:
> Dnia wtorek, 12 grudnia 2006 22:00, Michael 'Mickey' Lauer napisa=B3:

> > The advantage of Opie fitting into 14.5MB flash like on Sharp SL5500
> > would be void then.

> OPIE from .dev already is hard to fit - qte-mt with Japanese support is
> larger.

16.469.224 opie-image-collie-20061213112019.rootfs.jffs2

Thats openzaurus-unstable/collie build of today.=20

OPIE is hard to build from .dev - rtti/no-rtti problems from time to time=20
(opie-alarm/qcop/rdesktop are not buildable without linking with g++ or=20
changing CFLAGS).

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

             I do not fear computers. I fear the lack of them.
             		-- Isaac Asimov




