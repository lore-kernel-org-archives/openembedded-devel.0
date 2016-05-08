Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D59166FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 May 2016 05:39:39 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 145so13469603pfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2016 22:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=Ld/e2G9iX07gJJGijCNHHk2BhTps6lovTas9a40a0hA=;
	b=knvVm6DhheCFIDG0uHAZA4KzwNkYC1VjbtTekSR4GWw2CMR62IOPD1R0+f8kS6BIGQ
	o6icLcUZzD0K45oviZK4m4eNQCdzDjIB17NqjCBUnAmnfo4oPiK1GZCqXQ3KrWa/Ztby
	H3orMWEThH8sAiz4bPBywHu8f3kDfLJMkaUk0ZO9bdPnyFj+H9Wnfa8U1iCGDArkus4n
	O8i3MNiOFLCan6gHjbcgHTH94MNh7/+lknEXR7kyt8Xgr9zX+Grnq2tWCjwx8W3fpq6r
	3FPylV5k1H6HuobpZfkSsV4e7lKQwfV3VWc60SAT3o6bDWUEoEMsoQmmznUvS8RK1yxr
	EfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Ld/e2G9iX07gJJGijCNHHk2BhTps6lovTas9a40a0hA=;
	b=h5AXESOYruZHNAsehLMqekAlKWtUwmy/ZmaP5bhOETtQCPVAqrTMXaKIsry0F32MPv
	mtHpKQhFHb4BMbcsY28w8CR1yXWQK8sdcnWE+PBHIOw/lbuktJVOrqaxmNXXeb7B1YAM
	3r6o054HQwF7zt5NC5kO99vWsLD8RvZcbq+aYpe6799OkqICgB1Uva1N80GQqoKW0hRl
	gQ98EwhAslTnhotBynJG6F00qUNfDdf6ytR8FVXo7rRhW5IW+vattFyQvoFH41dCtkl9
	oqOQNBECxRfAsC4j+6IrUDq2E1uUdVAz4c1jMeuysGuW4CKV5CIowhz0LVmFmR924j/s
	oi8w==
X-Gm-Message-State: AOPr4FVA07J2EAIn5voyNXX6940ry76h2Ia40uQcI1tQYz/CHECgIY7UIfO0W0edmHwNcA==
X-Received: by 10.98.93.129 with SMTP id n1mr3677186pfj.16.1462685980117;
	Sat, 07 May 2016 22:39:40 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:5555:fa4b:8548:199b?
	([2601:202:4000:1239:5555:fa4b:8548:199b])
	by smtp.googlemail.com with ESMTPSA id
	o6sm16003099pfo.64.2016.05.07.22.39.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2016 22:39:38 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1462595846-24863-1-git-send-email-akuster808@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <572ED119.8030402@gmail.com>
Date: Sat, 7 May 2016 22:39:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1462595846-24863-1-git-send-email-akuster808@gmail.com>
Subject: Re: [meta-oe][PATCH] graphviz: Add new package
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
X-List-Received-Date: Sun, 08 May 2016 05:39:42 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 05/06/2016 09:37 PM, Armin Kuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>

please drop this. not ready for prime time.

- armin

