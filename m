Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id D428D60107
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2016 11:49:35 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id v188so241166751wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2016 04:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1KTs1NozU9jf7UJenbjBEdXD33z4uLiYWOa5hMX5/JI=;
	b=EJh4vS/FnQ8VC5hANHVr/DqdRX+fKxL0BCqCsZ5BJ+ZqEzQ7ytRBca1ckba3u49Kgs
	RALYkqhxkkAW/BQDd8jQ46Dozme3WWsEisUbWM+XGAFuOnd1W964qjvhi/p7im5SspOj
	hNk98aElc10VRYNd79THgS5PcnMOfoc3iFlBL9TXBBEmwh6U4DnMUs6xfn4iL7BlUA8Z
	XxdOVsYOoIrz5ND4IKsju/TXVM9Z521y0JVKGf1oEbboy302m22mbOUxJbnyybv/LcaO
	PLiQHntSEE/CE4pnqCO9LR/f8ksiFxvOZVtB08NOJl8gyEoOqnTWajjzmWIMhkwDABxm
	+dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1KTs1NozU9jf7UJenbjBEdXD33z4uLiYWOa5hMX5/JI=;
	b=nFRMVWWAgnBO3TSK7lIlZ6JGGhEH08fouT7De9z79uJD1Gr4SKWBU2BQ28Ej1YtUNR
	yJStt7ecyxdGXwJPT3SfVWkzGSdUz47aAHd8FbFPe9+nBBrewFHk7284ge71ODIDp5W9
	4G/q18AsQBoWSdlxwfNKL6BijUIGs9OvQPKRncFUxfviiLY9Gb8KlbrogWguhnwtCuvJ
	W6b3ZKTmf2nP+Xu9JCro7zDaAZ8wuS4UIh2dc2FQ5j1cYol9wOm+NQdnlT0lN3Y1gGl6
	mibeCTMbEXvikp1Z9/h2G/oCW0qm4ELDyRPiPpCcrmbiECOzGZQbKF+mrh3Ij0t1OfDh
	q7mA==
X-Gm-Message-State: AOPr4FWdhjuVPpMZWK8rljRjiHqg4iY7QJ1NfuJJ0LcGN6zfBtrF5jIDlgC2CmONxyn4sg==
X-Received: by 10.194.89.38 with SMTP id bl6mr13483208wjb.44.1461239375807;
	Thu, 21 Apr 2016 04:49:35 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	e12sm2888959wma.15.2016.04.21.04.49.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Apr 2016 04:49:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 21 Apr 2016 13:51:59 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160421115159.GB2240@jama>
References: <1461238172-2868-1-git-send-email-christophe.priouzeau@st.com>
MIME-Version: 1.0
In-Reply-To: <1461238172-2868-1-git-send-email-christophe.priouzeau@st.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: Re: [meta-webserver][PATCH v4] netdata: add new recipe
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
X-List-Received-Date: Thu, 21 Apr 2016 11:49:36 -0000
X-Groupsio-MsgNum: 61099
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline

--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2016 at 01:29:32PM +0200, Christophe PRIOUZEAU wrote:
> Netdata are a performance monitoring tools for Linux systems, application=
s.
> Netdata interface are available via http on port 19999:
>  http://<ip address>:19999
>=20
> Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
> ---
>  .../netdata/0001-Correct-Timeout-issue.patch       |   35 +
>  .../recipes-webadmin/netdata/netdata/netdata.conf  | 5083 ++++++++++++++=
++++++
>  .../netdata/netdata/netdata.service                |   13 +
>  .../recipes-webadmin/netdata/netdata_git.bb        |   52 +
>  4 files changed, 5183 insertions(+)
>  create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0001-=
Correct-Timeout-issue.patch
>  create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/netda=
ta.conf
>  create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/netda=
ta.service
>  create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata_git.bb
>=20
> diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/met=
a-webserver/recipes-webadmin/netdata/netdata_git.bb
> new file mode 100644
> index 0000000..817090e
> --- /dev/null
> +++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
> @@ -0,0 +1,52 @@
> +HOMEPAGE =3D "https://github.com/firehol/netdata/"
> +SUMMARY =3D "Real-time performance monitoring"
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D747afe070ea9d6c2be0a313536=
09a35b"
> +
> +SRC_URI =3D "git://github.com/firehol/netdata.git;protocol=3Dhttps"
> +SRCREV =3D "36c1304e37094174ea51001903058e65053107ca"
> +
> +# patch to disable timeout because timeout are not available with actual=
 version
> +# of core-utils
> +SRC_URI +=3D "file://0001-Correct-Timeout-issue.patch"
> +
> +# default netdata.conf for netdata configuration
> +SRC_URI +=3D "file://netdata.conf"
> +
> +# file for providing systemd service support
> +SRC_URI +=3D "file://netdata.service"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit pkgconfig autotools useradd systemd
> +
> +#systemd
> +SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_SERVICE_${PN} =3D "netdata.service"
> +SYSTEMD_AUTO_ENABLE_${PN} =3D "enable"
> +
> +#User specific
> +USERADD_PACKAGES =3D "${PN}"
> +GROUPADD_PARAM_${PN} =3D "--system netdata"
> +
> +do_install_append() {
> +    #set S UID for plugins
> +    chmod 4755 ${D}${libdir_native}/netdata/netdata/plugins.d/apps.plugin

Why libdir_native (_native suffix also in other variables) when this is
target recipe?

> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> +        # Install systemd unit files
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/netdata.service ${D}${systemd_unitdir=
}/system
> +        sed -i -e 's,@@datadir,${datadir_native},g' ${D}${systemd_unitdi=
r}/system/netdata.service
> +    fi
> +
> +    # Install default netdata.conf
> +    install -d ${D}${sysconfdir_native}/netdata
> +    install -m 0644 ${WORKDIR}/netdata.conf ${D}${sysconfdir_native}/net=
data/
> +    sed -i -e 's,@@sysconfdir,${sysconfdir_native},g' ${D}${sysconfdir_n=
ative}/netdata/netdata.conf
> +    sed -i -e 's,@@libdir,${libdir_native},g' ${D}${sysconfdir_native}/n=
etdata/netdata.conf
> +    sed -i -e 's,@@datadir,${datadir_native},g' ${D}${sysconfdir_native}=
/netdata/netdata.conf
> +}
> +
> +FILES_${PN}-dbg +=3D "/usr/lib/netdata/netdata/plugins.d/.debug"

This should respect libdir variable as well.

> +RDEPENDS_${PN} =3D "bash"
> --
> 1.9.1
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcYvL0ACgkQN1Ujt2V2gBwkMgCdGvou6nllwgrMxy2a99XsK8lu
Qq0AoKXgC5S4irMgB3XE3fhUMv4fSh74
=pJee
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--
