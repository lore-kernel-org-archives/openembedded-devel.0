Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id B74D5731E6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 12:19:59 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id a17so24416261wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 05:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=AWA6cbOWy6gEyvgTIFXSlYl4USXqoFU3lNs3TUOlGwc=;
	b=URqbKcuNTktkH15ohPfbDkLpKDDfy/4a6HtRDXvXmJUcApdRdWFqVhk8dFeSifxlQt
	PhsDCQyAQ2u50dqnMxfWhL7nBi1iQ6INyUmkwGxMBz5TqtdEoVImus0cMSnaZzvcYGuv
	s7K8EbJdSdOrywE7l8t1eq7ldtR3H0rTfOdO/MUSNGxSTU5rRL+zGDLtC2HJYnr/NnCZ
	r43UsFp0CqtIKcXI33dcHjE3VcqeHawbdOD2O99wFcyIr1uIuVeQp2FvwpoO3M0+QpwL
	fuyQQOVVMO0j2s+L1gXcRB3boCqmWZJ9e0JGKY3XV+BYeKZMEGfbkz8qY8Wn7aqjsCia
	EYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=AWA6cbOWy6gEyvgTIFXSlYl4USXqoFU3lNs3TUOlGwc=;
	b=hcJIb6eJlM868m2Gd7gas8E5pQUME2euzLKWEvhAnbnfmlfhAAkRt8IEqLZ21igFXY
	m79fhGpBq2M4BnBNV+onUlqDc9gdv7cO5ehfpyNoHkNxnLZM5skM9dVvko4k8PE3jqDO
	G/EQc87c8kNX0cTP06XZBVC66f/FwpWhq4rIjGwxZ8rDFAfuhMUISlE/J7WdHnk0YD5c
	r5kyCwk9xf/5dovM889LuYIpzT5LbG9jk3SZgao419MznLXMvJPgJlUs1OZQL1ml9lkn
	uxGPVWNzSaHF/897SlwhX1zOAq9VRoNfgwR4VO4bHpaXSEoLzo+K0tu+jatOOhhHON+7
	i01A==
X-Gm-Message-State: AOPr4FVo7OhklskhcC4RjF4LGwmX7iCcUPtJcRJlLGF8/iJnpR/AgWZKF9xaf7whuG7xIw==
X-Received: by 10.194.6.225 with SMTP id e1mr41598228wja.152.1462882799944;
	Tue, 10 May 2016 05:19:59 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ck9sm2257793wjc.22.2016.05.10.05.19.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 May 2016 05:19:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 May 2016 14:20:21 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160510122021.GB5675@jama>
References: <1462724355-13609-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1462724355-13609-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [meta-oe][v2][PATCH] graphviz: Add new package
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
X-List-Received-Date: Tue, 10 May 2016 12:20:00 -0000
X-Groupsio-MsgNum: 61451
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline

--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 08, 2016 at 09:19:15AM -0700, Armin Kuster wrote:
> V2: don't run configure within the autogen.sh

graphviz-2.38.0: graphviz: Files/directories were installed but not
shipped in any package:
  /usr/lib/lua/gv.so
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
graphviz: 1 installed and not shipped files. [installed-vs-shipped]
graphviz-2.38.0: graphviz rdepends on gd, but it isn't a build
dependency, missing gd in DEPENDS or PACKAGECONFIG? [build-deps]
graphviz-2.38.0: /usr/share/graphviz/demo/modgraph.lua contained in
package graphviz requires /usr/bin/lua, but no providers found in
RDEPENDS_graphviz? [file-rdeps]

