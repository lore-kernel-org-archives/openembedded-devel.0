Return-Path: <B40869@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0142.outbound.protection.outlook.com [207.46.163.142])
	by mail.openembedded.org (Postfix) with ESMTP id 6F15565EE7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Aug 2014 07:42:44 +0000 (UTC)
Received: from BN1PR0301MB0756.namprd03.prod.outlook.com (25.160.78.150) by
	BN1PR0301MB0754.namprd03.prod.outlook.com (25.160.78.149) with
	Microsoft SMTP
	Server (TLS) id 15.0.995.14; Tue, 5 Aug 2014 07:42:43 +0000
Received: from BN1PR0301MB0756.namprd03.prod.outlook.com ([25.160.78.150]) by
	BN1PR0301MB0756.namprd03.prod.outlook.com ([25.160.78.150]) with
	mapi id 15.00.0995.014; Tue, 5 Aug 2014 07:42:43 +0000
From: "B40869@freescale.com" <B40869@freescale.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-webserver][PATCH v3] integrate fcgi-2.4.0 and add OML
	license file
Thread-Index: AQHPrTRsIpEI/cxEtk+j9ki52X/PHZvAoveAgAEEAiY=
Date: Tue, 5 Aug 2014 07:42:42 +0000
Message-ID: <1407225055047.39766@freescale.com>
References: <1406861456-16786-1-git-send-email-b40869@freescale.com>,
	<20140804161103.GB2465@jama>
In-Reply-To: <20140804161103.GB2465@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.158.211]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:
x-forefront-prvs: 02945962BD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(6009001)(51704005)(24454002)(199002)(189002)(377424004)(377454003)(54534003)(99396002)(15395725005)(15975445006)(106116001)(36756003)(105586002)(509001)(15202345003)(95666004)(31966008)(21056001)(99286002)(54356999)(106356001)(74502001)(80022001)(76176999)(50986999)(85306004)(74662001)(66066001)(76482001)(4396001)(81342001)(79102001)(16601075003)(81542001)(77982001)(2656002)(87936001)(575784001)(86362001)(19580405001)(83322001)(19580395003)(20776003)(101416001)(64706001)(107886001)(83072002)(85852003)(46102001)(77096002)(92726001)(92566001)(107046002);
	DIR:OUT; SFP:; SCL:1; SRVR:BN1PR0301MB0754;
	H:BN1PR0301MB0756.namprd03.prod.outlook.com; FPR:; MLV:ovrnspm;
	PTR:InfoNoRecords; MX:1; UriScan:(84726307001); LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-webserver][PATCH v3] integrate fcgi-2.4.0 and add OML license file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Aug 2014 07:42:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thank you, patch v4 is submitted. Test passed on master branch.=0A=
