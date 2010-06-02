Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin@ti.com>) id 1OJw2k-0004eb-RI
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 00:04:16 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id o52LlMCq015336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 2 Jun 2010 16:47:22 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id o52LlMi1028921
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 2 Jun 2010 16:47:22 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o52LlMhG028864
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 2 Jun 2010 16:47:22 -0500 (CDT)
Received: from dlee02.ent.ti.com ([157.170.170.17]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Wed, 2 Jun 2010 16:47:22 -0500
From: "Ambrose, Martin" <martin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Jun 2010 16:47:17 -0500
Thread-Topic: [oe] Examples of srctree and gitver
Thread-Index: AcsBj6NEMuShDVM+SsWWrlVuEGnUoABDDotg
Message-ID: <A24693684029E5489D1D202277BE894455B8125E@dlee02.ent.ti.com>
References: <A24693684029E5489D1D202277BE89445316FB3A@dlee02.ent.ti.com>
	<AANLkTinePogltaKgN7CaqFVzw4PpDXSkE-f7H18PINOB@mail.gmail.com>
	<A24693684029E5489D1D202277BE894455A0F300@dlee02.ent.ti.com>
	<AANLkTinA1ZTsklvgjWbc87f9a5CgSXpbCth47yVKiPq-@mail.gmail.com>
	<A24693684029E5489D1D202277BE894455A0F458@dlee02.ent.ti.com>
	<4C050CE8.4080102@cbnco.com>
In-Reply-To: <4C050CE8.4080102@cbnco.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-puzzleid: {5D43A802-7501-4B76-85F2-15FFC9D17D25}
x-cr-hashedpuzzle: CZY= Q6o= AeGa Afaj AgjA AzLd BUQg Bulh CeN3 CkQr DLkJ
	GOus H/g4 JVQj JfOT KTIS; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {5D43A802-7501-4B76-85F2-15FFC9D17D25};
	bQBhAHIAdABpAG4AQAB0AGkALgBjAG8AbQA=; Wed,
	02 Jun 2010 21:47:17 GMT;
	UgBFADoAIABbAG8AZQBdACAARQB4AGEAbQBwAGwAZQBzACAAbwBmACAAcwByAGMAdAByAGUAZQAgAGEAbgBkACAAZwBpAHQAdgBlAHIA
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
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
X-List-Received-Date: Wed, 02 Jun 2010 22:04:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2010 at 08:36:40, Michael Smith wrote:

> Ambrose, Martin wrote:
> > On Sun, May 30, 2010 at 14:49:32, Chris Larson wrote:
> >> Aside: the way it does so is quite the hack, we need to figure out
> >> a better way to manipulate the task graph like this.
>  >
> > Maybe that explains the problem I'm seeing with the dependency graph wh=
en using srctree.
>=20
> > Then it goes straight to the configure phase without ensuring the depen=
dencies are present.
>=20
> Yes, I see similar things. I'm still on an ancient tree with=20
> do_populate_staging(). If memory serves, the prerequisite packages are=20
> unpacked, compiled and installed, but do_stage isn't run before the=20
> srctree recipe's do_configure.
>=20
> As long as you're not doing parallel builds it's easy enough to work=20
> around: just put the libraries you need in your IMAGE_INSTALL before the=
=20
> srctree packages.

Thanks for the pointer. Working around for now by building the dependencies
by hand so I could get to the next problem. This being that my do_install f=
unction
is not being populated from what's in my recipe.

My recipe has

do_install() {                                                             =
                                                                           =
                                                       =20
    oenote "RUNNING install: ${D}"                                         =
                                                                           =
                                                       =20
    install -d ${D}/home/root/appdir                                       =
                                                                           =
                                                         =20
    install -m 0755 ${S}/myapp ${D}/home/root/myapp
}

But the resultant run.do_install script generates an empty function

base_do_install() {                                                        =
                                                                           =
                                                       =20
        :                                                                  =
                                                                           =
                                                       =20
                                                                           =
                                                                           =
                                                       =20
}  =20
...
do_install() {                                                             =
                                                                           =
                                                       =20
        base_do_install                                                    =
                                                                           =
                                                       =20
                                                                           =
                                                                           =
                                                       =20
}    =20
...
cd /home/user/mysrc                                                        =
                                                                           =
                                                 =20
do_install =20


Looks like the .bbclass which generates the script is not happy about somet=
hing
but not sure where to look to find out what I'm missing.

Regards,=20
Martin


