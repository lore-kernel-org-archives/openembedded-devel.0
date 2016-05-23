Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C1010601A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2016 18:57:19 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q62so17811582wmg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2016 11:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7dhdT1MKcgZTSKrjfftu9iuFvZ3JyMMMF9g269jnp/Y=;
	b=I7Tzr/8u0bS/KM6CsbyyGzZ9CvY28RE7M6kUXwREEHh1S0cZEb+9g+npRFhDYpztAb
	wW/SCPWP/8bDeYoV+eWRjG8CF3i0Fv1Uwkh87kfctTRcLfFMLmLEIiqQC+aquyNWMUTF
	hbJqNvtSmKUMuI8BczKLtxfbtvsHiEtgyzHN+iKQX1u2QEfYDl6V2nEogxyr08rMfkwO
	FDPz1d1lzP4SJlqq74VUDTq/AWHFAhBxQ73Zqh8RDm4Z/ebfV/sT+f546Xz0BuX2MGIY
	Zl6CpNNSF64EGG9mcG0Bk6BZM50qhPDZ37NNoYVH4qIpH00qwS40XgLZzyCu2rAXqE5P
	ASYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7dhdT1MKcgZTSKrjfftu9iuFvZ3JyMMMF9g269jnp/Y=;
	b=CqWwUknCXLfpuT7K6fw0bdu/YWs8jfJJpRf+aW82g8gaXOttNwavV4LgBZvcNsLG/8
	1AXgYm0NjxLk+es52ak4alF78c46/1/S7KlDc3oMIy9RaniLvI68+cyk3pQZBI3GWciD
	Cb6phqkog8JYyvFJyRzGk5LJfvHgh1sa4K5R2s5ZdQk6DIghrFjVtxhVgiG5HIRA4tYU
	RoGBOzwt4u/ftpYacwkaV12RqD0O4Qzl9AklqQ3p9Fpw7NeEi3e59bWqQqgfpG/+gTuh
	Ae/UYOwBI5uzaiJ92uwp1Aif1veKTu7mYOXbNy8lcyaG/2NSqyX91DvOHR3ggGrvUhZK
	5SAw==
X-Gm-Message-State: ALyK8tLYLLsUGqGXhDgEDHS7Q1Irbv8IuA3QfQXC4L8v8RKHir97jYeSer3AKU4s3XcnNA==
X-Received: by 10.194.184.169 with SMTP id ev9mr317275wjc.27.1464029839770;
	Mon, 23 May 2016 11:57:19 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lf9sm36734266wjc.44.2016.05.23.11.57.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 May 2016 11:57:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 23 May 2016 20:58:15 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160523185815.GB2560@jama>
References: <1463439882-26273-1-git-send-email-schnitzeltony@googlemail.com>
	<1463439882-26273-3-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1463439882-26273-3-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [PATCH 3/3] geany-plugins: initial add 1.27
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
X-List-Received-Date: Mon, 23 May 2016 18:57:22 -0000
X-Groupsio-MsgNum: 61583
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Content-Disposition: inline

--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2016 at 01:04:42AM +0200, Andreas M=FCller wrote:
> geany-plugins comes around as a loose collection of modules. I thought ab=
out
> using PACKAGES_DYNAMIC but this way seems better maintainable:
>=20
> * a removed plugin will at least complain for license file missing
> * a new plugin will complain for unpacked files
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../recipes-devtools/geany/geany-plugins_1.27.bb   | 216 +++++++++++++++=
++++++
>  1 file changed, 216 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
>=20
> diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb b/meta-=
oe/recipes-devtools/geany/geany-plugins_1.27.bb
> new file mode 100644
> index 0000000..08f79bb
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
> @@ -0,0 +1,216 @@
> +DESCRIPTION =3D "A fast and lightweight IDE"
> +HOMEPAGE =3D "http://plugins.geany.org/"
> +# majority's default
> +LICENSE =3D "GPLv2"
> +
> +DEPENDS =3D "geany lua libxml2 libsoup-2.4 vte enchant intltool-native l=
ibassuan gpgme"
> +
> +inherit autotools pkgconfig gtk-icon-cache
> +
> +SRC_URI =3D "http://plugins.geany.org/${PN}/${PN}-${PV}.tar.bz2"
> +SRC_URI[md5sum] =3D "31e4aa4b771a4ff8ccfd74efe7ba7b44"
> +SRC_URI[sha256sum] =3D "03195a0b7a361ddb2ee4138f46fa87b6d9b9801ff0065745=
6ab9c8b8908c0ce0"

