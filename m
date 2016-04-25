Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3818A606BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 14:01:48 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1auh5B-000736-2f from Joe_MacDonald@mentor.com ;
	Mon, 25 Apr 2016 07:01:49 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 25 Apr 2016 07:01:49 -0700
Received: by burninator (Postfix, from userid 1000)	id 1076F5805F3; Mon, 25
	Apr 2016 10:01:48 -0400 (EDT)
Date: Mon, 25 Apr 2016 10:01:48 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: George McCollister <george.mccollister@gmail.com>, Armin Kuster
	<akuster808@gmail.com>
Message-ID: <20160425140147.GB5188@mentor.com>
References: <1461013253-2350-1-git-send-email-joe_macdonald@mentor.com>
	<CAFSKS=OrhdjemW+1t1uMpGUbcnP0s5JX59Z4mvv_hqPpwBXG_w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFSKS=OrhdjemW+1t1uMpGUbcnP0s5JX59Z4mvv_hqPpwBXG_w@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Update Samba
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Apr 2016 14:01:50 -0000
X-Groupsio-MsgNum: 61148
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Content-Disposition: inline

--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] Update Samba] On 16.04.22 (Fri 11:30) George McCollister wrote:

> I'm looking forward to seeing these changes in krogoth as what is in
> there now is unusable from a security standpoint. I cherry picked the
> patches to krogoth and my builds suceeded but haven't gotten around to
> doing any operational testing yet.

Agreed.

Armin:  I've already done one merge directly to krogoth to resolve a
build breakage, but since you're maintaining the branch I didn't want to
do any additional ones (even though we started talking about samba
specifically in the krogoth context) without an explicit go-ahead from
you.

Do you want me to send you a patch set, a pull request or do you want me
to merge the samba changes directly?

-J.

>=20
> -George
>=20
> On Mon, Apr 18, 2016 at 4:00 PM, Joe MacDonald <joe_macdonald@mentor.com>=
 wrote:
> > I'm still doing some testing on this and I haven't built for all the
> > architectures yet, but it passed at least the most basic smoke-test.  G=
iven the
> > number of outstanding CVEs against our current version of Samba (thanks=
 Armin!
> > :-)) I think it's best fo rus to update this rather than trying to do a=
ny
> > back-ports, but that also introduces a not-inconsiderable level of risk=
 for
> > Samba users.  So please, if you're one of them, kick the tires on this =
as soon
> > as you can (or ping me back letting me know what your thoughts are on t=
his, at
> > least).
> >
> > Thanks all.
> >
> > --
> > -Joe MacDonald.
> > :wq
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
--=20
-Joe MacDonald.
:wq

--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXHiNLAAoJEEn8ffcsOfaWEr4H/0dqN4igosspqE5uuIyisRej
NpnJiW4Q79JOo0LTyPx5vS0nf//QBXE5Zx6y6dboVdg0+QPsa1qCpQFZM4w7ELF3
SmVrWTuf7FNaOqoKKPg/OrVQDD/5gqrxpOqA/Kgg7fB/1Iki4k+4p1SM3XhvcMIo
XTvmbmPzhdYCWWsN4pUfUCFTR4qivRjZeekz3W0lfFwQRRq2g02svzPTLimIcMYv
QRUAfMh9IwCl9tQjV8QinFALp/mGqLPwhMxy+1R/y8/rrnrz8A4IDlNQ3zf99dep
kUJJ1tPKuVunYPmTDaJD5lxq0J5LZOjZ6miPYmi9rxAIgl3IQKe8of/kUC6qgFU=
=hmhK
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--
