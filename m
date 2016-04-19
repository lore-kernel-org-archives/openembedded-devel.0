Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id D6CDD60107
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 15:12:03 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id v188so166421998wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 08:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2gV/4fgZoJLXbbHNkazXT6iWerEyI7HSUIbSOXK5S/c=;
	b=q1cP0PBdAvaXdldAUWdjEUvf6VKNzmR7Er2w53AzbAi5Dmh24X/M7mJAzFj7hicm29
	NdXdMKvySUvnJO46VHgPZfzGRWcq+VMQHCAPVc6vgyzgD202c3H3UG7evjhBDbbU5M2B
	fPl1hivxfvPlLSMjjjFDQ9Dk4n/NEPwgW9n0j24G1jyyM9N5zr3cKYLZwGnrNTh7Tnxj
	cNBO8t6IPGk6jC3agjaPO8Q0m8ZfbJn6rM8NdD/VGIIXxBSndL16jDBBtNe6eNa3+fOa
	o5FdH3fWyszVnTiVXJ/rv6dadQQb8taO2qcPuiyEBNLNMQmRwsCcRj71UsQ60JoA3yLy
	j57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2gV/4fgZoJLXbbHNkazXT6iWerEyI7HSUIbSOXK5S/c=;
	b=VH24/P6ajZm1YTAJhTs8i6WxyxUH3QvvVI0+WRuKa6rVTPbuw+sYOcK221N3nte9Fn
	AOcX3qLIlZu3EhyNeFCt10c5wrOt/AXA/ezQS0xBY1Kg7S4CRj+RQfYp1uWjBu17qyrJ
	rqSxQmhGNJJiTsWvIflhlpAXICShkml9ep/7M+pk8fBbXtNBW/fATGYMLySCB05RqrIW
	jmZBgx8R1hbJx9eTSObrUabOMegwL6yyAs313oPNR3pikh0XB8Q/+nk7qWuqMgDoTx1g
	7eAnrMusKtwhrA7pFR78J/xR/g+Lzs+ZuBfOLneA2sW8/iisUME8hcXOsv3IjdC17tlR
	9qug==
X-Gm-Message-State: AOPr4FV55CFVd6+ZZzb9Gd2Lmr84C4ojeppkGDi/CWfj7b6RQBwU4PcKquXhAR6K8Dtj/g==
X-Received: by 10.194.84.100 with SMTP id x4mr4230223wjy.169.1461078723062;
	Tue, 19 Apr 2016 08:12:03 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	g78sm4798152wme.21.2016.04.19.08.12.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Apr 2016 08:12:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Apr 2016 17:13:54 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160419151354.GE2562@jama>
References: <1461077564-25584-1-git-send-email-christophe.priouzeau@st.com>
MIME-Version: 1.0
In-Reply-To: <1461077564-25584-1-git-send-email-christophe.priouzeau@st.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: Re: [meta-webserver][PATCH v2] netdata: add new recipe
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
X-List-Received-Date: Tue, 19 Apr 2016 15:12:08 -0000
X-Groupsio-MsgNum: 61055
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="maH1Gajj2nflutpK"
Content-Disposition: inline

--maH1Gajj2nflutpK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2016 at 04:52:44PM +0200, Christophe PRIOUZEAU wrote:
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
>  .../recipes-webadmin/netdata/netdata_git.bb        |   46 +
>  4 files changed, 5177 insertions(+)
>  create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0001-=
Correct-Timeout-issue.patch
>  create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/netda=
ta.conf
>  create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/netda=
ta.service
>  create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata_git.bb
=2E..
> diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/netdata.serv=
ice b/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
> new file mode 100644
> index 0000000..bd696b6
> --- /dev/null
> +++ b/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=3DNetdata, Real-time performance monitoring
> +RequiresMountsFor=3D/var
> +
> +[Service]
> +User=3Droot
> +ExecStartPre=3D/bin/mkdir -p /var/log/netdata
> +ExecStartPre=3D/bin/chown -R nobody.netdata /usr/share/netdata/web
> +ExecStartPre=3D/bin/chown -R nobody.netdata /var/cache/netdata
> +ExecStart=3D/usr/sbin/netdata -nd
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/met=
a-webserver/recipes-webadmin/netdata/netdata_git.bb
> new file mode 100644
> index 0000000..b4161af
> --- /dev/null
> +++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
> @@ -0,0 +1,46 @@
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
> +    chmod 4755 ${D}/usr/lib/netdata/netdata/plugins.d/apps.plugin
> +
> +    # Install systemd unit files
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/netdata.service ${D}${systemd_unitdir}/sy=
stem

You should respect systemd in DISTRO_FEATURES when installing the
service file (you can use:
if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
)

Also use the variables for paths in .service file (if netdata build
respects them) as suggested in previous reply.

> +
> +    # Install default netdata.conf
> +    install -d ${D}/etc/netdata
> +    install -m 0644 ${WORKDIR}/netdata.conf ${D}/etc/netdata/
> +}
> +
> +FILES_${PN}-dbg +=3D "/usr/lib/netdata/netdata/plugins.d/.debug"
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

--maH1Gajj2nflutpK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcWSzIACgkQN1Ujt2V2gBybwQCgkdQaqwJ0581cTJl69m/ldVrm
a2MAn2K63Rabe3ih7PGApG5+llQiHAt8
=VmLS
-----END PGP SIGNATURE-----

--maH1Gajj2nflutpK--
