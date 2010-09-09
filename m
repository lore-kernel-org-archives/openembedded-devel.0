Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Otjqx-0003nV-4M for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 18:20:03 +0200
Received: from f053038077.adsl.alicedsl.de ([78.53.38.77]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OtjqI-0004Jp-BB for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 16:19:18 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310BFAA0F@dlee06.ent.ti.com>
References: <1283969035-1397-1-git-send-email-chase.maupin@ti.com>
	<1283982455.21233.48.camel@mattotaupa>
	<131E5DFBE7373E4C8D813795A6AA7F080310BFAA0F@dlee06.ent.ti.com>
Date: Thu, 09 Sep 2010 18:19:15 +0200
Message-ID: <1284049155.3948.54.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] common_use_cases: add description of SOC_FAMILY
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
X-List-Received-Date: Thu, 09 Sep 2010 16:20:09 -0000
X-Groupsio-MsgNum: 23395
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-X1ikfWOOcbmjFoNZ8Vsn"

--=-X1ikfWOOcbmjFoNZ8Vsn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 09.09.2010, 07:09 -0500 schrieb Maupin, Chase:
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Paul Menzel
> > Sent: Wednesday, September 08, 2010 4:48 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [PATCHv2] common_use_cases: add description of
> > SOC_FAMILY
> >=20
> > Am Mittwoch, den 08.09.2010, 13:03 -0500 schrieb Chase Maupin:
> > > * Added a description of the SOC_FAMILY variable that
> > >   can be set in the machine configuration files.
> > >
> > > Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> > > ---
> > >  docs/usermanual/chapters/common_use_cases.xml |   24
> > ++++++++++++++++++++++++
> > >  1 files changed, 24 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/docs/usermanual/chapters/common_use_cases.xml
> > b/docs/usermanual/chapters/common_use_cases.xml
> > > index d86d0ca..ef81b95 100644
> > > --- a/docs/usermanual/chapters/common_use_cases.xml
> > > +++ b/docs/usermanual/chapters/common_use_cases.xml
> > > @@ -94,6 +94,30 @@ SRCDATE =3D "20061014"
> > >          </listitem>
> > >        </itemizedlist></para>
> > >
> > > +    <para>There are also some optional variables that can be defined=
:
> > > +    <itemizedlist>
> > > +    <listitem>
> > > +          <para><command>SOC_FAMILY</command> describes a family of =
processors
> > > +            that all share common features such as kernel versions,
> > > +            bootloaders, etc.  This is used to allow overrides for a=
 whole
> >=20
> > I think a full stop is required even if there is an abbreviation in
> > front of it. =E2=86=92 etc..

> I'm afraid I don't understand what you are asking to have fixed.  Are you=
 saying you want it to be etc.. instead of etc.
>=20
> Just want to clarify before I remake this patch.

I verified it again and it looks like I am wrong and it is handled
differently in English than in German [1][2]. I am sorry for the noise.

[=E2=80=A6]

> > Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

[=E2=80=A6]


Thanks,

Paul


[1] https://secure.wikimedia.org/wikipedia/en/wiki/Full_stop#Abbreviations
[2] http://www.talktalk.co.uk/reference/dictionaries/english/data/d0082120.=
html

--=-X1ikfWOOcbmjFoNZ8Vsn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyJCQMACgkQPX1aK2wOHVhi0gCdEhcJDeLCG2k0f+34qId4CNYX
Bk4AoIyh10nXvF5NBWJ3E2md6+fFJwjF
=mSRt
-----END PGP SIGNATURE-----

--=-X1ikfWOOcbmjFoNZ8Vsn--
