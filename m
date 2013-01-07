Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TsFQp-0005rD-0L
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 17:20:17 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r07G4wK2018285
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 Jan 2013 08:04:58 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 7 Jan 2013 08:04:58 -0800
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id E08477FCE	for
	<openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jan 2013 11:03:23 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id DEF1A2414F; Mon,
	7 Jan 2013 11:04:57 -0500 (EST)
Date: Mon, 7 Jan 2013 11:04:57 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130107160457.GF6154@windriver.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
	<1357463568-26241-9-git-send-email-raj.khem@gmail.com>
	<20130106093635.GB3272@jama>
	<CAMKF1sqXMaKrkpicDJLgZuWBzwTo3gyw_N3emL858GZfSZnwHw@mail.gmail.com>
	<20130107153602.GD6154@windriver.com>
	<CAMKF1srqeYHXwFz+e8C8+RTQMX63Fbgck2DnjYia8XLzTqSN4Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srqeYHXwFz+e8C8+RTQMX63Fbgck2DnjYia8XLzTqSN4Q@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH V2 09/25] atftp: Upgrade to latest from git
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
X-List-Received-Date: Mon, 07 Jan 2013 16:20:23 -0000
X-Groupsio-MsgNum: 42565
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0hHDr/TIsw4o3iPK"
Content-Disposition: inline

--0hHDr/TIsw4o3iPK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-oe][PATCH V2 09/25] atftp: Upgrade to latest from git] On 1=
3.01.07 (Mon 08:01) Khem Raj wrote:

> On Monday, January 7, 2013, Joe MacDonald wrote:
>=20
> > Hi Khem,
> >
> > [Re: [oe] [meta-oe][PATCH V2 09/25] atftp: Upgrade to latest from git] =
On
> > 13.01.06 (Sun 17:23) Khem Raj wrote:
> >
> > > On Sun, Jan 6, 2013 at 1:36 AM, Martin Jansa <martin.jansa@gmail.com<=
javascript:;>>
> > wrote:
> > > > On Sun, Jan 06, 2013 at 01:12:32AM -0800, Khem Raj wrote:
> > > >> Add patches to let atftp serve huge ramdisks >500M in size
> > > >
> > > > I don't see this patch
> > > > http://patchwork.openembedded.org/patch/41955/
> > > > in V2, can you update status on patchwork to indicate which patches=
 are
> > > > superseeded by V2 and which are still valid?
> > > >
> > >
> > > I would suggest to actually drop all V1 patches since I have
> > > reshuffled them quite a bit and take all V2 fresh
> > > I have also pushed this latest series into contrib repo
> > >
> > >
> > http://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dkraj/upd=
ates
> >
> > I'm looking at that now.  The only comment / request I have right now is
> > about atftp.  It was on my list of stuff to update and move into
> > meta-networking.  If there's no objection it that, would you mind moving
> > it there at the same time?  I'd been planning to have it in
> > meta-networking/recipes-daemons.
>=20
>=20
> Yes that's ok but I trout of doing the move as a separate step which does
> not have other changes
> For ease of surfing the history in future. It's not only atftpd but there
> are move recipes that need to
> Move into this layer

Okay, that seems reasonable to me.

-J.

