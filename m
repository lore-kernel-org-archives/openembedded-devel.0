Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P6m20-0007FY-8L
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 17:17:19 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9FFGi4Q008671
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 15 Oct 2010 10:16:44 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9FFGixb017451;
	Fri, 15 Oct 2010 10:16:44 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9FFGi5W013342;
	Fri, 15 Oct 2010 10:16:44 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Fri, 15 Oct 2010 10:16:44 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Chase Maupin <chasemaupin03@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Oct 2010 10:16:43 -0500
Thread-Topic: [PATCHv2] recipe licenses: update recipe LICENSE fields
Thread-Index: ActpXzD+J5+1XoPqQ7SIQVhABbrTjgDHLg9A
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310FFABDF@dlee06.ent.ti.com>
References: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>
In-Reply-To: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.152
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] recipe licenses: update recipe LICENSE fields
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
X-List-Received-Date: Fri, 15 Oct 2010 15:17:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

ping
> -----Original Message-----
> From: Chase Maupin [mailto:chasemaupin03@gmail.com]
> Sent: Monday, October 11, 2010 10:58 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: [PATCHv2] recipe licenses: update recipe LICENSE fields
>
> * While verifying the licensing for the packages I am building
>   into my file system I found that for some packages the
>   LICENSE value set in the recipe was either incorrect or
>   generic and not detailed enough.  This patch is my attempt
>   to update the LICENSE fields for these packages to match
>   the actual versions of the licenses in the sources.
>
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
>
> ---
> Added in version 2:
> * Checked sources and updated GPLv2 packages to GPLv2+ if the
>   "or later" clause was found in the sources.
> * Changed the separator for packages licensed under multiple
>   licenses to "|" instead of "/"
> ---
>  recipes/autoconf/autoconf.inc                      |    2 +-
>  recipes/autoconf/autoconf213_2.13.bb               |    1 +
>  recipes/autoconf/autoconf_2.61.bb                  |    2 ++
>  recipes/bison/bison.inc                            |    2 +-
>  recipes/dbus/dbus-c++_git.bb                       |    2 +-
>  recipes/dbus/dbus-daemon-proxy_git.bb              |    2 +-
>  recipes/dbus/dbus-glib.inc                         |    2 +-
>  recipes/dbus/dbus.inc                              |    2 +-
>  .../desktop-file-utils-native_0.14.bb              |    2 +-
>  .../desktop-file-utils/desktop-file-utils_0.15.bb  |    2 +-
>  .../desktop-file-utils/desktop-file-utils_0.16.bb  |    2 +-
>  .../desktop-file-utils/desktop-file-utils_0.3.bb   |    2 +-
>  .../desktop-file-utils/desktop-file-utils_0.6.bb   |    2 +-
>  recipes/e2fsprogs/e2fsprogs.inc                    |    2 +-
>  recipes/genext2fs/genext2fs.inc                    |    2 +-
>  recipes/git/git.inc                                |    2 +-
>  recipes/glib-2.0/glib-2.0_2.22.4.bb                |    2 +-
>  recipes/glib-2.0/glib-2.0_2.23.6.bb                |    2 +-
>  recipes/glib-2.0/glib-2.0_2.24.0.bb                |    2 +-
>  recipes/glib-2.0/glib-2.0_2.24.1.bb                |    2 +-
>  recipes/glib-2.0/glib-2.0_2.6.4.bb                 |    2 +-
>  recipes/glib-2.0/glib-2.0_2.8.6.bb                 |    2 +-
>  recipes/glib-2.0/glib.inc                          |    2 +-
>  recipes/iperf/iperf.inc                            |    2 +-
>  recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb    |    2 +-
>  recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb   |    2 +-
>  recipes/iptables/iptables.inc                      |    2 +-
>  recipes/libtool/libtool.inc                        |    2 +-
>  recipes/linux-libc-headers/linux-libc-headers.inc  |    2 +-
>  recipes/pkgconfig/pkgconfig.inc                    |    2 +-
>  recipes/psplash/psplash.inc                        |    2 +-
>  recipes/quilt/quilt.inc                            |    2 +-
>  recipes/thttpd/thttpd_2.25b.bb                     |    2 +-
>  recipes/tinylogin/tinylogin_1.4.bb                 |    2 +-
>  recipes/unifdef/unifdef-native_2.6.18+git.bb       |    2 +-
>  recipes/update-rc.d/update-rc.d_0.7.bb             |    2 +-
>  recipes/x-load/signgp.bb                           |    2 +-
>  recipes/x-load/x-load.inc                          |    2 +-
>  recipes/xorg-lib/xorg-headers-native.bb            |    2 ++
>  39 files changed, 41 insertions(+), 36 deletions(-)
>
> diff --git a/recipes/autoconf/autoconf.inc b/recipes/autoconf/autoconf.in=
c
> index 35b0289..70e24a0 100644
> --- a/recipes/autoconf/autoconf.inc
> +++ b/recipes/autoconf/autoconf.inc
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "A package of M4 macros to produce scripts to \
>  automatically configure sourcecode."
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv3+exception"
>  HOMEPAGE =3D "http://www.gnu.org/software/autoconf/"
>  SECTION =3D "devel"
>  DEPENDS +=3D "m4-native"
> diff --git a/recipes/autoconf/autoconf213_2.13.bb
> b/recipes/autoconf/autoconf213_2.13.bb
> index d060bbd..cd55073 100644
> --- a/recipes/autoconf/autoconf213_2.13.bb
> +++ b/recipes/autoconf/autoconf213_2.13.bb
> @@ -1,4 +1,5 @@
>  require autoconf.inc
> +LICENSE =3D "GPLv2+"
>  SRC_URI =3D "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz"
>  EXTRA_OECONF =3D "--program-transform-name=3Ds/\$/2.13/"
>  EXTRA_OEMAKE =3D 'acdatadir=3D"${datadir}/autoconf-${PV}"
> infodir=3D"${datadir}/autoconf-${PV}/info"'
> diff --git a/recipes/autoconf/autoconf_2.61.bb
> b/recipes/autoconf/autoconf_2.61.bb
> index 9542e21..4588608 100644
> --- a/recipes/autoconf/autoconf_2.61.bb
> +++ b/recipes/autoconf/autoconf_2.61.bb
> @@ -1,5 +1,7 @@
>  require autoconf.inc
>
> +LICENSE =3D "GPLv2+"
> +
>  PR =3D "${INC_PR}.1"
>
>  SRC_URI +=3D "file://autoreconf-include.patch \
> diff --git a/recipes/bison/bison.inc b/recipes/bison/bison.inc
> index 3441bcf..023895e 100644
> --- a/recipes/bison/bison.inc
> +++ b/recipes/bison/bison.inc
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "GNU Project parser generator (yacc replacement)."
>  HOMEPAGE =3D "http://www.gnu.org/software/bison/"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+"
>  SECTION =3D "devel"
>  PRIORITY =3D "optional"
>  DEPENDS =3D "virtual/libintl flex-native"
> diff --git a/recipes/dbus/dbus-c++_git.bb b/recipes/dbus/dbus-c++_git.bb
> index 7d9db3e..6459823 100644
> --- a/recipes/dbus/dbus-c++_git.bb
> +++ b/recipes/dbus/dbus-c++_git.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION =3D "C++ bindings for dbus"
> -LICENSE =3D "LGPL"
> +LICENSE =3D "LGPLv2.1+"
>  SECTION =3D "libs"
>  DEPENDS =3D "dbus dbus-c++-native expat"
>  SRCREV =3D "530a887913d3b0dd7091eabb8eef8e3c279e3bb8"
> diff --git a/recipes/dbus/dbus-daemon-proxy_git.bb b/recipes/dbus/dbus-
> daemon-proxy_git.bb
> index 16cc34f..32ed7db 100644
> --- a/recipes/dbus/dbus-daemon-proxy_git.bb
> +++ b/recipes/dbus/dbus-daemon-proxy_git.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION =3D "dbus forwarding daemon"
> -LICENSE =3D "GPL"
> +LICENSE =3D "LGPLv2.1+"
>  DEPENDS =3D "dbus dbus-glib"
>  SRCREV =3D "1226a0a1374628ff191f6d8a56000be5e53e7608"
>  PV =3D "0.0.0+gitr${SRCPV}"
> diff --git a/recipes/dbus/dbus-glib.inc b/recipes/dbus/dbus-glib.inc
> index 4db734b..c1c1813 100644
> --- a/recipes/dbus/dbus-glib.inc
> +++ b/recipes/dbus/dbus-glib.inc
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "GLib bindings for the dbus message bus system"
>  HOMEPAGE =3D "http://www.freedesktop.org/Software/dbus"
>  SECTION =3D "libs"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+ AFLv2.1"
>
>  DEPENDS =3D "expat glib-2.0 virtual/libintl dbus-glib-native dbus"
>  DEPENDS_virtclass-native =3D "expat-native glib-2.0-native dbus-native"
> diff --git a/recipes/dbus/dbus.inc b/recipes/dbus/dbus.inc
> index 55a156d..73fc426 100644
> --- a/recipes/dbus/dbus.inc
> +++ b/recipes/dbus/dbus.inc
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "A message bus system for inter-process communication"
>  HOMEPAGE =3D "http://dbus.freedesktop.org"
>  SECTION =3D "base"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+ AFLv2.1"
>  DEPENDS =3D "expat glib-2.0 virtual/libintl libsm libice virtual/libx11"
>
>  INC_PR =3D "r19"
> diff --git a/recipes/desktop-file-utils/desktop-file-utils-native_0.14.bb
> b/recipes/desktop-file-utils/desktop-file-utils-native_0.14.bb
> index fa7a633..1da30b1 100644
> --- a/recipes/desktop-file-utils/desktop-file-utils-native_0.14.bb
> +++ b/recipes/desktop-file-utils/desktop-file-utils-native_0.14.bb
> @@ -1,7 +1,7 @@
>  SECTION =3D "console/utils"
>  HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/desktop-file-util=
s"
>  DESCRIPTION =3D "command line utilities to work with *.desktop files"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+"
>
>  DEPENDS =3D "glib-2.0-native"
>
> diff --git a/recipes/desktop-file-utils/desktop-file-utils_0.15.bb
> b/recipes/desktop-file-utils/desktop-file-utils_0.15.bb
> index 89919b8..6c1e9f7 100644
> --- a/recipes/desktop-file-utils/desktop-file-utils_0.15.bb
> +++ b/recipes/desktop-file-utils/desktop-file-utils_0.15.bb
> @@ -1,7 +1,7 @@
>  SECTION =3D "console/utils"
>  HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/desktop-file-util=
s"
>  DESCRIPTION =3D "command line utilities to work with *.desktop files"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+"
>
>  DEPENDS =3D "glib-2.0"
>
> diff --git a/recipes/desktop-file-utils/desktop-file-utils_0.16.bb
> b/recipes/desktop-file-utils/desktop-file-utils_0.16.bb
> index 0d2ab9a..9a2ffc3 100644
> --- a/recipes/desktop-file-utils/desktop-file-utils_0.16.bb
> +++ b/recipes/desktop-file-utils/desktop-file-utils_0.16.bb
> @@ -1,7 +1,7 @@
>  SECTION =3D "console/utils"
>  HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/desktop-file-util=
s"
>  DESCRIPTION =3D "command line utilities to work with *.desktop files"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+"
>
>  DEPENDS =3D "glib-2.0"
>
> diff --git a/recipes/desktop-file-utils/desktop-file-utils_0.3.bb
> b/recipes/desktop-file-utils/desktop-file-utils_0.3.bb
> index 4bd0295..48ac169 100644
> --- a/recipes/desktop-file-utils/desktop-file-utils_0.3.bb
> +++ b/recipes/desktop-file-utils/desktop-file-utils_0.3.bb
> @@ -1,7 +1,7 @@
>  SECTION =3D "console/utils"
>  HOMEPAGE =3D "http://www.freedesktop.org/Software/desktop-file-utils"
>  DESCRIPTION =3D "command line utilities to work with *.desktop files"
> -LICENSE =3D "GPLv2"
> +LICENSE =3D "GPLv2+"
>  DEPENDS =3D "popt glib-2.0"
>
>  SRC_URI =3D "http://freedesktop.org/software/desktop-file-
> utils/releases/desktop-file-utils-${PV}.tar.gz \
> diff --git a/recipes/desktop-file-utils/desktop-file-utils_0.6.bb
> b/recipes/desktop-file-utils/desktop-file-utils_0.6.bb
> index 2a1eaf2..0e5c8e8 100644
> --- a/recipes/desktop-file-utils/desktop-file-utils_0.6.bb
> +++ b/recipes/desktop-file-utils/desktop-file-utils_0.6.bb
> @@ -1,7 +1,7 @@
>  SECTION =3D "console/utils"
>  HOMEPAGE =3D "http://www.freedesktop.org/Software/desktop-file-utils"
>  DESCRIPTION =3D "command line utilities to work with *.desktop files"
> -LICENSE =3D "GPLv2"
> +LICENSE =3D "GPLv2+"
>  DEPENDS =3D "popt glib-2.0 gnome-vfs"
>
>  SRC_URI =3D "http://freedesktop.org/software/desktop-file-
> utils/releases/desktop-file-utils-${PV}.tar.gz"
> diff --git a/recipes/e2fsprogs/e2fsprogs.inc
> b/recipes/e2fsprogs/e2fsprogs.inc
> index 37d3b6d..7697440 100644
> --- a/recipes/e2fsprogs/e2fsprogs.inc
> +++ b/recipes/e2fsprogs/e2fsprogs.inc
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "EXT2 Filesystem Utilities"
>  HOMEPAGE =3D "http://e2fsprogs.sf.net"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+|LGPLv2+|NewBSD|MIT"
>  SECTION =3D "base"
>  DEPENDS =3D "gettext-native util-linux-ng"
>  DEPENDS_virtclass-native =3D "gettext-native util-linux-ng-native"
> diff --git a/recipes/genext2fs/genext2fs.inc
> b/recipes/genext2fs/genext2fs.inc
> index c2984bc..503c74f 100644
> --- a/recipes/genext2fs/genext2fs.inc
> +++ b/recipes/genext2fs/genext2fs.inc
> @@ -1,4 +1,4 @@
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2"
>  DESCRIPTION =3D "A tool to generate an ext2 filesystem \
>  as a normal (non-root) user."
>  SECTION =3D "console/utils"
> diff --git a/recipes/git/git.inc b/recipes/git/git.inc
> index bbbd7e9..003d7fa 100644
> --- a/recipes/git/git.inc
> +++ b/recipes/git/git.inc
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "The git revision control system used by the Linux kerne=
l
> developers"
>  SECTION =3D "console/utils"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2"
>
>  SRC_URI =3D "http://www.kernel.org/pub/software/scm/git/git-
> ${PV}.tar.bz2;name=3Dsrc"
>
> diff --git a/recipes/glib-2.0/glib-2.0_2.22.4.bb b/recipes/glib-2.0/glib-
> 2.0_2.22.4.bb
> index 05a1342..ddaf4d2 100644
> --- a/recipes/glib-2.0/glib-2.0_2.22.4.bb
> +++ b/recipes/glib-2.0/glib-2.0_2.22.4.bb
> @@ -3,7 +3,7 @@ which provides many useful data types, macros, \
>  type conversions, string utilities, file utilities, a main \
>  loop abstraction, and so on. It works on many \
>  UNIX-like platforms, Windows, OS/2 and BeOS."
> -LICENSE =3D "LGPL"
> +LICENSE =3D "LGPLv2+"
>  SECTION =3D "libs"
>  PRIORITY =3D "optional"
>  DEPENDS =3D "glib-2.0-native gtk-doc virtual/libiconv virtual/libintl"
> diff --git a/recipes/glib-2.0/glib-2.0_2.23.6.bb b/recipes/glib-2.0/glib-
> 2.0_2.23.6.bb
> index 51a2153..b2c900f 100644
> --- a/recipes/glib-2.0/glib-2.0_2.23.6.bb
> +++ b/recipes/glib-2.0/glib-2.0_2.23.6.bb
> @@ -3,7 +3,7 @@ which provides many useful data types, macros, \
>  type conversions, string utilities, file utilities, a main \
>  loop abstraction, and so on. It works on many \
>  UNIX-like platforms, Windows, OS/2 and BeOS."
> -LICENSE =3D "LGPL"
> +LICENSE =3D "LGPLv2+"
>  SECTION =3D "libs"
>  PRIORITY =3D "optional"
>  DEPENDS =3D "glib-2.0-native gtk-doc virtual/libiconv virtual/libintl zl=
ib"
> diff --git a/recipes/glib-2.0/glib-2.0_2.24.0.bb b/recipes/glib-2.0/glib-
> 2.0_2.24.0.bb
> index 3a90dc6..b0755a4 100644
> --- a/recipes/glib-2.0/glib-2.0_2.24.0.bb
> +++ b/recipes/glib-2.0/glib-2.0_2.24.0.bb
> @@ -3,7 +3,7 @@ which provides many useful data types, macros, \
>  type conversions, string utilities, file utilities, a main \
>  loop abstraction, and so on. It works on many \
>  UNIX-like platforms, Windows, OS/2 and BeOS."
> -LICENSE =3D "LGPL"
> +LICENSE =3D "LGPLv2+"
>  SECTION =3D "libs"
>  PRIORITY =3D "optional"
>  DEPENDS =3D "glib-2.0-native gtk-doc zlib"
> diff --git a/recipes/glib-2.0/glib-2.0_2.24.1.bb b/recipes/glib-2.0/glib-
> 2.0_2.24.1.bb
> index 3bc11de..79cb9b9 100644
> --- a/recipes/glib-2.0/glib-2.0_2.24.1.bb
> +++ b/recipes/glib-2.0/glib-2.0_2.24.1.bb
> @@ -3,7 +3,7 @@ which provides many useful data types, macros, \
>  type conversions, string utilities, file utilities, a main \
>  loop abstraction, and so on. It works on many \
>  UNIX-like platforms, Windows, OS/2 and BeOS."
> -LICENSE =3D "LGPL"
> +LICENSE =3D "LGPLv2+"
>  SECTION =3D "libs"
>  PRIORITY =3D "optional"
>  DEPENDS =3D "gtk-doc zlib"
> diff --git a/recipes/glib-2.0/glib-2.0_2.6.4.bb b/recipes/glib-2.0/glib-
> 2.0_2.6.4.bb
> index 1a483f4..ca3c133 100644
> --- a/recipes/glib-2.0/glib-2.0_2.6.4.bb
> +++ b/recipes/glib-2.0/glib-2.0_2.6.4.bb
> @@ -3,7 +3,7 @@ which provides many useful data types, macros, \
>  type conversions, string utilities, file utilities, a main \
>  loop abstraction, and so on. It works on many \
>  UNIX-like platforms, Windows, OS/2 and BeOS."
> -LICENSE =3D "LGPL"
> +LICENSE =3D "LGPLv2+"
>  SECTION =3D "libs"
>  PRIORITY =3D "optional"
>  DEPENDS +=3D "glib-2.0-native gtk-doc"
> diff --git a/recipes/glib-2.0/glib-2.0_2.8.6.bb b/recipes/glib-2.0/glib-
> 2.0_2.8.6.bb
> index f025046..f03072a 100644
> --- a/recipes/glib-2.0/glib-2.0_2.8.6.bb
> +++ b/recipes/glib-2.0/glib-2.0_2.8.6.bb
> @@ -3,7 +3,7 @@ which provides many useful data types, macros, \
>  type conversions, string utilities, file utilities, a main \
>  loop abstraction, and so on. It works on many \
>  UNIX-like platforms, Windows, OS/2 and BeOS."
> -LICENSE =3D "LGPL"
> +LICENSE =3D "LGPLv2+"
>  SECTION =3D "libs"
>  PRIORITY =3D "optional"
>  DEPENDS +=3D "glib-2.0-native gtk-doc"
> diff --git a/recipes/glib-2.0/glib.inc b/recipes/glib-2.0/glib.inc
> index 5cc697f..52c2f89 100644
> --- a/recipes/glib-2.0/glib.inc
> +++ b/recipes/glib-2.0/glib.inc
> @@ -3,7 +3,7 @@ which provides many useful data types, macros, \
>  type conversions, string utilities, file utilities, a main \
>  loop abstraction, and so on. It works on many \
>  UNIX-like platforms, Windows, OS/2 and BeOS."
> -LICENSE =3D "LGPL"
> +LICENSE =3D "LGPLv2"
>  SECTION =3D "libs"
>  PRIORITY =3D "optional"
>  DEPENDS +=3D "glib-2.0-native gtk-doc"
> diff --git a/recipes/iperf/iperf.inc b/recipes/iperf/iperf.inc
> index 138ba29..c9aea29 100644
> --- a/recipes/iperf/iperf.inc
> +++ b/recipes/iperf/iperf.inc
> @@ -1,7 +1,7 @@
>  SECTION =3D "console/network"
>  DESCRIPTION =3D "Iperf is a tool to measure maximum TCP bandwidth, allow=
ing
> the tuning of various parameters and UDP characteristics"
>  HOMEPAGE =3D "http://dast.nlanr.net/Projects/Iperf/"
> -LICENSE =3D "BSD"
> +LICENSE =3D "NewBSD"
>  INC_PR =3D "r1"
>
>  inherit autotools
> diff --git a/recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb
> b/recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb
> index 6687129..6a80d01 100644
> --- a/recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb
> +++ b/recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb
> @@ -1,6 +1,6 @@
>  SECTION =3D "base"
>  DESCRIPTION =3D "Itsy Package Manager utilities link script"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+"
>  CONFLICTS =3D "ipkg-utils"
>  SRCDATE =3D "20050930"
>  PR =3D "r4"
> diff --git a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
> b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
> index d22fd26..26584e9 100644
> --- a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
> +++ b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "Itsy Package Manager utilities"
>  SECTION =3D "base"
>  PRIORITY =3D "optional"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+"
>  CONFLICTS =3D "ipkg-link"
>  RDEPENDS_${PN} =3D "python"
>  SRCDATE =3D "20050930"
> diff --git a/recipes/iptables/iptables.inc b/recipes/iptables/iptables.in=
c
> index db2b6f0..5f948f3 100644
> --- a/recipes/iptables/iptables.inc
> +++ b/recipes/iptables/iptables.inc
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "iptables network filtering tools"
>  HOMEPAGE =3D "http://www.netfilter.org/"
>  SECTION =3D "console/utils"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+"
>
>  SRC_URI =3D "http://netfilter.org/projects/iptables/files/iptables-
> ${PV}.tar.bz2;name=3Diptables-${PV}"
>  S =3D "${WORKDIR}/iptables-${PV}"
> diff --git a/recipes/libtool/libtool.inc b/recipes/libtool/libtool.inc
> index 838f029..518b0b2 100644
> --- a/recipes/libtool/libtool.inc
> +++ b/recipes/libtool/libtool.inc
> @@ -3,7 +3,7 @@ This is GNU libtool, a generic library support script.
> Libtool hides \
>  the complexity of generating special library types (such as shared \
>  libraries) behind a consistent interface."
>  HOMEPAGE =3D "http://www.gnu.org/software/libtool/libtool.html"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+"
>  SECTION =3D "devel"
>
>  INC_PR =3D "r25"
> diff --git a/recipes/linux-libc-headers/linux-libc-headers.inc
> b/recipes/linux-libc-headers/linux-libc-headers.inc
> index 642e369..0b27e46 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers.inc
> +++ b/recipes/linux-libc-headers/linux-libc-headers.inc
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Sanitized set of 2.6 kernel headers for the C library's
> use."
>  SECTION =3D "devel"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2"
>  NATIVE_INSTALL_WORKS =3D "1"
>  BBCLASSEXTEND =3D "native"
>
> diff --git a/recipes/pkgconfig/pkgconfig.inc
> b/recipes/pkgconfig/pkgconfig.inc
> index acbda40..4edad6a 100644
> --- a/recipes/pkgconfig/pkgconfig.inc
> +++ b/recipes/pkgconfig/pkgconfig.inc
> @@ -4,7 +4,7 @@ compile/link flags that works with automake and autoconf.
> \
>  It replaces the ubiquitous *-config scripts you may have \
>  seen with a single tool."
>  HOMEPAGE =3D "http://pkg-config.freedesktop.org/wiki/"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+"
>  INC_PR =3D "r8"
>
>  SRC_URI =3D "http://pkgconfig.freedesktop.org/releases/pkg-config-
> ${PV}.tar.gz \
> diff --git a/recipes/psplash/psplash.inc b/recipes/psplash/psplash.inc
> index efd6a0c..fe446ed 100644
> --- a/recipes/psplash/psplash.inc
> +++ b/recipes/psplash/psplash.inc
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "Userspace framebuffer boot logo based on usplash."
>  HOMEPAGE =3D "http://projects.o-hand.com/psplash"
>  SECTION =3D "base"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+"
>  RDEPENDS_${PN} =3D "initscripts"
>  PROVIDES =3D "virtual/psplash"
>  RPROVIDES_${PN} =3D "virtual-psplash"
> diff --git a/recipes/quilt/quilt.inc b/recipes/quilt/quilt.inc
> index 7fd9eac..329c3b5 100644
> --- a/recipes/quilt/quilt.inc
> +++ b/recipes/quilt/quilt.inc
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "Tool to work with series of patches."
>  HOMEPAGE =3D "http://savannah.nongnu.org/projects/quilt/"
>  SECTION =3D "devel"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+"
>  INC_PR =3D "r7"
>
>  SRC_URI =3D "http://download.savannah.gnu.org/releases/quilt/quilt-
> ${PV}.tar.gz \
> diff --git a/recipes/thttpd/thttpd_2.25b.bb
> b/recipes/thttpd/thttpd_2.25b.bb
> index 85c7f70..bf03525 100644
> --- a/recipes/thttpd/thttpd_2.25b.bb
> +++ b/recipes/thttpd/thttpd_2.25b.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION =3D "A simple, small, portable, fast, and secure HTTP server=
."
> -LICENSE =3D "BSD"
> +LICENSE =3D "FreeBSD"
>  HOMEPAGE =3D "http://www.acme.com/software/thttpd/"
>  PR =3D"r8"
>
> diff --git a/recipes/tinylogin/tinylogin_1.4.bb
> b/recipes/tinylogin/tinylogin_1.4.bb
> index 40171ff..47c1190 100644
> --- a/recipes/tinylogin/tinylogin_1.4.bb
> +++ b/recipes/tinylogin/tinylogin_1.4.bb
> @@ -4,7 +4,7 @@ changing passwords, and otherwise maintaining users \
>  and groups on an embedded system."
>  HOMEPAGE =3D "http://tinylogin.busybox.net/"
>  SECTION =3D "base"
> -LICENSE =3D "GPLv2"
> +LICENSE =3D "GPLv2+|NewBSD"
>  PR =3D "r7"
>
>  #SRC_URI =3D "http://tinylogin.busybox.net/downloads/tinylogin-
> ${PV}.tar.bz2 \
> diff --git a/recipes/unifdef/unifdef-native_2.6.18+git.bb
> b/recipes/unifdef/unifdef-native_2.6.18+git.bb
> index ae3eb4f..56880a8 100644
> --- a/recipes/unifdef/unifdef-native_2.6.18+git.bb
> +++ b/recipes/unifdef/unifdef-native_2.6.18+git.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Kernel header preprocessor"
>  SECTION =3D "devel"
> -LICENSE =3D "GPL"
> +LICENSE =3D "FreeBSD"
>
>  SRC_URI =3D "file://unifdef.c"
>
> diff --git a/recipes/update-rc.d/update-rc.d_0.7.bb b/recipes/update-
> rc.d/update-rc.d_0.7.bb
> index d2d22ab..b36b8ca 100644
> --- a/recipes/update-rc.d/update-rc.d_0.7.bb
> +++ b/recipes/update-rc.d/update-rc.d_0.7.bb
> @@ -1,7 +1,7 @@
>  SECTION =3D "base"
>  PRIORITY =3D "standard"
>  DESCRIPTION =3D "Manage symlinks in /etc/rcN.d"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+"
>  S =3D "${WORKDIR}/update-rc.d"
>  INHIBIT_DEFAULT_DEPS =3D "1"
>  PR =3D "r1"
> diff --git a/recipes/x-load/signgp.bb b/recipes/x-load/signgp.bb
> index 8ee36b5..8eea85c 100644
> --- a/recipes/x-load/signgp.bb
> +++ b/recipes/x-load/signgp.bb
> @@ -1,4 +1,4 @@
> -LICENSE =3D "BSD"
> +LICENSE =3D "NewBSD"
>  DESCRIPTION =3D "Tool to sign omap3 x-loader images"
>
>  PR =3D "r4"
> diff --git a/recipes/x-load/x-load.inc b/recipes/x-load/x-load.inc
> index 0699c01..c7d0851 100644
> --- a/recipes/x-load/x-load.inc
> +++ b/recipes/x-load/x-load.inc
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "x-load bootloader loader"
>  SECTION =3D "bootloaders"
>  PRIORITY =3D "optional"
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+"
>
>  DEPENDS =3D "signgp-native"
>
> diff --git a/recipes/xorg-lib/xorg-headers-native.bb b/recipes/xorg-
> lib/xorg-headers-native.bb
> index e303c18..ce90fc0 100644
> --- a/recipes/xorg-lib/xorg-headers-native.bb
> +++ b/recipes/xorg-lib/xorg-headers-native.bb
> @@ -1,3 +1,5 @@
> +LICENSE =3D "MIT"
> +
>  PR =3D "r2"
>
>  SRC_URI =3D "file://X11"
> --
> 1.7.0.4



