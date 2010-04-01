Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1NxMR8-0003sW-ET
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 17:36:02 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id A2B3E140B0; Thu,  1 Apr 2010 17:32:43 +0200 (CEST)
Date: Thu, 1 Apr 2010 17:32:43 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100401153243.GA1950@zlo.nu>
References: <1270119942-11215-1-git-send-email-zlo@zlo.nu>
	<1270120375-11311-1-git-send-email-zlo@zlo.nu>
	<20100401123558.GA20218@rhein.zuhause.netz>
MIME-Version: 1.0
In-Reply-To: <20100401123558.GA20218@rhein.zuhause.netz>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] freetype 2.3.5/2.3.6: Import GetDescender() fix
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
X-List-Received-Date: Thu, 01 Apr 2010 15:36:02 -0000
X-Groupsio-MsgNum: 18338
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline

--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 01, 2010 at 02:35:59PM +0200, Henning Heinold wrote:
> On Thu, Apr 01, 2010 at 01:12:54PM +0200, Marc Olzheim wrote:
> > [PATCH] freetype 2.3.5/2.3.6: Import GetDescender() fix from Savannah f=
rom
> > ftcalc.c 1.79 for Savannah bug report #23556.
> >=20
> > This was fixed by freetype a month after the release of 2.3.6.
>=20
> Thanks for the patch, but it's maybee better to update freetype
> to a recent version.

Yes, but as long as 2.3.5 and 2.3.6 are in the tree (and we use them), I
might as well share the patches for them. ;-)

Marc

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAku0vJsACgkQezjnobFOgrEKPACfbA6/SkZTVNDeIBFAnAWetzKZ
3DMAnRKnyjG46ZlVswPS2Ka2kcj1XOlF
=iUrj
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