Now it started failing in world builds with:
autoreconf: configure.ac: not using Gettext
autoreconf: running: aclocal --system-acdir=3D
/tmp-glibc/work/core2-64-oe-linux/geany-plugins/1.27-r0/build/aclocal-copy/
-I
/tmp-glibc/work/core2-64-oe-linux/geany-plugins/1.27-r0/geany-plugins-1.27/=
build/
-I
/tmp-glibc/work/core2-64-oe-linux/geany-plugins/1.27-r0/geany-plugins-1.27/=
build/
--force -I build/cache -I build -I build/bundled -I geanypy/m4 --install
build/cache/glib-gettext.m4:39: error: m4_copy: won't overwrite defined
macro: glib_DEFUN
build/cache/glib-gettext.m4:39: the top level
autom4te: m4 failed with exit status: 1
aclocal: error: echo failed with exit status: 1
autoreconf: aclocal failed with exit status: 1
WARNING: exit code 1 from a shell command.
ERROR: autoreconf execution failed.
ERROR: Function failed: do_configure (log file is located at
/tmp-glibc/work/core2-64-oe-linux/geany-plugins/1.27-r0/temp/log.do_configu=
re.9960)

http://errors.yoctoproject.org/Errors/Details/64645/

> +
> +FILES_${PN} +=3D "${datadir}/icons"
> +FILES_${PN}-dev +=3D "${libdir}/geany/*.la ${libdir}/${PN}/*/*.la"
> +
> +PLUGINS +=3D "${PN}-addons"
> +LIC_FILES_CHKSUM +=3D "file://addons/COPYING;md5=3D4325afd396febcb659c36=
b49533135d4"
> +FILES_${PN}-addons =3D "${libdir}/geany/addons.so"
> +RDEPENDS_${PN}-addons =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-autoclose"
> +LIC_FILES_CHKSUM +=3D "file://autoclose/COPYING;md5=3D751419260aa954499f=
7abaabaa882bbe"
> +FILES_${PN}-autoclose =3D "${libdir}/geany/autoclose.so"
> +RDEPENDS_${PN}-autoclose =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-automark"
> +LIC_FILES_CHKSUM +=3D "file://automark/COPYING;md5=3D751419260aa954499f7=
abaabaa882bbe"
> +FILES_${PN}-automark =3D "${libdir}/geany/automark.so"
> +RDEPENDS_${PN}-automark =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-codenav"
> +LIC_FILES_CHKSUM +=3D "file://codenav/COPYING;md5=3D751419260aa954499f7a=
baabaa882bbe"
> +FILES_${PN}-codenav =3D "${libdir}/geany/codenav.so"
> +RDEPENDS_${PN}-codenav =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-commander"
> +LIC_FILES_CHKSUM +=3D "file://commander/COPYING;md5=3Dd32239bcb673463ab8=
74e80d47fae504"
> +LICENSE_${PN}-commander =3D "GPLv3"
> +FILES_${PN}-commander =3D "${libdir}/geany/commander.so"
> +RDEPENDS_${PN}-commander =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-debugger"
> +LIC_FILES_CHKSUM +=3D "file://debugger/COPYING;md5=3D4325afd396febcb659c=
36b49533135d4"
> +FILES_${PN}-debugger =3D "${libdir}/geany/debugger.so ${datadir}/${PN}/d=
ebugger"
> +RDEPENDS_${PN}-debugger =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-defineformat"
> +LIC_FILES_CHKSUM +=3D "file://defineformat/COPYING;md5=3D751419260aa9544=
99f7abaabaa882bbe"
> +FILES_${PN}-defineformat =3D "${libdir}/geany/defineformat.so"
> +RDEPENDS_${PN}-defineformat =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-devhelp"
> +LIC_FILES_CHKSUM +=3D "file://devhelp/COPYING;md5=3Dd32239bcb673463ab874=
e80d47fae504"
> +LICENSE_${PN}-devhelp =3D "GPLv3"
> +FILES_${PN}-devhelp =3D "${libdir}/geany/devhelp.so"
> +RDEPENDS_${PN}-devhelp =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-geanyctags"
> +LIC_FILES_CHKSUM +=3D "file://geanyctags/COPYING;md5=3Dc107cf754550e6575=
5c42985a5d4e9c9"
> +FILES_${PN}-geanyctags =3D "${libdir}/geany/geanyctags.so"
> +RDEPENDS_${PN}-geanyctags =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-geanydoc"
> +LIC_FILES_CHKSUM +=3D "file://geanydoc/COPYING;md5=3Dd32239bcb673463ab87=
4e80d47fae504"
> +LICENSE_${PN}-geanydoc =3D "GPLv3"
> +FILES_${PN}-geanydoc =3D "${libdir}/geany/geanydoc.so"
> +RDEPENDS_${PN}-geanydoc =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-geanyextrasel"
> +LIC_FILES_CHKSUM +=3D "file://geanyextrasel/COPYING;md5=3Dc107cf754550e6=
5755c42985a5d4e9c9"
> +FILES_${PN}-geanyextrasel =3D "${libdir}/geany/geanyextrasel.so"
> +RDEPENDS_${PN}-geanyextrasel =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-geanyinsertnum"
> +LIC_FILES_CHKSUM +=3D "file://geanyinsertnum/COPYING;md5=3Dc107cf754550e=
65755c42985a5d4e9c9"
> +FILES_${PN}-geanyinsertnum =3D "${libdir}/geany/geanyinsertnum.so"
> +RDEPENDS_${PN}-geanyinsertnum =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-geanylatex"
> +LIC_FILES_CHKSUM +=3D "file://geanylatex/COPYING;md5=3Dc107cf754550e6575=
5c42985a5d4e9c9"
> +FILES_${PN}-geanylatex =3D "${libdir}/geany/geanylatex.so"
> +RDEPENDS_${PN}-geanylatex =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-geanylipsum"
> +LIC_FILES_CHKSUM +=3D "file://geanylipsum/COPYING;md5=3D4325afd396febcb6=
59c36b49533135d4"
> +FILES_${PN}-geanylipsum =3D "${libdir}/geany/geanylipsum.so"
> +RDEPENDS_${PN}-geanylipsum =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-geanylua"
> +LIC_FILES_CHKSUM +=3D "file://geanylua/COPYING;md5=3D4325afd396febcb659c=
36b49533135d4"
> +FILES_${PN}-geanylua =3D "${libdir}/geany/geanylua.so ${libdir}/${PN}/ge=
anylua/*.so"
> +RDEPENDS_${PN}-geanylua =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-geanymacro"
> +LIC_FILES_CHKSUM +=3D "file://geanymacro/COPYING;md5=3Dc107cf754550e6575=
5c42985a5d4e9c9"
> +FILES_${PN}-geanymacro =3D "${libdir}/geany/geanymacro.so"
> +RDEPENDS_${PN}-geanymacro =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-geanyminiscript"
> +LIC_FILES_CHKSUM +=3D "file://geanyminiscript/COPYING;md5=3D4325afd396fe=
bcb659c36b49533135d4"
> +FILES_${PN}-geanyminiscript =3D "${libdir}/geany/geanyminiscript.so"
> +RDEPENDS_${PN}-geanyminiscript =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-geanynumberedbookmarks"
> +LIC_FILES_CHKSUM +=3D "file://geanynumberedbookmarks/COPYING;md5=3Dc107c=
f754550e65755c42985a5d4e9c9"
> +FILES_${PN}-geanynumberedbookmarks =3D "${libdir}/geany/geanynumberedboo=
kmarks.so"
> +RDEPENDS_${PN}-geanynumberedbookmarks =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-geanypg"
> +LIC_FILES_CHKSUM +=3D "file://geanypg/COPYING;md5=3Db234ee4d69f5fce4486a=
80fdaf4a4263"
> +FILES_${PN}-geanypg =3D "${libdir}/geany/geanypg.so"
> +RDEPENDS_${PN}-geanypg =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-geanyprj"
> +LIC_FILES_CHKSUM +=3D "file://geanyprj/COPYING;md5=3Dd32239bcb673463ab87=
4e80d47fae504"
> +LICENSE_${PN}-geanyprj =3D "GPLv3"
> +FILES_${PN}-geanyprj =3D "${libdir}/geany/geanyprj.so"
> +RDEPENDS_${PN}-geanyprj =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-geanysendmail"
> +LIC_FILES_CHKSUM +=3D "file://geanysendmail/COPYING;md5=3Dc107cf754550e6=
5755c42985a5d4e9c9"
> +FILES_${PN}-geanysendmail =3D "${libdir}/geany/geanysendmail.so"
> +RDEPENDS_${PN}-geanysendmail =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-geanyvc"
> +LIC_FILES_CHKSUM +=3D "file://geanyvc/COPYING;md5=3Dc107cf754550e65755c4=
2985a5d4e9c9"
> +FILES_${PN}-geanyvc =3D "${libdir}/geany/geanyvc.so"
> +RDEPENDS_${PN}-geanyvc =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-geniuspaste"
> +LIC_FILES_CHKSUM +=3D "file://geniuspaste/COPYING;md5=3Dbfc203269f8862eb=
fc1198cdc809a95a"
> +FILES_${PN}-geniuspaste =3D "${libdir}/geany/geniuspaste.so ${datadir}/$=
{PN}/geniuspaste"
> +RDEPENDS_${PN}-geniuspaste =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-lineoperations"
> +LIC_FILES_CHKSUM +=3D "file://lineoperations/COPYING;md5=3Dc107cf754550e=
65755c42985a5d4e9c9"
> +FILES_${PN}-lineoperations =3D "${libdir}/geany/lineoperations.so"
> +RDEPENDS_${PN}-lineoperations =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-multiterm"
> +LIC_FILES_CHKSUM +=3D "file://multiterm/COPYING;md5=3Db234ee4d69f5fce448=
6a80fdaf4a4263"
> +FILES_${PN}-multiterm =3D "${libdir}/geany/multiterm.so"
> +RDEPENDS_${PN}-multiterm =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-overview"
> +LIC_FILES_CHKSUM +=3D "file://overview/overview/overviewplugin.c;beginli=
ne=3D4;endline=3D20;md5=3D1aa33522916cdeb46cccac0c629da0d0"
> +FILES_${PN}-overview =3D "${libdir}/geany/overview.so ${datadir}/${PN}/o=
verview"
> +RDEPENDS_${PN}-overview =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-pairtaghighlighter"
> +LICENSE_${PN}-pairtaghighlighter =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM +=3D "file://pairtaghighlighter/COPYING;md5=3Dd6d927525=
a612b3a8dbebc4b2e9b47c1"
> +FILES_${PN}-pairtaghighlighter =3D "${libdir}/geany/pairtaghighlighter.s=
o"
> +RDEPENDS_${PN}-pairtaghighlighter =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-pohelper"
> +LICENSE_${PN}-pohelper =3D "GPLv3"
> +LIC_FILES_CHKSUM +=3D "file://pohelper/COPYING;md5=3Dd32239bcb673463ab87=
4e80d47fae504"
> +FILES_${PN}-pohelper =3D "${libdir}/geany/pohelper.so"
> +RDEPENDS_${PN}-pohelper =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-pretty-printer"
> +LIC_FILES_CHKSUM +=3D "file://pretty-printer/src/PrettyPrinter.c;beginli=
ne=3D1;endline=3D17;md5=3D1665115c2fadb17c1b53cdb4e43b2440"
> +FILES_${PN}-pretty-printer =3D "${libdir}/geany/pretty-printer.so"
> +RDEPENDS_${PN}-pretty-printer =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-projectorganizer"
> +LIC_FILES_CHKSUM +=3D "file://projectorganizer/COPYING;md5=3Dc107cf75455=
0e65755c42985a5d4e9c9"
> +FILES_${PN}-projectorganizer =3D "${libdir}/geany/projectorganizer.so"
> +RDEPENDS_${PN}-projectorganizer =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-shiftcolumn"
> +LIC_FILES_CHKSUM +=3D "file://shiftcolumn/COPYING;md5=3D751419260aa95449=
9f7abaabaa882bbe"
> +FILES_${PN}-shiftcolumn =3D "${libdir}/geany/shiftcolumn.so"
> +RDEPENDS_${PN}-shiftcolumn =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-scope"
> +LIC_FILES_CHKSUM +=3D "file://scope/COPYING;md5=3Dc107cf754550e65755c429=
85a5d4e9c9"
> +FILES_${PN}-scope =3D "${libdir}/geany/scope.so"
> +RDEPENDS_${PN}-scope =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-spellcheck"
> +LIC_FILES_CHKSUM +=3D "file://spellcheck/COPYING;md5=3D4325afd396febcb65=
9c36b49533135d4"
> +FILES_${PN}-spellcheck =3D "${libdir}/geany/spellcheck.so"
> +RDEPENDS_${PN}-spellcheck =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-tableconvert"
> +LIC_FILES_CHKSUM +=3D "file://tableconvert/COPYING;md5=3D6753686878d090a=
1f3f9445661d3dfbc"
> +FILES_${PN}-tableconvert =3D "${libdir}/geany/tableconvert.so"
> +RDEPENDS_${PN}-tableconvert =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-treebrowser"
> +LIC_FILES_CHKSUM +=3D "file://treebrowser/README;beginline=3D67;endline=
=3D67;md5=3D52f90857fd1a9672111e472dd056a0d8"
> +FILES_${PN}-treebrowser =3D "${libdir}/geany/treebrowser.so"
> +RDEPENDS_${PN}-treebrowser =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-updatechecker"
> +LIC_FILES_CHKSUM +=3D "file://updatechecker/COPYING;md5=3D4325afd396febc=
b659c36b49533135d4"
> +FILES_${PN}-updatechecker =3D "${libdir}/geany/updatechecker.so"
> +RDEPENDS_${PN}-updatechecker =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-webhelper"
> +LIC_FILES_CHKSUM +=3D "file://webhelper/COPYING;md5=3Dd32239bcb673463ab8=
74e80d47fae504"
> +LICENSE_${PN}-webhelper =3D "GPLv3"
> +FILES_${PN}-webhelper =3D "${libdir}/geany/webhelper.so"
> +RDEPENDS_${PN}-webhelper =3D "${PN}"
> +
> +PLUGINS +=3D "${PN}-xmlsnippets"
> +LIC_FILES_CHKSUM +=3D "file://xmlsnippets/COPYING;md5=3D4325afd396febcb6=
59c36b49533135d4"
> +FILES_${PN}-xmlsnippets =3D "${libdir}/geany/xmlsnippets.so"
> +RDEPENDS_${PN}-xmlsnippets =3D "${PN}"
> +
> +PACKAGES =3D+ "${PLUGINS}"
> +RDEPENDS_${PN} =3D "${PLUGINS}"
> +ALLOW_EMPTY_${PN} =3D "1"
> --=20
> 2.5.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldDUrUACgkQN1Ujt2V2gByD1QCfW/CbP5MWB9P7+ZcH47afmiTH
kEwAn23/yofYmYSrdyoOhBs1v5EHhQQO
=Cmna
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