>=20
>=20
> >
> > Thanks,
> > -J.
> >
> > >
> > >
> > > > Thanks
> > > >
> > > >>
> > > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > >> ---
> > > >>  .../atftp/{atftp_0.7.bb =3D> atftp_git.bb}           |   18 +--
> > > >>  ...tpd-0.7_circumvent_tftp_size_restrictions.patch |  158
> > ++++++++++++++++++++
> > > >>  .../atftpd-0.7_unprotected_assignments_crash.patch |  145
> > ++++++++++++++++++
> > > >>  3 files changed, 311 insertions(+), 10 deletions(-)
> > > >>  rename meta-oe/recipes-extended/atftp/{atftp_0.7.bb =3D> atftp_gi=
t.bb}
> > (59%)
> > > >>  create mode 100644
> > meta-oe/recipes-extended/atftp/files/atftpd-0.7_circumvent_tftp_size_re=
strictions.patch
> > > >>  create mode 100644
> > meta-oe/recipes-extended/atftp/files/atftpd-0.7_unprotected_assignments=
_crash.patch
> > > >>
> > > >> diff --git a/meta-oe/recipes-extended/atftp/atftp_0.7.bbb/meta-oe/=
recipes-extended/atftp/
> > atftp_git.bb
> > > >> similarity index 59%
> > > >> rename from meta-oe/recipes-extended/atftp/atftp_0.7.bb
> > > >> rename to meta-oe/recipes-extended/atftp/atftp_git.bb
> > > >> index ff1e11d..774dd68 100644
> > > >> --- a/meta-oe/recipes-extended/atftp/atftp_0.7.bb
> > > >> +++ b/meta-oe/recipes-extended/atftp/atftp_git.bb
> > > >> @@ -3,13 +3,16 @@ SECTION =3D "network"
> > > >>  HOMEPAGE =3D "http://packages.debian.org/atftp"
> > > >>  LICENSE =3D "GPLv2"
> > > >>  LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D94d55d512a9ba36caa9b7df079bae19f"
> > > >> -PR =3D "r4"
> > > >> +PV =3D "0.7.1+git${SRCPV}"
> > > >>
> > > >> -SRC_URI =3D
> > "${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg.orig.tar.gz;name=3Darch=
ive \
> > > >> -
> > ${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg-11.diff.gz;name=3Dpatch \
> > > >> -           file://atftpd.init"
> > > >> +SRCREV =3D "be3291a18c069ae23a124ffdc56d64a5ff0bbec7"
> > > >>
> > > >> -S =3D "${WORKDIR}/atftp-${PV}.dfsg"
> > > >> +SRC_URI =3D "git://
> > atftp.git.sourceforge.net/gitroot/atftp/atftp;protocol=3Dgit \
> > > >> +           file://atftpd-0.7_circumvent_tftp_size_restrictions.pa=
tch
> > \
> > > >> +           file://atftpd-0.7_unprotected_assignments_crash.patch \
> > > >> +           file://atftpd.init \
> > > >> +          "
> > > >> +S =3D "${WORKDIR}/git"
> > > >>
> > > >>  inherit autotools update-rc.d useradd
> > > >>
> > > >> @@ -35,8 +38,3 @@ PACKAGES =3D+ "atftpd"
> > > >>  FILES_${PN} =3D "${bindir}/*"
> > > >>
> > > >>  FILES_${PN}d =3D "${sbindir}/* ${sysconfdir}/init.d/* /srv/tftp"
> > > >> -
> > > >> -SRC_URI[archive.md5sum] =3D "aa269044a6f992eca78fee2f6119643c"
> > > >> -SRC_URI[archive.sha256sum] =3D
> > "18815f5b67290fac087c6b9da28dfa5e0feb722096f5c5de52e59b46026da559"
> > > >> -SRC_URI[patch.md5sum] =3D "1636f199bf32c754a7bf34a5c647d138"
> > > >> -SRC_URI[patch.sha256sum] =3D
> > "0df33f6c09c2b2de58a84d7bb757844fc9538cd4d6c8d9c463da5270ebc2e41d"
> > > >> diff --git
> > a/meta-oe/recipes-extended/atftp/files/atftpd-0.7_circumvent_tftp_size_=
restrictions.patch
> > b/meta-oe/recipes-extended/atftp/files/atftpd-0.7_circumvent_tftp_size_=
restrictions.patch
> > > >> new file mode 100644
> > > >> index 0000000..9aeb351
> > > >> --- /dev/null
> > -Joe MacDonald.
> > :wq
> >
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--0hHDr/TIsw4o3iPK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlDq8ikACgkQPN8S4W6ZZndM3gCfTXlWdWrUTmdgJVC6JY2yf53p
hPYAnRDaqizoisY7DvXEUeB67dIsrGhu
=2eO6
-----END PGP SIGNATURE-----

--0hHDr/TIsw4o3iPK--
