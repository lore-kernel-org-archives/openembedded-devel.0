Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Ngh8t-0000ex-DG
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 17:16:22 +0100
Received: from p5b037fca.dip.t-dialin.net ([91.3.127.202] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Ngh6C-00032y-S1 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 17:13:44 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1Ngh69-0001bV-5W
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 17:13:30 +0100
Date: Sun, 14 Feb 2010 17:13:28 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100214161328.GE5979@excalibur.local>
References: <20100213203508.540D614AF55@gandalf.denix.org>
	<20100214130905.GD5979@excalibur.local>
	<1266162635.5009.42.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1266162635.5009.42.camel@mattotaupa>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Update state in Patchwork. (was: [PATCH] meta-toolchain: Run rmdir only if empty dirs are actually found.)
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
X-List-Received-Date: Sun, 14 Feb 2010 16:16:24 -0000
X-Groupsio-MsgNum: 16767
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Content-Disposition: inline

--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello.

On Sun, 2010-02-14 at 16:50, Paul Menzel wrote:
>=20
> Am Sonntag, den 14.02.2010, 14:09 +0100 schrieb Stefan Schmidt:
> > On Sat, 2010-02-13 at 20:34, Denys Dmytriyenko wrote:
> > > > Prevent a failure in do_populate_sdk when there are no empty
> > > > directories:
> > > >    /bin/rmdir: missing operand
> > > >    Try `/bin/rmdir --help' for more information.
> > > >
> > > > See also http://tinderbox.openembedded.net/packages/478437/
> > > >
> > > > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> > > Acked-by: Denys Dmytriyenko <denis@denix.org>
> >=20
> > Acked and pushed. Now I need to find out how to update patchwork with t=
he new
> > status...
>=20
> 1. Register an account at [1].

Already done.

> 2. Update the state.

How? The webinterface does not offer my the functionality to change the sta=
te. I
guess it is because I'm not in the right group or have otherwise not enough
permissions in patchwork. As I just registered the account today it could be
that I'm to late in the game to get updated with the rights in the last bat=
ch.
:)

regards
Stefan Schmidt

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: http://www.datenfreihafen.org/contact.html

iEYEARECAAYFAkt4ISgACgkQbNSsvd31FmW7zwCfYMLpohfX4NBqtwV0nTewZppN
i5EAoKeYZhFxJnID7wXU2k5r7qO2HYjF
=KBAM
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