> ---
>  .../graphviz/graphviz_no_mkdef_build.patch         |  90 +++++++++++++
>  .../graphviz/graphviz/linear_angle.gv              | 101 ++++++++++++++
>  .../recipes-graphics/graphviz/graphviz/simple.gv   |   1 +
>  .../recipes-graphics/graphviz/graphviz_2.38.0.bb   | 149 +++++++++++++++++++++
>  4 files changed, 341 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/graphviz_no_mkdef_build.patch
>  create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/linear_angle.gv
>  create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/simple.gv
>  create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz_2.38.0.bb
> 
> diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/graphviz_no_mkdef_build.patch b/meta-oe/recipes-graphics/graphviz/graphviz/graphviz_no_mkdef_build.patch
> new file mode 100644
> index 0000000..6d4c964
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/graphviz/graphviz/graphviz_no_mkdef_build.patch
> @@ -0,0 +1,90 @@
> +Index: graphviz-2.38.0/lib/gvpr/Makefile.in
> +===================================================================
> +--- graphviz-2.38.0.orig/lib/gvpr/Makefile.in
> ++++ graphviz-2.38.0/lib/gvpr/Makefile.in
> +@@ -55,7 +55,6 @@ PRE_UNINSTALL = :
> + POST_UNINSTALL = :
> + build_triplet = @build@
> + host_triplet = @host@
> +-noinst_PROGRAMS = mkdefs$(EXEEXT)
> + subdir = lib/gvpr
> + DIST_COMMON = $(noinst_HEADERS) $(pkginclude_HEADERS) \
> + 	$(srcdir)/Makefile.am $(srcdir)/Makefile.in \
> +@@ -120,10 +119,6 @@ libgvpr_C_la_LIBADD =
> + am_libgvpr_C_la_OBJECTS = actions.lo compile.lo gvpr.lo gprstate.lo \
> + 	parse.lo queue.lo
> + libgvpr_C_la_OBJECTS = $(am_libgvpr_C_la_OBJECTS)
> +-PROGRAMS = $(noinst_PROGRAMS)
> +-am_mkdefs_OBJECTS = mkdefs.$(OBJEXT)
> +-mkdefs_OBJECTS = $(am_mkdefs_OBJECTS)
> +-mkdefs_LDADD = $(LDADD)
> + AM_V_P = $(am__v_P_@AM_V@)
> + am__v_P_ = $(am__v_P_@AM_DEFAULT_V@)
> + am__v_P_0 = false
> +@@ -158,10 +153,8 @@ AM_V_CCLD = $(am__v_CCLD_@AM_V@)
> + am__v_CCLD_ = $(am__v_CCLD_@AM_DEFAULT_V@)
> + am__v_CCLD_0 = @echo "  CCLD    " $@;
> + am__v_CCLD_1 = 
> +-SOURCES = $(libgvpr_la_SOURCES) $(libgvpr_C_la_SOURCES) \
> +-	$(mkdefs_SOURCES)
> +-DIST_SOURCES = $(libgvpr_la_SOURCES) $(libgvpr_C_la_SOURCES) \
> +-	$(mkdefs_SOURCES)
> ++SOURCES = $(libgvpr_la_SOURCES) $(libgvpr_C_la_SOURCES)
> ++DIST_SOURCES = $(libgvpr_la_SOURCES) $(libgvpr_C_la_SOURCES)
> + am__can_run_installinfo = \
> +   case $$AM_UPDATE_INFO_DIR in \
> +     n|no|NO) false;; \
> +@@ -568,8 +561,7 @@ libgvpr_la_LIBADD = $(libgvpr_C_la_LIBAD
> + 	$(MATH_LIBS)
> + 
> + libgvpr_la_DEPENDENCIES = $(libgvpr_C_la_DEPENDENCIES)
> +-mkdefs_SOURCES = mkdefs.c
> +-EXTRA_DIST = $(man_MANS) $(pdf_DATA) gprdata mkdefs.c gdefs.h trie.c gvprlib.vcproj
> ++EXTRA_DIST = $(man_MANS) $(pdf_DATA) gprdata gdefs.h trie.c gvprlib.vcproj
> + DISTCLEANFILES = $(pdf_DATA) gdefs.h mkdefs
> + all: all-am
> + 
> +@@ -657,18 +649,6 @@ libgvpr.la: $(libgvpr_la_OBJECTS) $(libg
> + libgvpr_C.la: $(libgvpr_C_la_OBJECTS) $(libgvpr_C_la_DEPENDENCIES) $(EXTRA_libgvpr_C_la_DEPENDENCIES) 
> + 	$(AM_V_CCLD)$(LINK)  $(libgvpr_C_la_OBJECTS) $(libgvpr_C_la_LIBADD) $(LIBS)
> + 
> +-clean-noinstPROGRAMS:
> +-	@list='$(noinst_PROGRAMS)'; test -n "$$list" || exit 0; \
> +-	echo " rm -f" $$list; \
> +-	rm -f $$list || exit $$?; \
> +-	test -n "$(EXEEXT)" || exit 0; \
> +-	list=`for p in $$list; do echo "$$p"; done | sed 's/$(EXEEXT)$$//'`; \
> +-	echo " rm -f" $$list; \
> +-	rm -f $$list
> +-mkdefs$(EXEEXT): $(mkdefs_OBJECTS) $(mkdefs_DEPENDENCIES) $(EXTRA_mkdefs_DEPENDENCIES) 
> +-	@rm -f mkdefs$(EXEEXT)
> +-	$(AM_V_CCLD)$(LINK) $(mkdefs_OBJECTS) $(mkdefs_LDADD) $(LIBS)
> +-
> + mostlyclean-compile:
> + 	-rm -f *.$(OBJEXT)
> + 
> +Index: graphviz-2.38.0/lib/gvpr/Makefile.am
> +===================================================================
> +--- graphviz-2.38.0.orig/lib/gvpr/Makefile.am
> ++++ graphviz-2.38.0/lib/gvpr/Makefile.am
> +@@ -21,7 +21,6 @@ AM_CPPFLAGS = \
> + 	-DDFLT_GVPRPATH="\".$(PATH_SEPARATOR)$(pkgdatadir)/gvpr\""
> + 
> + pkginclude_HEADERS = gvpr.h
> +-noinst_PROGRAMS = mkdefs
> + noinst_HEADERS = actions.h compile.h gprstate.h parse.h queue.h trieFA.h trie.c
> + noinst_LTLIBRARIES = libgvpr_C.la
> + lib_LTLIBRARIES = libgvpr.la
> +@@ -50,11 +49,10 @@ libgvpr_la_LIBADD = $(libgvpr_C_la_LIBAD
> + 	$(MATH_LIBS)
> + libgvpr_la_DEPENDENCIES = $(libgvpr_C_la_DEPENDENCIES)
> + 
> +-mkdefs_SOURCES = mkdefs.c
> + 
> + gdefs.h: $(top_srcdir)/lib/gvpr/gprdata mkdefs
> + 	./mkdefs gdefs.h < $(top_srcdir)/lib/gvpr/gprdata
> + 
> +-EXTRA_DIST = $(man_MANS) $(pdf_DATA) gprdata mkdefs.c gdefs.h trie.c gvprlib.vcproj
> ++EXTRA_DIST = $(man_MANS) $(pdf_DATA) gprdata gdefs.h trie.c gvprlib.vcproj
> + 
> + DISTCLEANFILES = $(pdf_DATA) gdefs.h mkdefs
> diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/linear_angle.gv b/meta-oe/recipes-graphics/graphviz/graphviz/linear_angle.gv
> new file mode 100644
> index 0000000..827bde5
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/graphviz/graphviz/linear_angle.gv
> @@ -0,0 +1,101 @@
> +digraph G { bgcolor="purple:pink" style="filled"
> +  subgraph cluster1 {fillcolor="blue:green" style="filled"
> +		node [shape=circle fillcolor="gold:brown" style="radial" gradientangle=180]
> +		a0 [label=<
> + <TABLE border="10" cellspacing="10" cellpadding="10" style="rounded" bgcolor="yellow:violet" gradientangle="315">
> +<TR><TD border="3"  bgcolor="yellow" gradientangle="315">00</TD>
> +<TD border="3"  bgcolor="yellow:green" gradientangle="315">01</TD>
> +<TD border="3"  bgcolor="green" gradientangle="315">02</TD>
> +<TD border="3"  bgcolor="green:blue" gradientangle="315">03</TD>
> +<TD border="3"  bgcolor="blue" gradientangle="315">04</TD>
> +<TD border="3"  bgcolor="blue:purple" gradientangle="315">05</TD>
> +<TD border="3"  bgcolor="purple" gradientangle="315">06</TD>
> +<TD border="3"  bgcolor="purple:violet" gradientangle="315">07</TD>
> +<TD border="3"  bgcolor="violet" gradientangle="315">08</TD></TR>
> +  
> +<TR><TD border="3"  bgcolor="yellow:gold"  gradientangle="315">10</TD>
> +<TD border="3"  bgcolor="yellow:green"  gradientangle="315">11</TD>
> +<TD border="3"  bgcolor="yellow:green"  gradientangle="315">12</TD>
> +<TD border="3"  bgcolor="yellow:blue"  gradientangle="315">13</TD>
> +<TD border="3"  bgcolor="yellow:blue"  gradientangle="315">14</TD>
> +<TD border="3"  bgcolor="yellow:purple"  gradientangle="315">15</TD>
> +<TD border="3"  bgcolor="yellow:purple"  gradientangle="315">16</TD>
> +<TD border="3"  bgcolor="yellow:violet"  gradientangle="315">17</TD>
> +<TD border="3"  bgcolor="yellow:violet"  gradientangle="315">18</TD></TR>
> +  
> +<TR><TD border="3"  bgcolor="gold"  gradientangle="315">20</TD>
> +<TD border="3"  bgcolor="gold:green"  gradientangle="315">21</TD>
> +<TD border="3"  bgcolor="gold:green"  gradientangle="315">22</TD>
> +<TD border="3"  bgcolor="gold:blue"  gradientangle="315">23</TD>
> +<TD border="3"  bgcolor="gold:blue"  gradientangle="315">24</TD>
> +<TD border="3"  bgcolor="gold:purple"  gradientangle="315">25</TD>
> +<TD border="3"  bgcolor="gold:purple"  gradientangle="315">26</TD>
> +<TD border="3"  bgcolor="gold:violet"  gradientangle="315">27</TD>
> +<TD border="3"  bgcolor="gold:violet"  gradientangle="315">28</TD></TR>
> +  
> +<TR><TD border="3"  bgcolor="gold:orange"  gradientangle="315">30</TD>
> +<TD border="3"  bgcolor="orange:green"  gradientangle="315">31</TD>
> +<TD border="3"  bgcolor="orange:green"  gradientangle="315">32</TD>
> +<TD border="3"  bgcolor="orange:blue"  gradientangle="315">33</TD>
> +<TD border="3"  bgcolor="orange:blue"  gradientangle="315">34</TD>
> +<TD border="3"  bgcolor="orange:purple"  gradientangle="315">35</TD>
> +<TD border="3"  bgcolor="orange:purple"  gradientangle="315">36</TD>
> +<TD border="3"  bgcolor="orange:violet"  gradientangle="315">37</TD>
> +<TD border="3"  bgcolor="orange:violet"  gradientangle="315">38</TD></TR>
> +  
> +<TR><TD border="3"  bgcolor="orange"  gradientangle="315">40</TD>
> +<TD border="3"  bgcolor="orange:green"  gradientangle="315">41</TD>
> +<TD border="3"  bgcolor="orange:green"  gradientangle="315">42</TD>
> +<TD border="3"  bgcolor="orange:blue"  gradientangle="315">43</TD>
> +<TD border="3"  bgcolor="orange:blue"  gradientangle="315">44</TD>
> +<TD border="3"  bgcolor="orange:purple"  gradientangle="315">45</TD>
> +<TD border="3"  bgcolor="orange:purple"  gradientangle="315">46</TD>
> +<TD border="3"  bgcolor="orange:violet"  gradientangle="315">47</TD>
> +<TD border="3"  bgcolor="orange:violet"  gradientangle="315">48</TD></TR>
> +  
> +<TR><TD border="3"  bgcolor="orange:red"  gradientangle="315">50</TD>
> +<TD border="3"  bgcolor="red:green"  gradientangle="315">51</TD>
> +<TD border="3"  bgcolor="red:green"  gradientangle="315">52</TD>
> +<TD border="3"  bgcolor="red:blue"  gradientangle="315">53</TD>
> +<TD border="3"  bgcolor="red:blue"  gradientangle="315">54</TD>
> +<TD border="3"  bgcolor="red:purple"  gradientangle="315">55</TD>
> +<TD border="3"  bgcolor="red:purple"  gradientangle="315">56</TD>
> +<TD border="3"  bgcolor="red:violet"  gradientangle="315">57</TD>
> +<TD border="3"  bgcolor="red:violet"  gradientangle="315">58</TD></TR>
> +  
> +<TR><TD border="3"  bgcolor="red"  gradientangle="315">60</TD>
> +<TD border="3"  bgcolor="red:green"  gradientangle="315">61</TD>
> +<TD border="3"  bgcolor="red:green"  gradientangle="315">62</TD>
> +<TD border="3"  bgcolor="red:blue"  gradientangle="315">63</TD>
> +<TD border="3"  bgcolor="red:blue"  gradientangle="315">64</TD>
> +<TD border="3"  bgcolor="red:purple"  gradientangle="315">65</TD>
> +<TD border="3"  bgcolor="red:purple"  gradientangle="315">66</TD>
> +<TD border="3"  bgcolor="red:violet"  gradientangle="315">67</TD>
> +<TD border="3"  bgcolor="red:violet"  gradientangle="315">68</TD></TR>
> +  
> +<TR><TD border="3"  bgcolor="red:brown"  gradientangle="315">70</TD>
> +<TD border="3"  bgcolor="brown:green"  gradientangle="315">71</TD>
> +<TD border="3"  bgcolor="brown:green"  gradientangle="315">72</TD>
> +<TD border="3"  bgcolor="brown:blue"  gradientangle="315">73</TD>
> +<TD border="3"  bgcolor="brown:blue"  gradientangle="315">74</TD>
> +<TD border="3"  bgcolor="brown:purple"  gradientangle="315">75</TD>
> +<TD border="3"  bgcolor="brown:purple"  gradientangle="315">76</TD>
> +<TD border="3"  bgcolor="brown:violet"  gradientangle="315">77</TD>
> +<TD border="3"  bgcolor="brown:violet"  gradientangle="315">78</TD></TR>
> +  
> +<TR><TD border="3"  bgcolor="brown"  gradientangle="315">80</TD>
> +<TD border="3"  bgcolor="brown:green"  gradientangle="315">81</TD>
> +<TD border="3"  bgcolor="brown:green"  gradientangle="315">82</TD>
> +<TD border="3"  bgcolor="brown:blue"  gradientangle="315">83</TD>
> +<TD border="3"  bgcolor="brown:blue"  gradientangle="315">84</TD>
> +<TD border="3"  bgcolor="brown:purple"  gradientangle="315">85</TD>
> +<TD border="3"  bgcolor="brown:purple"  gradientangle="315">86</TD>
> +<TD border="3"  bgcolor="brown:violet"  gradientangle="315">87</TD>
> +<TD border="3"  bgcolor="brown:violet"  gradientangle="315">88</TD></TR>
> +  
> +</TABLE>>];
> +
> +}
> +
> +} 
> +
> diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/simple.gv b/meta-oe/recipes-graphics/graphviz/graphviz/simple.gv
> new file mode 100644
> index 0000000..1b140f9
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/graphviz/graphviz/simple.gv
> @@ -0,0 +1 @@
> +    graph { a -- b; b -- c; a -- c; d -- c; e -- c; e -- a; } 
> diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.38.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.38.0.bb
> new file mode 100644
> index 0000000..1ace8c8
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.38.0.bb
> @@ -0,0 +1,149 @@
> +SUMMARY = "Graphviz - Graph Visualization Software."
> +DESCRIPTION = "Graphviz is open source graph visualization software. Graph visualization is a way of representing structural information as diagrams of abstract graphs and networks. It has important applications in networking, bioinformatics,  software engineering, database and web design, machine learning, and in visual interfaces for other technical domains."
> +HOMEPAGE = "http://www.graphviz.org/"
> +SECTION = "graphics"
> +LICENSE = "EPL-1.0"
> +LIC_FILES_CHKSUM = "file://COPYING;beginline=1;endline=2;md5=737cf7b11c0759e6d3b0d6cb08b7c4f8"
> +
> +DEPENDS += "graphviz-native bison flex libtool zlib chrpath-replacement-native"
> +DEPENDS_class-native = ""
> +
> +SRC_URI_BASE = "${DEBIAN_MIRROR}/main/g/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive \
> +           ${DEBIAN_MIRROR}/main/g/${BPN}/${BPN}_${PV}-7.debian.tar.xz;name=patch \
> +"
> +
> +SRC_URI = "${SRC_URI_BASE} \
> +        file://graphviz_no_mkdef_build.patch \
> +        file://simple.gv \
> +        file://linear_angle.gv \
> +        "
> +
> +SRC_URI_class-native = "${SRC_URI_BASE}"
> +
> +SRC_URI[archive.md5sum] = "5b6a829b2ac94efcd5fa3c223ed6d3ae"
> +SRC_URI[archive.sha256sum] = "81aa238d9d4a010afa73a9d2a704fc3221c731e1e06577c2ab3496bdef67859e"
> +SRC_URI[patch.md5sum] = "5cbcff92169d682471cdfdf58d215098"
> +SRC_URI[patch.sha256sum] = "312ab8215fbe1800664675cfc284aecfeff3ce699407523b5bdefee64cf1a53c"
> +
> +inherit autotools-brokensep pkgconfig
> +
> +LDFLAGS += "-Wunused-but-set-variable -Wmaybe-uninitialized -Wunused-variable"
> +
> +PACKAGECONFIG ?= "ghost rsvg cairo swig tcl gtk lua sfdp png libgd \
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'X11', '', d)} \
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'glut', '', d)}"
> +
> +PACKAGECONFIG_class-native ??= ""
> +
> +PACKAGECONFIG[sfdp] = "--enable-sfdp=yes, --disable-sfdp, ,"
> +PACKAGECONFIG[swig] = "--enable-swig=yes, --disable-swig, swig,"
> +PACKAGECONFIG[lua] = "--enable-lua=yes, --disable-lua, lua,"
> +PACKAGECONFIG[cairo] = "--with-pangocairo=yes, --with-pangocairo=no, cairo,"
> +PACKAGECONFIG[tcl] = "--enable-tcl=yes --with-tclsh=tclsh, --disable-tcl, tcl, tcl"
> +PACKAGECONFIG[glut] = "--with-glut=yes, --without-glut, mesa-glut,"
> +PACKAGECONFIG[gtk] = "--with-gtk=yes, --without-gtk, gtk+,"
> +PACKAGECONFIG[expect] = "--with-expect=yes, --without-expect, expect,"
> +PACKAGECONFIG[ghost] = "--with-ghostscript=yes, --without-ghostscript, ghostscript,"
> +PACKAGECONFIG[fontconfig] = "--with-fontconfig=yes, --without-fontconfig, fontconfig,"
> +PACKAGECONFIG[freetype] = "--with-freetype2=yes, --with-freetype2=no, freetype,"
> +PACKAGECONFIG[poppler] = "--with-poppler=yes, --with-poppler=no, poppler,"
> +PACKAGECONFIG[guile] = "--enable-guile, --disable-guile, guile,"
> +PACKAGECONFIG[php] = "--enable-php, --disable-php , php,"
> +PACKAGECONFIG[perl] = "--enable-perl, --disable-perl, perl,"
> +PACKAGECONFIG[python] = "--enable-python, --disable-python, python ,"
> +PACKAGECONFIG[ruby] = "--enable-ruby, --disable-ruby, ruby, "
> +PACKAGECONFIG[qt] = "--with-qt=yes, --with-qt=no, qte,"
> +PACKAGECONFIG[glade] = "--with-glade=yes, --with-glade=no, glade3,"
> +PACKAGECONFIG[libgd] = "--with-libgd=yes, --with-libgd=no, libglade,"
> +PACKAGECONFIG[png] = "--with-libpng=yes, --with-libpng=no, libpng, libpng"
> +PACKAGECONFIG[rsvg] = "--with-rsvg=yes, --with-rsvg=no, librsvg, librsvg"
> +PACKAGECONFIG[pixbuf] = "--with-gdk=yes --with-gdk-pixbuf=yes, --with-gdk=no --with-gdk-pixbuf=no, gdk-pixbuf,"
> +PACKAGECONFIG[X11] = "--with-x, --without-x, libx11 virtual/libx11 , libxaw7"
> +
> +CONFIGUREOPTS = " --build=${BUILD_SYS} \
> +    --host=${HOST_SYS} \
> +    --prefix=${prefix} \
> +    --exec_prefix=${exec_prefix} \
> +    --bindir=${bindir} \
> +    --sbindir=${sbindir} \
> +    --libexecdir=${libexecdir} \
> +    --datadir=${datadir} \
> +    --sysconfdir=${sysconfdir} \
> +    --sharedstatedir=${sharedstatedir} \
> +    --localstatedir=${localstatedir} \
> +    --libdir=${libdir} \
> +    --includedir=${includedir} \
> +    --oldincludedir=${oldincludedir} \
> +    --infodir=${infodir} \
> +    --mandir=${mandir} \
> +"
> +
> +EXTRA_OECONF += "--enable-ltdl"
> +
> +EXTRA_OECONF_class-native = " \
> +    --enable-sharp=no \
> +    --enable-java=no \
> +    --enable-ocaml=no \
> +    --enable-r=no \
> +    --with-devil=no \
> +    --with-lasi=no \
> +    --with-gtkgl=no \
> +    --with-gtkglext=no \
> +    --with-gts=no \
> +    --with-ann=no \
> +    --with-ortho=no \
> +    --with-digcola=no \
> +    --with-smyrna=no \
> +    --with-ipsepcola=no \
> +     "
> +EXTRANATIVEPATH += "chrpath-native"
> +
> +debian_do_patch() {
> +    cd ${S}
> +    while read line; do patch -p1 < ${WORKDIR}/debian/patches/$line; done < ${WORKDIR}/debian/patches/series
> +}
> +
> +python do_patch() {
> +    bb.build.exec_func('debian_do_patch', d)
> +    bb.build.exec_func('patch_do_patch', d)
> +}
> +
> +do_configure_prepend () {
> +    # copy mkdefs from the native graphviz build
> +    if [ "${PN}" != "graphviz-native" ]; then
> +        cp ${STAGING_BINDIR_NATIVE}/graphviz-${PV}/mkdefs ${S}/lib/gvpr/.
> +    fi
> +    ./autogen.sh
> +}
> +
> +do_compile_class-native () {
> +    cd lib/gvpr
> +    oe_runmake mkdefs
> +}
> +
> +do_install_append () {
> +    if [ "${PN}" != "graphviz-native" ]; then
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
> +if test "x$D" != "x"; then
> +    exit 1
> +else
> +    ${bindr}/dot -c
> +fi
> +}
> +
> +INSANE_SKIP_${PN} += "dev-so"
> +
> +RDEPENDS_${PN} = "libxml2 libcroco"
> +RDEPENDS_class-native = ""
> +
> +BBCLASSEXTEND = "native"
> 

