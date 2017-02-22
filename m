Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 00C99730C8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 13:02:07 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id 89so275961wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 05:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ia4d8QFe8Jm+ELaGyog2+Ovmr8mz2Fv1/gYh3r4NXZ4=;
	b=IYDZRQT0Vdlg7U/ZAyD5nv29v9HRlALMuIRKJicFaF1LM/EDYRp28NbdKL8ymuKFgX
	+NyXEbd8rKJvK+Ye/JDpoixSJhuvUnB0iYSMAK/JZm8WzWZQXILQASar9SDEJMwziKN8
	GudQrdW2Jwi/QuHE8s56EaRpdHXQa6wEtdOTZLiBqIb6TrFhu8K9hyjPhjxGIjZ3yLo2
	XkAnvE/gBeOYLLkr5daOmIPiH/Mia1mwSJZ6Y8F6nxVbHgm7MNyajIRc1tZiOKSGDi3q
	qlyOupjwy9YLH0ml/W3oXrUWbWUQAZEZ1DgP1iw/UNb91NQ3uPDy4JnSfj9mE6Y6eBdK
	Rv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ia4d8QFe8Jm+ELaGyog2+Ovmr8mz2Fv1/gYh3r4NXZ4=;
	b=HldP8F7CHdO6ETllh3Z6kcBwVVV+82RtRwRvRI4Mue7E7+wfeR2MzMyOqrgeMsF1WS
	3abHKdciLRCMydnpiz120YqzLtksDCFqccUWxFBNnBsm6baz8pSlecF23/rzTDTZbc9u
	Bsh6jP9bjY2EmlfWZKvdSuxTS9O/p+ZFck8dcrCOQLltEIX3a38vKiAb++7IPEHGQ0c7
	xlbr+88ti0CixTLPDREcxibUBPMl913B34zuJ5iVIhtrstoY4pLWlSgEKBivUFvQnNk4
	IHLM0v+ecSILzTW4CAUVL1acWzItLskqT9Z2Kpe4XGPOXrVeNA2G4jz1igKlQlrCVBnk
	mgFg==
X-Gm-Message-State: AMke39mLW69HzpJpcHGnYK9eggZHcflFBtKYnzt7YzdrTDBAaGqzAkNxaFhrRou49mD/mQ==
X-Received: by 10.223.151.212 with SMTP id t20mr2103004wrb.95.1487768528713;
	Wed, 22 Feb 2017 05:02:08 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 36sm1689923wrz.8.2017.02.22.05.02.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Feb 2017 05:02:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Feb 2017 14:02:08 +0100
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Message-ID: <20170222130208.GB3283@jama>
References: <1487697210-29779-1-git-send-email-ray.kinsella@intel.com>
	<20170221172236.GT8436@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20170221172236.GT8436@mentor.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] [meta-networking] ddclient: new package
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
X-List-Received-Date: Wed, 22 Feb 2017 13:02:08 -0000
X-Groupsio-MsgNum: 65438
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Content-Disposition: inline

--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2017 at 12:22:37PM -0500, Joe MacDonald wrote:
> [[oe] [PATCH]  [meta-networking] ddclient: new package] On 17.02.21 (Tue =
17:13) Ray Kinsella wrote:
>=20
> > Adding the package ddclient. DDClient updates Dynamic DNS servers with =
an IP address.
> > Recipe is based on the original OE recipe found here.
> >=20
> > http://cgit.openembedded.org/openembedded/tree/recipes/ddclient/ddclien=
t_3.6.3.bb
> >=20
> > DDClient version has been updated to 3.8.3.
> >=20
> > Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> > ---
> >  .../recipes-daemons/ddclient/ddclient_3.8.3.bb     | 45 ++++++++++++++=
++++++++
> >  .../recipes-daemons/ddclient/files/ip-up           |  4 ++
> >  2 files changed, 49 insertions(+)
> >  create mode 100644 meta-networking/recipes-daemons/ddclient/ddclient_3=
=2E8.3.bb
> >  create mode 100644 meta-networking/recipes-daemons/ddclient/files/ip-up
> >=20
> > diff --git a/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb=
 b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
