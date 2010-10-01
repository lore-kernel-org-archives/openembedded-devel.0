Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P1ndN-0006gS-Tk
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 23:59:24 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o91LwvLj023165
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Oct 2010 16:58:57 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o91LwvVv021183
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Oct 2010 16:58:57 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o91LwvM9026487
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Oct 2010 16:58:57 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Fri, 1 Oct 2010 16:58:57 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Oct 2010 16:58:56 -0500
Thread-Topic: [oe] [PATCH] recipe licenses: update recipe LICENSE fields
Thread-Index: Acthpew5UnVyHuZMTVWNueRHVeC+dAACwdIA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310F21152@dlee06.ent.ti.com>
References: <1285344532-25131-1-git-send-email-chase.maupin@ti.com>
	<4CA64203.6070702@freyther.de>
In-Reply-To: <4CA64203.6070702@freyther.de>
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
Subject: Re: [PATCH] recipe licenses: update recipe LICENSE fields
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
X-List-Received-Date: Fri, 01 Oct 2010 21:59:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Holger Freyther
> Sent: Friday, October 01, 2010 3:18 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] recipe licenses: update recipe LICENSE fields
>=20
> On 09/25/2010 12:08 AM, Chase Maupin wrote:
>=20
> >
> > diff --git a/recipes/autoconf/autoconf.inc
> b/recipes/autoconf/autoconf.inc
> > index 35b0289..70e24a0 100644
> > --- a/recipes/autoconf/autoconf.inc
> > +++ b/recipes/autoconf/autoconf.inc
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "A package of M4 macros to produce scripts to \
> >  automatically configure sourcecode."
> > -LICENSE =3D "GPL"
> > +LICENSE =3D "GPLv3+exception"
>=20
> hmm... but at your option the exception might be omitted.. and there are
> many
> possible exception clauses... so it doesn't really say what it is.

So how would you mark this as a package that contains an exception?  My int=
ention here is to note that this is not standard GPLv3

>=20
>=20
>=20
> >  HOMEPAGE =3D "http://www.gnu.org/software/autoconf/"
> >  SECTION =3D "devel"
> >  DEPENDS +=3D "m4-native"
> > diff --git a/recipes/autoconf/autoconf213_2.13.bb
> b/recipes/autoconf/autoconf213_2.13.bb
> > index d060bbd..4c855e0 100644
> > --- a/recipes/autoconf/autoconf213_2.13.bb
> > +++ b/recipes/autoconf/autoconf213_2.13.bb
> > @@ -1,4 +1,5 @@
> >  require autoconf.inc
> > +LICENSE =3D "GPLv2"
>=20
> hard to believe... sure it is not v2 and later? it should be the standard
> FSF
> text? isn't it?

It doesn't have the "or later" clause.

>=20
>=20
> > +LICENSE =3D "GPLv2 AFLv2.1"
>=20
> good..
>=20
>=20
>=20
> > -LICENSE =3D "BSD"
> > +LICENSE =3D "NewBSD"
>=20
> could you point me to anyone using the term NewBSD? BSD license without
> advertisement clause? common but also misleading terms are 2-clause, 3-
> clause
> BSD...

I got this distinction from what may be a bad place, but it was Wikipedia (=
http://en.wikipedia.org/wiki/BSD_licenses).  I have heard people refer to N=
ewBSD, FreeBSD, and BSD around my work.  I was setting these to make it cle=
ar which version of the BSD the license was.

>=20
>=20
>=20
> > diff --git a/recipes/tinylogin/tinylogin_1.4.bb
> b/recipes/tinylogin/tinylogin_1.4.bb
> > index 40171ff..730012b 100644
> > --- a/recipes/tinylogin/tinylogin_1.4.bb
> > +++ b/recipes/tinylogin/tinylogin_1.4.bb
> > @@ -4,7 +4,7 @@ changing passwords, and otherwise maintaining users \
> >  and groups on an embedded system."
> >  HOMEPAGE =3D "http://tinylogin.busybox.net/"
> >  SECTION =3D "base"
> > -LICENSE =3D "GPLv2"
> > +LICENSE =3D "GPLv2/NewBSD"
>=20
> please don't use a '/'. IIRC this source will be put into a folder with
> that
> name...

I understand.  How should we denote recipes that have dual licenses?  I fig=
ured "GPLv2 NewBSD" mean it was either license.  Perhaps this should be "GP=
Lv2+NewBSD"?

>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


