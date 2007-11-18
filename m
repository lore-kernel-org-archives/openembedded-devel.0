Received: from [65.254.253.86] (helo=mailout10.yourhostingaccount.com)
	by linuxtogo.org with esmtp (Exim 4.67) (envelope-from
	<SRS0=5d9tSb=QL=thegnar.org=markgross@yourhostingaccount.com>)
	id 1Itae8-0007PQ-Hp for openembedded-devel@lists.openembedded.org;
	Sun, 18 Nov 2007 04:16:32 +0100
Received: from mailscan02.yourhostingaccount.com ([10.1.15.2]
	helo=mailscan02.yourhostingaccount.com)
	by mailout10.yourhostingaccount.com with esmtp (Exim)
	id 1Ita8f-000583-PI for openembedded-devel@lists.openembedded.org;
	Sat, 17 Nov 2007 21:44:01 -0500
Received: from impout02.yourhostingaccount.com ([10.1.55.2]
	helo=impout02.yourhostingaccount.com)
	by mailscan02.yourhostingaccount.com with esmtp (Exim)
	id 1Ita8f-0004z0-Hp for openembedded-devel@lists.openembedded.org;
	Sat, 17 Nov 2007 21:44:01 -0500
Received: from authsmtp08.yourhostingaccount.com ([10.1.18.8])
	by impout02.yourhostingaccount.com with NO UCE
	id E2k11Y0030ASqTN0000000; Sat, 17 Nov 2007 21:44:01 -0500
X-EN-OrigOutIP: 10.1.18.8
X-EN-IMPSID: E2k11Y0030ASqTN0000000
Received: from pool-71-117-236-31.ptldor.fios.verizon.net ([71.117.236.31]
	helo=desktop) by authsmtp08.yourhostingaccount.com with esmtpa (Exim)
	id 1Ita8e-00047c-6l for openembedded-devel@lists.openembedded.org;
	Sat, 17 Nov 2007 21:44:01 -0500
Received: by desktop (sSMTP sendmail emulation);
	Sat, 17 Nov 2007 18:21:47 -0800
Date: Sat, 17 Nov 2007 18:21:47 -0800
From: mark gross <markgross@thegnar.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071118022147.GA15460@thegnar.org>
References: <20071107112319.GA20128@thegnar.org>
	<200711071507.52756.openembedded@haerwu.biz>
MIME-Version: 1.0
In-Reply-To: <200711071507.52756.openembedded@haerwu.biz>
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
X-EN-UserInfo: 797c2c580f2f40de3d8825fee4eaf462:2545611f8b0606d1227160eb92fd62ea
X-EN-AuthUser: markgross
Sender: mark gross <markgross@thegnar.org>
X-EN-OrigIP: 71.117.236.31
X-EN-OrigHost: pool-71-117-236-31.ptldor.fios.verizon.net
Subject: Re: fectch checker task?
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
X-List-Received-Date: Sun, 18 Nov 2007 03:16:33 -0000
X-Groupsio-MsgNum: 3343
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline

--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 07, 2007 at 03:07:51PM +0100, Marcin Juszkiewicz wrote:
> Dnia =C5=9Broda, 7 listopada 2007, mark gross napisa=C5=82:
> > would it be easy to create a task to do a quick sanity check on all the
> > packages that need to be downloaded for a build?  The linear search for
> > busted fetch calls is quite irritating.
> >
> > What would such a task look like?
> > Is there a way to pass a parameter to the target to just do the fetch
> > step?
>=20
> You mean "bitbake -cfetchall BUILD_TARGET"? This will fetch everything=20
> needed to build BUILD_TARGET.

um, yeah something just like that would be way cool :)

--duh

Thanks.

--mgross

>=20
> --=20
> JID: hrw-jabber.org
> OpenEmbedded developer/consultant
>=20
> as it is Free Software, it is done when enough people helped to make it=
=20
> done
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHP6G7hK5OsmQOmSARAvauAKCRfh+UgXmZzfTAJmkWMiIqEwjDBACeL5OH
C6yK6xpcfmXooZtfCSgyl/I=
=IFZy
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
