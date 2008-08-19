Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1KVWUI-000413-Gx
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Aug 2008 21:03:26 +0200
Received: from p5b036708.dip.t-dialin.net ([91.3.103.8] helo=localhost)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1KVWTF-0002Do-E1 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2008 21:02:24 +0200
Received: from stefan by localhost with local (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1KVWWK-0003oX-4o
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Aug 2008 21:05:32 +0200
Date: Tue, 19 Aug 2008 21:05:31 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080819190531.GA12385@datenfreihafen.org>
References: <1219122247.7224.337.camel@dfarning.desktop.org>
	<20080819111339.GA19947@datenfreihafen.org>
	<1219168580.7224.447.camel@dfarning.desktop.org>
MIME-Version: 1.0
In-Reply-To: <1219168580.7224.447.camel@dfarning.desktop.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: Sugar Desktop
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
X-List-Received-Date: Tue, 19 Aug 2008 19:03:26 -0000
X-Groupsio-MsgNum: 5759
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello.

On Tue, 2008-08-19 at 12:56, David Farning wrote:
> On Tue, 2008-08-19 at 13:13 +0200, Stefan Schmidt wrote:
> >=20
> > On Tue, 2008-08-19 at 00:04, David Farning wrote:
>=20
> As of last week,  OLPC has started working directly with Fedora to make
> a native Fedora desktop run on the XO.  I hope this leads to more
> upstream interest porting more platforms to the XO.  Currently, OLPC is
> working pretty hard to get 8.2 released.  Please remind me in a couple
> of weeks (in case I forget) to set up some hardware contacts for you.

Made a note. Not sure if this will be really neeed, but having a contact ha=
ndy
is always good.

> We are working with Jason Kridner from TI about doing a port to the
> beagleboard using the OE toolkit.  We are setting up a colobration
> infrastructure at http://elinux.org/BeagleBoardSugar .  From an upstream
> perspective, is this list and the OE wiki the best places to have
> OE/Sugar discussions.

For discussion the ml is indeed the best place. Wiki is of course fine for
documenting your stuff.

How do you plan to work on OE? Do you have some people with commit rights o=
r do
you plan to do patches? While OE is on its way to git they also set up some
policies for contributions.
http://wiki.openembedded.net/index.php/Category:Policy

I have commit right and can help to get easy patches applied. Bigger changes
like bbclasses or other stuff needs review on the list as I'm not really
familiar with it.

regards
Stefan Schmidt

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: http://www.datenfreihafen.org/contact.html

iEYEARECAAYFAkirGXsACgkQbNSsvd31FmVdWwCgsBksMeM8xB59Hac4xk3CdQC8
v2QAnAwhJL+Q18P7rSGg0qmAdcy2GygE
=tK13
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