=0A=
BR,=0A=
YangHaibo=0A=
________________________________________=0A=
From: Martin Jansa <martin.jansa@gmail.com>=0A=
Sent: Tuesday, August 5, 2014 12:11 AM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Cc: Yang Haibo-B40869=0A=
Subject: Re: [oe] [meta-webserver][PATCH v3] integrate fcgi-2.4.0 and add O=
ML license file=0A=
=0A=
On Fri, Aug 01, 2014 at 10:50:56AM +0800, YangHaibo wrote:=0A=
> ---=0A=
>  meta-oe/licenses/OML                               | 28 ++++++++++++++++=
++++++=0A=
>  .../fcgi/fcgi/Fix_EOF_not_declared_issue.patch     | 17 +++++++++++++=0A=
>  meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb     | 16 +++++++++++++=0A=
>  3 files changed, 61 insertions(+)=0A=
>  create mode 100644 meta-oe/licenses/OML=0A=
>  create mode 100644 meta-webserver/recipes-fcgi/fcgi/fcgi/Fix_EOF_not_dec=
lared_issue.patch=0A=
>  create mode 100644 meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb=0A=
>=0A=
> diff --git a/meta-oe/licenses/OML b/meta-oe/licenses/OML=0A=
> new file mode 100644=0A=
> index 0000000..7e6bdfd=0A=
> --- /dev/null=0A=
> +++ b/meta-oe/licenses/OML=0A=
> @@ -0,0 +1,28 @@=0A=
> +This FastCGI application library source and object code (the=0A=
> +"Software") and its documentation (the "Documentation") are=0A=
> +copyrighted by Open Market, Inc ("Open Market").  The following terms=0A=
> +apply to all files associated with the Software and Documentation=0A=
> +unless explicitly disclaimed in individual files.=0A=
> +=0A=
> +Open Market permits you to use, copy, modify, distribute, and license=0A=
> +this Software and the Documentation for any purpose, provided that=0A=
> +existing copyright notices are retained in all copies and that this=0A=
> +notice is included verbatim in any distributions.  No written=0A=
> +agreement, license, or royalty fee is required for any of the=0A=
> +authorized uses.  Modifications to this Software and Documentation may=
=0A=
> +be copyrighted by their authors and need not follow the licensing=0A=
> +terms described here.  If modifications to this Software and=0A=
> +Documentation have new licensing terms, the new terms must be clearly=0A=
> +indicated on the first page of each file where they apply.=0A=
> +=0A=
> +OPEN MARKET MAKES NO EXPRESS OR IMPLIED WARRANTY WITH RESPECT TO THE=0A=
> +SOFTWARE OR THE DOCUMENTATION, INCLUDING WITHOUT LIMITATION ANY=0A=
> +WARRANTY OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  IN=0A=
> +NO EVENT SHALL OPEN MARKET BE LIABLE TO YOU OR ANY THIRD PARTY FOR ANY=
=0A=
> +DAMAGES ARISING FROM OR RELATING TO THIS SOFTWARE OR THE=0A=
> +DOCUMENTATION, INCLUDING, WITHOUT LIMITATION, ANY INDIRECT, SPECIAL OR=
=0A=
> +CONSEQUENTIAL DAMAGES OR SIMILAR DAMAGES, INCLUDING LOST PROFITS OR=0A=
> +LOST DATA, EVEN IF OPEN MARKET HAS BEEN ADVISED OF THE POSSIBILITY OF=0A=
> +SUCH DAMAGES.  THE SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS".=0A=
> +OPEN MARKET HAS NO LIABILITY IN CONTRACT, TORT, NEGLIGENCE OR=0A=
> +OTHERWISE ARISING OUT OF THIS SOFTWARE OR THE DOCUMENTATION.=0A=
> diff --git a/meta-webserver/recipes-fcgi/fcgi/fcgi/Fix_EOF_not_declared_i=
ssue.patch b/meta-webserver/recipes-fcgi/fcgi/fcgi/Fix_EOF_not_declared_iss=
ue.patch=0A=
> new file mode 100644=0A=
> index 0000000..b4cf080=0A=
> --- /dev/null=0A=
> +++ b/meta-webserver/recipes-fcgi/fcgi/fcgi/Fix_EOF_not_declared_issue.pa=
tch=0A=
> @@ -0,0 +1,17 @@=0A=
> +Upstream-Status: Pending=0A=
> +=0A=
> +Fix EOF not declared issue, following is the error log.=0A=
> +fcgio.cpp:70:72: error: 'EOF' was not declared in this scope=0A=
> +              if (FCGX_PutStr(pbase(), plen, this->fcgx) !=3D plen) retu=
rn EOF;=0A=
> +=0A=
> +Signed-off-by: Yang Haibo <b40869@freescale.com>=0A=
> +--- fcgi-ori/libfcgi/fcgio.cpp       2014-07-28 18:01:00.000000000 +0800=
=0A=
> ++++ fcgi-2.4.0/libfcgi/fcgio.cpp     2014-07-28 18:01:22.000000000 +0800=
=0A=
> +@@ -22,6 +22,7 @@=0A=
> + #define DLLAPI  __declspec(dllexport)=0A=
> + #endif=0A=
> +=0A=
> ++#include <stdio.h>=0A=
> + #include <limits.h>=0A=
> + #include "fcgio.h"=0A=
> +=0A=
> diff --git a/meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb b/meta-webser=
ver/recipes-fcgi/fcgi/fcgi_2.4.0.bb=0A=
> new file mode 100644=0A=
> index 0000000..ceb5909=0A=
> --- /dev/null=0A=
> +++ b/meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb=0A=
> @@ -0,0 +1,16 @@=0A=
> +DESCRIPTION =3D "FastCGI is a protocol for interfacing interactive progr=
ams with a web server."=0A=
> +HOMEPAGE =3D "http://www.fastcgi.com"=0A=
> +LICENSE =3D "OML"=0A=
> +LIC_FILES_CHKSUM =3D "file://LICENSE.TERMS;md5=3De3aacac3a647af6e7e31f18=
1cda0a06a"=0A=
> +=0A=
> +SRC_URI =3D "http://fossies.org/linux/www/fcgi-2.4.0.tar.gz \=0A=
=0A=
fcgi-2.4.0 -> ${BP}=0A=
=0A=
> +           file://Fix_EOF_not_declared_issue.patch \=0A=
> +"=0A=
> +SRC_URI[md5sum] =3D "d15060a813b91383a9f3c66faf84867e"=0A=
> +SRC_URI[sha256sum] =3D "66fc45c6b36a21bf2fbbb68e90f780cc21a9da1fffbae75e=
76d2b4402d3f05b9"=0A=
> +=0A=
> +S =3D "${WORKDIR}/${BPN}-${PV}/"=0A=
=0A=
This is default, you can drop it.=0A=
=0A=
> +=0A=
> +inherit autotools=0A=
> +=0A=
> +PARALLEL_MAKE =3D ""=0A=
=0A=
Fails in current master, you need to add foreign to AC_INIT_AUTOMAKE=0A=
=0A=
| Makefile.am: installing './INSTALL'=0A=
| Makefile.am: error: required file './NEWS' not found=0A=
| Makefile.am: error: required file './AUTHORS' not found=0A=
| Makefile.am: error: required file './ChangeLog' not found=0A=
| Makefile.am: installing './COPYING' using GNU General Public License v3 f=
ile=0A=
| Makefile.am:     Consider adding the COPYING file to the version control =
system=0A=
| Makefile.am:     for your code, to avoid questions about which license yo=
ur project uses=0A=
| automake: warning: autoconf input should be named 'configure.ac', not 'co=
nfigure.in'=0A=
| cgi-fcgi/Makefile.am:5: warning: 'CPPFLAGS' is a user variable, you shoul=
d not override it;=0A=
| cgi-fcgi/Makefile.am:5: use 'AM_CPPFLAGS' instead=0A=
| examples/Makefile.am:14: warning: 'CPPFLAGS' is a user variable, you shou=
ld not override it;=0A=
| examples/Makefile.am:14: use 'AM_CPPFLAGS' instead=0A=
| libfcgi/Makefile.am:4: warning: 'CPPFLAGS' is a user variable, you should=
 not override it;=0A=
| libfcgi/Makefile.am:4: use 'AM_CPPFLAGS' instead=0A=
| autoreconf: automake failed with exit status: 1=0A=
| ERROR: autoreconf execution failed.=0A=
| WARNING: exit code 1 from a shell command.=0A=
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/world/shr-core/tmp-eglibc/work/i586-oe-linux/fcgi/2.4.0-r0/temp/log.do=
_configure.23481)=0A=
NOTE: recipe fcgi-2.4.0-r0: task do_configure: Failed=0A=
ERROR: Task 35 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-webs=
erver/recipes-fcgi/fcgi/fcgi_2.4.0.bb, do_configure) failed with exit code =
'1'=0A=
=0A=
=0A=
> --=0A=
> 1.9.2=0A=
>=0A=
> --=0A=
> _______________________________________________=0A=
> Openembedded-devel mailing list=0A=
> Openembedded-devel@lists.openembedded.org=0A=
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=
=0A=
--=0A=
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com=0A=

