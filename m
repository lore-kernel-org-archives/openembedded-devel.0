Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RCAQ6-00073U-3e
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 15:24:58 +0200
Received: (qmail invoked by alias); 07 Oct 2011 13:19:20 -0000
Received: from p4FDF0403.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.4.3]
	by mail.gmx.net (mp068) with SMTP; 07 Oct 2011 15:19:20 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19l+k99FzJlautv6/WUSAvJOXybLafwqb9QH0RlQb
	mEyNl8W7wpR4gU
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 7 Oct 2011 15:23:30 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-96.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1317937797-27434-1-git-send-email-schnitzeltony@gmx.de>
	<j6mjm3$31n$1@dough.gmane.org>
In-Reply-To: <j6mjm3$31n$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201110071523.31166.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-xfce] ristretto: Add inital recipe for version 0.1.0
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
X-List-Received-Date: Fri, 07 Oct 2011 13:24:58 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday, October 07, 2011 12:18:43 PM Koen Kooi wrote:
> Op 06-10-11 23:49, Andreas M=C3=BCller schreef:
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmx.de> ---
> > .../recipes-apps/ristretto/ristretto_0.1.0.bb      |   17
> > +++++++++++++++++ 1 files changed, 17 insertions(+), 0 deletions(-)
> > create mode 100644 meta-xfce/recipes-apps/ristretto/ristretto_0.1.0.bb
> >
> > diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.1.0.bb
> > b/meta-xfce/recipes-apps/ristretto/ristretto_0.1.0.bb new file mode
> > 100644 index 0000000..0b9cca0 --- /dev/null +++
> > b/meta-xfce/recipes-apps/ristretto/ristretto_0.1.0.bb @@ -0,0 +1,17 @@
> > +DESCRIPTION =3D "Image-viewer application" +HOMEPAGE =3D
> > "http://goodies.xfce.org/projects/applications/ristretto" +SECTION =3D
> > "x11/application" +LICENSE =3D "GPLv2" +LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f" +DEPENDS =3D "l=
ibexif
> > gtk+ dbus-glib libxfce4ui libxfce4util xfconf cairo" + +PR =3D "r0"
>=20
> Please drop that one. OE-core will be moving away from using PR, so adding
> new ones isn't going to help, especially when r0 is the default value.
>=20
We had that one - sorry. What is planned?

Regarding ristretto: Seems this version will soon have a successor so I'll =
wait for that with the update.

Andreas


