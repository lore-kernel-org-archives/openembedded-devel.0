Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1JZXh1-0001oq-I0
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 21:37:04 +0100
Received: from localhost ([127.0.0.1]) by mx03.dls.net with esmtp (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JZXez-0006bX-I8
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 15:34:49 -0500
MIME-Version: 1.0
X-Mailer: AtMail PHP 5.2
Message-ID: <3908.1205354089@dls.net>
To: <openembedded-devel@lists.openembedded.org>
X-Origin: 209.242.5.110
Date: Wed, 12 Mar 2008 15:34:49 -0500
From: Mike Westerhof <mwester@dls.net>
X-SA-Exim-Connect-IP: 216.145.245.199
X-SA-Exim-Mail-From: mwester@dls.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Wed, 12 Mar 2008 20:37:04 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed 12/03/08  2:00 PM , Koen Kooi koen@dominion.kabel.utwente.nl sent:

> I keep hearing people saying that they have no clue on how to setup a
> git-server for OE where we can commit things as usual, while with hg
> it's just 'hg serve'.

How many people _NEED_ to know how to set up a server, versus how many peop=
le
need to know how to use the client tools?  I think the availability of
end-user-assistance needs to be a prime consideration, lest we end up as we=
 are
now -- where every newbie ends up on the IRC channel asking for help on wha=
t
should be simple operations.

> regards,
>=20
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFH2Cg6MkyGM64RGpERArCvAJ0ZOXNRysB3/I5HNJwuhto25TrXAQCffaad
> VD7lvC0aO123KP3MOPDtweU=3D
> =3DaHj0
> -----END PGP SIGNATURE-----

Mike (mwester)