> > new file mode 100644
> > index 0000000..723eb67
> > --- /dev/null
> > +++ b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
> > @@ -0,0 +1,45 @@
> > +SECTION =3D "net/misc"
> > +DESCRIPTION =3D "Ddclient is a Perl client used to update dynamic DNS =
entries for accounts on Dynamic DNS Network Services"
> > +HOMEPAGE =3D "http://ddclient.sourceforge.net/"
> > +LICENSE =3D "GPLv2"
> > +PR =3D "r4"
>=20
> We don't need explicit PRs anymore.
>=20
> > +SRC_URI =3D "\
> > +    ${SOURCEFORGE_MIRROR}/ddclient/ddclient-${PV}.tar.bz2 \
> > +    file://ip-up"
> > +
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c3=
17bb3"
> > +
> > +RDEPENDS_${PN} =3D "\
> > +    perl-module-getopt-long \
> > +    perl-module-sys-hostname \
> > +    perl-module-io-socket \
> > +    perl-module-vars \
> > +    perl-module-overload \
> > +    perl-module-overloading \
> > +    perl-module-config \
> > +    perl-module-integer \
> > +    perl-module-exporter-heavy \
> > +    perl-module-symbol \
> > +    perl-module-selectsaver \
> > +    bash \
> > +    perl \
> > +    libio-socket-ssl-perl"

I've added it to master-next, but now I'll drop it again, because
it creates dependency on meta-perl and meta-networking doesn't depend
on meta-perl (at least not yet - good luck with OEDAM plan to separate
meta-perl, meta-python, meta-networking to separate layers).

ERROR: Nothing RPROVIDES 'libio-socket-ssl-perl' (but meta-oe/meta-networki=
ng/recipes-daemons/ddclient/ddclient_3.8.3.bb RDEPENDS on or otherwise requ=
ires it)

> I haven't looked at the download, but I did briefly read the SF documenta=
tion
> and it seems like maybe these would be appropriate as well:
>=20
> do_configure[noexec] =3D "1"
> do_compile[noexec] =3D "1"
>=20
> > +do_install() {
> > +    install -d ${D}${sbindir} ${D}${sysconfdir}/ddclient ${D}${sysconf=
dir}/init.d
> > +    install -d ${D}${sysconfdir}/ppp/ip-up.d/ install -d ${D}${docdir}=
/ddclient
> > +    install -m 755 ${S}/ddclient ${D}${sbindir}
> > +    install ${S}/sample-etc_ddclient.conf ${D}${sysconfdir}/ddclient/d=
dclient.conf
> > +    install -m 755 ${WORKDIR}/ip-up ${D}${sysconfdir}/ppp/ip-up.d/ddcl=
ient
> > +    sed -e 's|/etc/ddclient.conf|/etc/ddclient/ddclient.conf|g' ${S}/s=
ample-etc_rc.d_init.d_ddclient > ${S}/rc_init
> > +    install -m 755 ${S}/rc_init ${D}${sysconfdir}/init.d/ddclient
> > +    install ${S}/README* ${D}${docdir}/ddclient
> > +    install ${S}/COPY* ${D}${docdir}/ddclient
> > +    install ${S}/sample* ${D}${docdir}/ddclient
> > +}
> > +
> > +CONFFILES_${PN} =3D "${sysconfdir}/ddclient/ddclient.conf"
> > +
> > +SRC_URI[md5sum] =3D "3b426ae52d509e463b42eeb08fb89e0b"
> > +SRC_URI[sha256sum] =3D "d40e2f1fd3f4bff386d27bbdf4b8645199b1995d27605a=
886b8c71e44d819591"
> > diff --git a/meta-networking/recipes-daemons/ddclient/files/ip-up b/met=
a-networking/recipes-daemons/ddclient/files/ip-up
> > new file mode 100644
> > index 0000000..52a44f8
> > --- /dev/null
> > +++ b/meta-networking/recipes-daemons/ddclient/files/ip-up
> > @@ -0,0 +1,4 @@
> > +#!/bin/sh
> > +
> > +logger -t ddclient $PPP_IFACE $PPP_LOCAL
> > +ddclient -daemon=3D0 -syslog -use=3Dif -if=3D$PPP_IFACE >/dev/null 2>&1
> > \ No newline at end of file
>=20
> That's odd.  :-)
>=20
> Anyway, I'll have a look at this in more detail when it loops through
> master-next.
>=20
> --=20
> -Joe MacDonald.
> :wq



> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWK2LzwAKCRA3VSO3ZXaA
HArcAJ4ykbumgkHWQz3GoQrlKg2fHnPSNgCggbL3pTDvuy1iYzneOXXL3sOZQmw=
=eeyU
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