>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../graphviz/graphviz_no_mkdef_build.patch         |  90 ++++++++++++++
>  .../graphviz/graphviz/linear_angle.gv              | 101 ++++++++++++++++
>  .../recipes-graphics/graphviz/graphviz/simple.gv   |   1 +
>  .../recipes-graphics/graphviz/graphviz_2.38.0.bb   | 131 +++++++++++++++=
++++++
>  4 files changed, 323 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/graphviz_n=
o_mkdef_build.patch
>  create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/linear_ang=
le.gv
>  create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/simple.gv
>  create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz_2.38.0.bb
>=20
> diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/graphviz_no_mkdef=
_build.patch b/meta-oe/recipes-graphics/graphviz/graphviz/graphviz_no_mkdef=
_build.patch
> new file mode 100644
> index 0000000..6d4c964
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/graphviz/graphviz/graphviz_no_mkdef_build.=
patch
> @@ -0,0 +1,90 @@
> +Index: graphviz-2.38.0/lib/gvpr/Makefile.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- graphviz-2.38.0.orig/lib/gvpr/Makefile.in
> ++++ graphviz-2.38.0/lib/gvpr/Makefile.in
> +@@ -55,7 +55,6 @@ PRE_UNINSTALL =3D :
> + POST_UNINSTALL =3D :
> + build_triplet =3D @build@
> + host_triplet =3D @host@
> +-noinst_PROGRAMS =3D mkdefs$(EXEEXT)
> + subdir =3D lib/gvpr
> + DIST_COMMON =3D $(noinst_HEADERS) $(pkginclude_HEADERS) \
> + 	$(srcdir)/Makefile.am $(srcdir)/Makefile.in \
> +@@ -120,10 +119,6 @@ libgvpr_C_la_LIBADD =3D
> + am_libgvpr_C_la_OBJECTS =3D actions.lo compile.lo gvpr.lo gprstate.lo \
> + 	parse.lo queue.lo
> + libgvpr_C_la_OBJECTS =3D $(am_libgvpr_C_la_OBJECTS)
> +-PROGRAMS =3D $(noinst_PROGRAMS)
> +-am_mkdefs_OBJECTS =3D mkdefs.$(OBJEXT)
> +-mkdefs_OBJECTS =3D $(am_mkdefs_OBJECTS)
> +-mkdefs_LDADD =3D $(LDADD)
> + AM_V_P =3D $(am__v_P_@AM_V@)
> + am__v_P_ =3D $(am__v_P_@AM_DEFAULT_V@)
> + am__v_P_0 =3D false
> +@@ -158,10 +153,8 @@ AM_V_CCLD =3D $(am__v_CCLD_@AM_V@)
> + am__v_CCLD_ =3D $(am__v_CCLD_@AM_DEFAULT_V@)
> + am__v_CCLD_0 =3D @echo "  CCLD    " $@;
> + am__v_CCLD_1 =3D=20
> +-SOURCES =3D $(libgvpr_la_SOURCES) $(libgvpr_C_la_SOURCES) \
> +-	$(mkdefs_SOURCES)
> +-DIST_SOURCES =3D $(libgvpr_la_SOURCES) $(libgvpr_C_la_SOURCES) \
> +-	$(mkdefs_SOURCES)
> ++SOURCES =3D $(libgvpr_la_SOURCES) $(libgvpr_C_la_SOURCES)
> ++DIST_SOURCES =3D $(libgvpr_la_SOURCES) $(libgvpr_C_la_SOURCES)
> + am__can_run_installinfo =3D \
> +   case $$AM_UPDATE_INFO_DIR in \
> +     n|no|NO) false;; \
> +@@ -568,8 +561,7 @@ libgvpr_la_LIBADD =3D $(libgvpr_C_la_LIBAD
> + 	$(MATH_LIBS)
> +=20
> + libgvpr_la_DEPENDENCIES =3D $(libgvpr_C_la_DEPENDENCIES)
> +-mkdefs_SOURCES =3D mkdefs.c
> +-EXTRA_DIST =3D $(man_MANS) $(pdf_DATA) gprdata mkdefs.c gdefs.h trie.c =
gvprlib.vcproj
> ++EXTRA_DIST =3D $(man_MANS) $(pdf_DATA) gprdata gdefs.h trie.c gvprlib.v=
cproj
> + DISTCLEANFILES =3D $(pdf_DATA) gdefs.h mkdefs
> + all: all-am
> +=20
> +@@ -657,18 +649,6 @@ libgvpr.la: $(libgvpr_la_OBJECTS) $(libg
> + libgvpr_C.la: $(libgvpr_C_la_OBJECTS) $(libgvpr_C_la_DEPENDENCIES) $(EX=
TRA_libgvpr_C_la_DEPENDENCIES)=20
> + 	$(AM_V_CCLD)$(LINK)  $(libgvpr_C_la_OBJECTS) $(libgvpr_C_la_LIBADD) $(=
LIBS)
> +=20
> +-clean-noinstPROGRAMS:
> +-	@list=3D'$(noinst_PROGRAMS)'; test -n "$$list" || exit 0; \
> +-	echo " rm -f" $$list; \
> +-	rm -f $$list || exit $$?; \
> +-	test -n "$(EXEEXT)" || exit 0; \
> +-	list=3D`for p in $$list; do echo "$$p"; done | sed 's/$(EXEEXT)$$//'`;=
 \
> +-	echo " rm -f" $$list; \
> +-	rm -f $$list
> +-mkdefs$(EXEEXT): $(mkdefs_OBJECTS) $(mkdefs_DEPENDENCIES) $(EXTRA_mkdef=
s_DEPENDENCIES)=20
> +-	@rm -f mkdefs$(EXEEXT)
> +-	$(AM_V_CCLD)$(LINK) $(mkdefs_OBJECTS) $(mkdefs_LDADD) $(LIBS)
> +-
> + mostlyclean-compile:
> + 	-rm -f *.$(OBJEXT)
> +=20
> +Index: graphviz-2.38.0/lib/gvpr/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- graphviz-2.38.0.orig/lib/gvpr/Makefile.am
> ++++ graphviz-2.38.0/lib/gvpr/Makefile.am
> +@@ -21,7 +21,6 @@ AM_CPPFLAGS =3D \
> + 	-DDFLT_GVPRPATH=3D"\".$(PATH_SEPARATOR)$(pkgdatadir)/gvpr\""
> +=20
> + pkginclude_HEADERS =3D gvpr.h
> +-noinst_PROGRAMS =3D mkdefs
> + noinst_HEADERS =3D actions.h compile.h gprstate.h parse.h queue.h trieF=
A.h trie.c
> + noinst_LTLIBRARIES =3D libgvpr_C.la
> + lib_LTLIBRARIES =3D libgvpr.la
> +@@ -50,11 +49,10 @@ libgvpr_la_LIBADD =3D $(libgvpr_C_la_LIBAD
> + 	$(MATH_LIBS)
> + libgvpr_la_DEPENDENCIES =3D $(libgvpr_C_la_DEPENDENCIES)
> +=20
> +-mkdefs_SOURCES =3D mkdefs.c
> +=20
> + gdefs.h: $(top_srcdir)/lib/gvpr/gprdata mkdefs
> + 	./mkdefs gdefs.h < $(top_srcdir)/lib/gvpr/gprdata
> +=20
> +-EXTRA_DIST =3D $(man_MANS) $(pdf_DATA) gprdata mkdefs.c gdefs.h trie.c =
gvprlib.vcproj
> ++EXTRA_DIST =3D $(man_MANS) $(pdf_DATA) gprdata gdefs.h trie.c gvprlib.v=
cproj
> +=20
> + DISTCLEANFILES =3D $(pdf_DATA) gdefs.h mkdefs
> diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/linear_angle.gv b=
/meta-oe/recipes-graphics/graphviz/graphviz/linear_angle.gv
> new file mode 100644
> index 0000000..827bde5
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/graphviz/graphviz/linear_angle.gv
> @@ -0,0 +1,101 @@
> +digraph G { bgcolor=3D"purple:pink" style=3D"filled"
> +  subgraph cluster1 {fillcolor=3D"blue:green" style=3D"filled"
> +		node [shape=3Dcircle fillcolor=3D"gold:brown" style=3D"radial" gradien=
tangle=3D180]
> +		a0 [label=3D<
> + <TABLE border=3D"10" cellspacing=3D"10" cellpadding=3D"10" style=3D"rou=
nded" bgcolor=3D"yellow:violet" gradientangle=3D"315">
> +<TR><TD border=3D"3"  bgcolor=3D"yellow" gradientangle=3D"315">00</TD>
> +<TD border=3D"3"  bgcolor=3D"yellow:green" gradientangle=3D"315">01</TD>
> +<TD border=3D"3"  bgcolor=3D"green" gradientangle=3D"315">02</TD>
> +<TD border=3D"3"  bgcolor=3D"green:blue" gradientangle=3D"315">03</TD>
> +<TD border=3D"3"  bgcolor=3D"blue" gradientangle=3D"315">04</TD>
> +<TD border=3D"3"  bgcolor=3D"blue:purple" gradientangle=3D"315">05</TD>
> +<TD border=3D"3"  bgcolor=3D"purple" gradientangle=3D"315">06</TD>
> +<TD border=3D"3"  bgcolor=3D"purple:violet" gradientangle=3D"315">07</TD>
> +<TD border=3D"3"  bgcolor=3D"violet" gradientangle=3D"315">08</TD></TR>
> + =20
> +<TR><TD border=3D"3"  bgcolor=3D"yellow:gold"  gradientangle=3D"315">10<=
/TD>
> +<TD border=3D"3"  bgcolor=3D"yellow:green"  gradientangle=3D"315">11</TD>
> +<TD border=3D"3"  bgcolor=3D"yellow:green"  gradientangle=3D"315">12</TD>
> +<TD border=3D"3"  bgcolor=3D"yellow:blue"  gradientangle=3D"315">13</TD>
> +<TD border=3D"3"  bgcolor=3D"yellow:blue"  gradientangle=3D"315">14</TD>
> +<TD border=3D"3"  bgcolor=3D"yellow:purple"  gradientangle=3D"315">15</T=
D>
> +<TD border=3D"3"  bgcolor=3D"yellow:purple"  gradientangle=3D"315">16</T=
D>
> +<TD border=3D"3"  bgcolor=3D"yellow:violet"  gradientangle=3D"315">17</T=
D>
> +<TD border=3D"3"  bgcolor=3D"yellow:violet"  gradientangle=3D"315">18</T=
D></TR>
> + =20
> +<TR><TD border=3D"3"  bgcolor=3D"gold"  gradientangle=3D"315">20</TD>
> +<TD border=3D"3"  bgcolor=3D"gold:green"  gradientangle=3D"315">21</TD>
> +<TD border=3D"3"  bgcolor=3D"gold:green"  gradientangle=3D"315">22</TD>
> +<TD border=3D"3"  bgcolor=3D"gold:blue"  gradientangle=3D"315">23</TD>
> +<TD border=3D"3"  bgcolor=3D"gold:blue"  gradientangle=3D"315">24</TD>
> +<TD border=3D"3"  bgcolor=3D"gold:purple"  gradientangle=3D"315">25</TD>
> +<TD border=3D"3"  bgcolor=3D"gold:purple"  gradientangle=3D"315">26</TD>
> +<TD border=3D"3"  bgcolor=3D"gold:violet"  gradientangle=3D"315">27</TD>
> +<TD border=3D"3"  bgcolor=3D"gold:violet"  gradientangle=3D"315">28</TD>=
</TR>
> + =20
> +<TR><TD border=3D"3"  bgcolor=3D"gold:orange"  gradientangle=3D"315">30<=
/TD>
> +<TD border=3D"3"  bgcolor=3D"orange:green"  gradientangle=3D"315">31</TD>
> +<TD border=3D"3"  bgcolor=3D"orange:green"  gradientangle=3D"315">32</TD>
> +<TD border=3D"3"  bgcolor=3D"orange:blue"  gradientangle=3D"315">33</TD>
> +<TD border=3D"3"  bgcolor=3D"orange:blue"  gradientangle=3D"315">34</TD>
> +<TD border=3D"3"  bgcolor=3D"orange:purple"  gradientangle=3D"315">35</T=
D>
> +<TD border=3D"3"  bgcolor=3D"orange:purple"  gradientangle=3D"315">36</T=
D>
> +<TD border=3D"3"  bgcolor=3D"orange:violet"  gradientangle=3D"315">37</T=
D>
> +<TD border=3D"3"  bgcolor=3D"orange:violet"  gradientangle=3D"315">38</T=
D></TR>
> + =20
> +<TR><TD border=3D"3"  bgcolor=3D"orange"  gradientangle=3D"315">40</TD>
> +<TD border=3D"3"  bgcolor=3D"orange:green"  gradientangle=3D"315">41</TD>
> +<TD border=3D"3"  bgcolor=3D"orange:green"  gradientangle=3D"315">42</TD>
> +<TD border=3D"3"  bgcolor=3D"orange:blue"  gradientangle=3D"315">43</TD>
> +<TD border=3D"3"  bgcolor=3D"orange:blue"  gradientangle=3D"315">44</TD>
> +<TD border=3D"3"  bgcolor=3D"orange:purple"  gradientangle=3D"315">45</T=
D>
> +<TD border=3D"3"  bgcolor=3D"orange:purple"  gradientangle=3D"315">46</T=
D>
> +<TD border=3D"3"  bgcolor=3D"orange:violet"  gradientangle=3D"315">47</T=
D>
> +<TD border=3D"3"  bgcolor=3D"orange:violet"  gradientangle=3D"315">48</T=
D></TR>
> + =20
> +<TR><TD border=3D"3"  bgcolor=3D"orange:red"  gradientangle=3D"315">50</=
TD>
> +<TD border=3D"3"  bgcolor=3D"red:green"  gradientangle=3D"315">51</TD>
> +<TD border=3D"3"  bgcolor=3D"red:green"  gradientangle=3D"315">52</TD>
> +<TD border=3D"3"  bgcolor=3D"red:blue"  gradientangle=3D"315">53</TD>
> +<TD border=3D"3"  bgcolor=3D"red:blue"  gradientangle=3D"315">54</TD>
> +<TD border=3D"3"  bgcolor=3D"red:purple"  gradientangle=3D"315">55</TD>
> +<TD border=3D"3"  bgcolor=3D"red:purple"  gradientangle=3D"315">56</TD>
> +<TD border=3D"3"  bgcolor=3D"red:violet"  gradientangle=3D"315">57</TD>
> +<TD border=3D"3"  bgcolor=3D"red:violet"  gradientangle=3D"315">58</TD><=
/TR>
> + =20
> +<TR><TD border=3D"3"  bgcolor=3D"red"  gradientangle=3D"315">60</TD>
> +<TD border=3D"3"  bgcolor=3D"red:green"  gradientangle=3D"315">61</TD>
> +<TD border=3D"3"  bgcolor=3D"red:green"  gradientangle=3D"315">62</TD>
> +<TD border=3D"3"  bgcolor=3D"red:blue"  gradientangle=3D"315">63</TD>
> +<TD border=3D"3"  bgcolor=3D"red:blue"  gradientangle=3D"315">64</TD>
> +<TD border=3D"3"  bgcolor=3D"red:purple"  gradientangle=3D"315">65</TD>
> +<TD border=3D"3"  bgcolor=3D"red:purple"  gradientangle=3D"315">66</TD>
> +<TD border=3D"3"  bgcolor=3D"red:violet"  gradientangle=3D"315">67</TD>
> +<TD border=3D"3"  bgcolor=3D"red:violet"  gradientangle=3D"315">68</TD><=
/TR>
> + =20
> +<TR><TD border=3D"3"  bgcolor=3D"red:brown"  gradientangle=3D"315">70</T=
D>
> +<TD border=3D"3"  bgcolor=3D"brown:green"  gradientangle=3D"315">71</TD>
> +<TD border=3D"3"  bgcolor=3D"brown:green"  gradientangle=3D"315">72</TD>
> +<TD border=3D"3"  bgcolor=3D"brown:blue"  gradientangle=3D"315">73</TD>
> +<TD border=3D"3"  bgcolor=3D"brown:blue"  gradientangle=3D"315">74</TD>
> +<TD border=3D"3"  bgcolor=3D"brown:purple"  gradientangle=3D"315">75</TD>
> +<TD border=3D"3"  bgcolor=3D"brown:purple"  gradientangle=3D"315">76</TD>
> +<TD border=3D"3"  bgcolor=3D"brown:violet"  gradientangle=3D"315">77</TD>
> +<TD border=3D"3"  bgcolor=3D"brown:violet"  gradientangle=3D"315">78</TD=
></TR>
> + =20
> +<TR><TD border=3D"3"  bgcolor=3D"brown"  gradientangle=3D"315">80</TD>
> +<TD border=3D"3"  bgcolor=3D"brown:green"  gradientangle=3D"315">81</TD>
> +<TD border=3D"3"  bgcolor=3D"brown:green"  gradientangle=3D"315">82</TD>
> +<TD border=3D"3"  bgcolor=3D"brown:blue"  gradientangle=3D"315">83</TD>
> +<TD border=3D"3"  bgcolor=3D"brown:blue"  gradientangle=3D"315">84</TD>
> +<TD border=3D"3"  bgcolor=3D"brown:purple"  gradientangle=3D"315">85</TD>
> +<TD border=3D"3"  bgcolor=3D"brown:purple"  gradientangle=3D"315">86</TD>
> +<TD border=3D"3"  bgcolor=3D"brown:violet"  gradientangle=3D"315">87</TD>
> +<TD border=3D"3"  bgcolor=3D"brown:violet"  gradientangle=3D"315">88</TD=
></TR>
> + =20
> +</TABLE>>];
> +
> +}
> +
> +}=20
> +
> diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/simple.gv b/meta-=
oe/recipes-graphics/graphviz/graphviz/simple.gv
> new file mode 100644
> index 0000000..1b140f9
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/graphviz/graphviz/simple.gv
> @@ -0,0 +1 @@
> +    graph { a -- b; b -- c; a -- c; d -- c; e -- c; e -- a; }=20
> diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.38.0.bb b/meta-=
oe/recipes-graphics/graphviz/graphviz_2.38.0.bb
> new file mode 100644
> index 0000000..61ffaef
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.38.0.bb
> @@ -0,0 +1,131 @@
> +SUMMARY =3D "Graphviz - Graph Visualization Software."
> +DESCRIPTION =3D "Graphviz is open source graph visualization software. G=
raph visualization is a way of representing structural information as diagr=
ams of abstract graphs and networks. It has important applications in netwo=
rking, bioinformatics,  software engineering, database and web design, mach=
ine learning, and in visual interfaces for other technical domains."
> +HOMEPAGE =3D "http://www.graphviz.org/"
> +SECTION =3D "graphics"
> +LICENSE =3D "EPL-1.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;beginline=3D1;endline=3D2;md5=3D737=
cf7b11c0759e6d3b0d6cb08b7c4f8"
> +
> +DEPENDS +=3D "graphviz-native bison flex libtool zlib chrpath-replacemen=
t-native"
> +DEPENDS_class-native =3D ""
> +
> +SRC_URI_BASE =3D "${DEBIAN_MIRROR}/main/g/${BPN}/${BPN}_${PV}.orig.tar.g=
z;name=3Darchive \
> +           ${DEBIAN_MIRROR}/main/g/${BPN}/${BPN}_${PV}-7.debian.tar.xz;n=
ame=3Dpatch \
> +"
> +
> +SRC_URI =3D "${SRC_URI_BASE} \
> +        file://graphviz_no_mkdef_build.patch \
> +        file://simple.gv \
> +        file://linear_angle.gv \
> +        "
> +
> +SRC_URI_class-native =3D "${SRC_URI_BASE}"
> +
> +SRC_URI[archive.md5sum] =3D "5b6a829b2ac94efcd5fa3c223ed6d3ae"
> +SRC_URI[archive.sha256sum] =3D "81aa238d9d4a010afa73a9d2a704fc3221c731e1=
e06577c2ab3496bdef67859e"
> +SRC_URI[patch.md5sum] =3D "5cbcff92169d682471cdfdf58d215098"
> +SRC_URI[patch.sha256sum] =3D "312ab8215fbe1800664675cfc284aecfeff3ce6994=
07523b5bdefee64cf1a53c"
> +
> +inherit autotools-brokensep pkgconfig
> +
> +LDFLAGS +=3D "-Wunused-but-set-variable -Wmaybe-uninitialized -Wunused-v=
ariable"
> +
> +PACKAGECONFIG ?=3D "ghost rsvg cairo swig tcl gtk lua sfdp png libgd \
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'X11', ''=
, d)} \
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'glut'=
, '', d)}"
> +
> +PACKAGECONFIG_class-native ??=3D ""
> +
> +PACKAGECONFIG[sfdp] =3D "--enable-sfdp=3Dyes, --disable-sfdp, ,"
> +PACKAGECONFIG[swig] =3D "--enable-swig=3Dyes, --disable-swig, swig,"
> +PACKAGECONFIG[lua] =3D "--enable-lua=3Dyes, --disable-lua, lua,"
> +PACKAGECONFIG[cairo] =3D "--with-pangocairo=3Dyes, --with-pangocairo=3Dn=
o, cairo,"
> +PACKAGECONFIG[tcl] =3D "--enable-tcl=3Dyes --with-tclsh=3Dtclsh, --disab=
le-tcl, tcl, tcl"
> +PACKAGECONFIG[glut] =3D "--with-glut=3Dyes, --without-glut, mesa-glut,"
> +PACKAGECONFIG[gtk] =3D "--with-gtk=3Dyes, --without-gtk, gtk+,"
> +PACKAGECONFIG[expect] =3D "--with-expect=3Dyes, --without-expect, expect=
,"
> +PACKAGECONFIG[ghost] =3D "--with-ghostscript=3Dyes, --without-ghostscrip=
t, ghostscript,"
> +PACKAGECONFIG[fontconfig] =3D "--with-fontconfig=3Dyes, --without-fontco=
nfig, fontconfig,"
> +PACKAGECONFIG[freetype] =3D "--with-freetype2=3Dyes, --with-freetype2=3D=
no, freetype,"
> +PACKAGECONFIG[poppler] =3D "--with-poppler=3Dyes, --with-poppler=3Dno, p=
oppler,"
> +PACKAGECONFIG[guile] =3D "--enable-guile, --disable-guile, guile,"
> +PACKAGECONFIG[php] =3D "--enable-php, --disable-php , php,"
> +PACKAGECONFIG[perl] =3D "--enable-perl, --disable-perl, perl,"
> +PACKAGECONFIG[python] =3D "--enable-python, --disable-python, python ,"
> +PACKAGECONFIG[ruby] =3D "--enable-ruby, --disable-ruby, ruby, "
> +PACKAGECONFIG[qt] =3D "--with-qt=3Dyes, --with-qt=3Dno, qte,"
> +PACKAGECONFIG[glade] =3D "--with-glade=3Dyes, --with-glade=3Dno, glade3,"
> +PACKAGECONFIG[libgd] =3D "--with-libgd=3Dyes, --with-libgd=3Dno, libglad=
e,"
> +PACKAGECONFIG[png] =3D "--with-libpng=3Dyes, --with-libpng=3Dno, libpng,=
 libpng"
