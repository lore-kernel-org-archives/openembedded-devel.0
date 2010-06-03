Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin@ti.com>) id 1OKAxG-0003K9-Ml
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 15:59:32 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id o53DtDNt013317
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Jun 2010 08:55:13 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o53DtDkI008736
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Jun 2010 08:55:13 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o53DtDBf021747
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Jun 2010 08:55:13 -0500 (CDT)
Received: from dlee02.ent.ti.com ([157.170.170.17]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Thu, 3 Jun 2010 08:55:13 -0500
From: "Ambrose, Martin" <martin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 3 Jun 2010 08:55:08 -0500
Thread-Topic: [oe] Examples of srctree and gitver
Thread-Index: AcsBj6NEMuShDVM+SsWWrlVuEGnUoABDDotgACIJRPA=
Message-ID: <A24693684029E5489D1D202277BE894455B8161C@dlee02.ent.ti.com>
References: <A24693684029E5489D1D202277BE89445316FB3A@dlee02.ent.ti.com>
	<AANLkTinePogltaKgN7CaqFVzw4PpDXSkE-f7H18PINOB@mail.gmail.com>
	<A24693684029E5489D1D202277BE894455A0F300@dlee02.ent.ti.com>
	<AANLkTinA1ZTsklvgjWbc87f9a5CgSXpbCth47yVKiPq-@mail.gmail.com>
	<A24693684029E5489D1D202277BE894455A0F458@dlee02.ent.ti.com>
	<4C050CE8.4080102@cbnco.com>
	<A24693684029E5489D1D202277BE894455B8125E@dlee02.ent.ti.com>
In-Reply-To: <A24693684029E5489D1D202277BE894455B8125E@dlee02.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-puzzleid: {C9C9340B-343D-48AF-902D-D3EABD0334EE}
x-cr-hashedpuzzle: BTlk CYG5 CZkO Cgge C9vl C/Bt DR9Q Dsxa EPvX FBqH GzOX
	H/HY ISmx J8dx K6xL Le4x; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {C9C9340B-343D-48AF-902D-D3EABD0334EE};
	bQBhAHIAdABpAG4AQAB0AGkALgBjAG8AbQA=; Thu,
	03 Jun 2010 13:55:09 GMT;
	UgBFADoAIABbAG8AZQBdACAARQB4AGEAbQBwAGwAZQBzACAAbwBmACAAcwByAGMAdAByAGUAZQAgAGEAbgBkACAAZwBpAHQAdgBlAHIA
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.153
X-SA-Exim-Mail-From: martin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Examples of srctree and gitver
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
X-List-Received-Date: Thu, 03 Jun 2010 13:59:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 02, 2010 at 16:47:17, Ambrose, Martin wrote:

> On Tue, Jun 01, 2010 at 08:36:40, Michael Smith wrote:
>=20
> > Ambrose, Martin wrote:
> > > On Sun, May 30, 2010 at 14:49:32, Chris Larson wrote:
> > >> Aside: the way it does so is quite the hack, we need to figure out
> > >> a better way to manipulate the task graph like this.
> >  >
> > > Maybe that explains the problem I'm seeing with the dependency graph =
when using srctree.
> >=20
> > > Then it goes straight to the configure phase without ensuring the dep=
endencies are present.
> >=20
> > Yes, I see similar things. I'm still on an ancient tree with=20
> > do_populate_staging(). If memory serves, the prerequisite packages are=
=20
> > unpacked, compiled and installed, but do_stage isn't run before the=20
> > srctree recipe's do_configure.
> >=20
> > As long as you're not doing parallel builds it's easy enough to work=20
> > around: just put the libraries you need in your IMAGE_INSTALL before th=
e=20
> > srctree packages.
>=20
> Thanks for the pointer. Working around for now by building the dependenci=
es
> by hand so I could get to the next problem. This being that my do_install=
 function
> is not being populated from what's in my recipe.
>=20
> My recipe has
>=20
> do_install() {                                                           =
                                                                           =
                                                         =20
>     oenote "RUNNING install: ${D}"                                       =
                                                                           =
                                                         =20
>     install -d ${D}/home/root/appdir                                     =
                                                                           =
                                                           =20
>     install -m 0755 ${S}/myapp ${D}/home/root/myapp
> }

Actually my closing bracket here "}" wasn't in column zero.=20
My emacs python mode doesn't do proper indentation I guess.
Anyway this seems to be a python/parsing error, with a silent failure,
and nothing to do with srctree AFAICT.

Regards,
Martin

>=20
> But the resultant run.do_install script generates an empty function
>=20
> base_do_install() {                                                      =
                                                                           =
                                                         =20
>         :                                                                =
                                                                           =
                                                         =20
>                                                                          =
                                                                           =
                                                         =20
> }  =20
> ...
> do_install() {                                                           =
                                                                           =
                                                         =20
>         base_do_install                                                  =
                                                                           =
                                                         =20
>                                                                          =
                                                                           =
                                                         =20
> }    =20
> ...
> cd /home/user/mysrc                                                      =
                                                                           =
                                                   =20
> do_install =20
>=20
>=20
> Looks like the .bbclass which generates the script is not happy about som=
ething
> but not sure where to look to find out what I'm missing.
>=20
> Regards,=20
> Martin
>=20



Regards,=20
Martin