> +PACKAGECONFIG[rsvg] =3D "--with-rsvg=3Dyes, --with-rsvg=3Dno, librsvg, l=
ibrsvg"
> +PACKAGECONFIG[pixbuf] =3D "--with-gdk=3Dyes --with-gdk-pixbuf=3Dyes, --w=
ith-gdk=3Dno --with-gdk-pixbuf=3Dno, gdk-pixbuf,"
> +PACKAGECONFIG[X11] =3D "--with-x, --without-x, libx11 virtual/libx11 , l=
ibxaw7"
> +
> +EXTRA_OECONF +=3D "--enable-ltdl"
> +
> +EXTRA_OECONF_class-native +=3D " \
> +    --enable-sharp=3Dno \
> +    --enable-java=3Dno \
> +    --enable-ocaml=3Dno \
> +    --enable-r=3Dno \
> +    --with-devil=3Dno \
> +    --with-lasi=3Dno \
> +    --with-gtkgl=3Dno \
> +    --with-gtkglext=3Dno \
> +    --with-gts=3Dno \
> +    --with-ann=3Dno \
> +    --with-ortho=3Dno \
> +    --with-digcola=3Dno \
> +    --with-smyrna=3Dno \
> +    --with-ipsepcola=3Dno \
> +     "
> +EXTRANATIVEPATH +=3D "chrpath-native"
> +
> +debian_do_patch() {
> +    cd ${S}
> +    while read line; do patch -p1 < ${WORKDIR}/debian/patches/$line; don=
e < ${WORKDIR}/debian/patches/series
> +}
> +
> +python do_patch() {
> +    bb.build.exec_func('debian_do_patch', d)
> +    bb.build.exec_func('patch_do_patch', d)
> +}
> +
> +do_configure_prepend () {
> +    # copy mkdefs from the native graphviz build
> +    if [ "${PN}" !=3D "graphviz-native" ]; then
> +        cp ${STAGING_BINDIR_NATIVE}/graphviz-${PV}/mkdefs ${S}/lib/gvpr/.
> +    fi
> +    ./autogen.sh NOCONFIG
> +}
> +
> +do_compile_class-native () {
> +    cd lib/gvpr
> +    oe_runmake mkdefs
> +}
> +
> +do_install_append () {
> +    if [ "${PN}" !=3D "graphviz-native" ]; then
> +        install  -d ${D}${datadir}/graphviz
> +        install  ${WORKDIR}/*.gv ${D}${datadir}/graphviz/
> +    fi
> +}
> +
> +do_install_class-native () {
> +    install -d ${D}${bindir}/graphviz-${PV}
> +    install -m 755 ${S}/lib/gvpr/mkdefs ${D}${bindir}/graphviz-${PV}/
> +}
> +
> +pkg_postinst_${PN} () {
> +if test "x$D" !=3D "x"; then
> +    exit 1
> +else
> +    ${bindr}/dot -c
> +fi
> +}
> +
> +INSANE_SKIP_${PN} +=3D "dev-so"
> +
> +RDEPENDS_${PN} =3D "libxml2 libcroco"
> +RDEPENDS_class-native =3D ""
> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcx0gQACgkQN1Ujt2V2gBzC7QCgkp0AlkA8GunalHXnukWD1nth
vfgAoKyWCz3iQ8yVp8D64SI9HvLzQ38B
=wPnY
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
