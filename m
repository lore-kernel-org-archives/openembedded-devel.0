Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <frederik.sdun@googlemail.com>) id 1P5OA3-0000YI-4D
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 21:35:52 +0200
Received: by fxm19 with SMTP id 19so736188fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 12:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:in-reply-to
	:references:content-type:date:message-id:mime-version:x-mailer;
	bh=ZbgX1+zoEW/jrm1VO9cVzc/Hbm01B9r9Hnum1ASEJAI=;
	b=whya21K92eH81vTZqdWcFEmE/6LDLz1aH3QqQMCS1hB+cCLlNYvyJtngpvTnHZ/glT
	Yn8MkrFLFRRa0MeTK9dXbv8I28TDVi19A+1y55QbMF+H6vzyyDg8EOzpdAGj1RRAbGle
	y08N+vIfZpNGN97ecATO9tRp5Sb/O1QtdV2Uo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id
	:mime-version:x-mailer;
	b=W0S232S+1reLxifmkdonZEqByVFLhOOG9KBXNBQ+2Dxx25lF6sVrrGI58YZk8hQHNp
	LRfTZ5MUqWOkS5TXru5A7l54W2nxdboBYeYvlx/DhIWhLkym4Nn4MiALE5RCPnrcYeAO
	nhG06jZ8UqyH2R+4pDy0wtG7bTpsYrwCZtF38=
Received: by 10.223.74.5 with SMTP id s5mr2118992faj.136.1286825719466;
	Mon, 11 Oct 2010 12:35:19 -0700 (PDT)
Received: from [192.168.2.150] ([93.216.253.16])
	by mx.google.com with ESMTPS id j8sm2449475fah.30.2010.10.11.12.35.17
	(version=SSLv3 cipher=RC4-MD5); Mon, 11 Oct 2010 12:35:18 -0700 (PDT)
From: Frederik Sdun <frederik.sdun@googlemail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20101011013524.GB20158@thinky>
References: <1286730309.3808.88.camel@mattotaupa>
	<AANLkTikZquiw4kwdKipq7x++Efeerp1gdcvHmDYxW0Sj@mail.gmail.com>
	<1286732323.3808.111.camel@mattotaupa>
	<AANLkTinEX-Y65vR4KfRJOk6gSy6JkrwsuQSX4oQhw43J@mail.gmail.com>
	<1286748988.3808.140.camel@mattotaupa> <20101010224731.GA20158@thinky>
	<1286751753.9764.4.camel@mattotaupa>  <20101011013524.GB20158@thinky>
Date: Mon, 11 Oct 2010 21:34:35 +0200
Message-ID: <1286825676.13585.8.camel@brain>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: frederik.sdun@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gobject-introspection: pkg-config does not pick correct paths (was: pkg-config does not honor `PKG_CONFIG_SYSROOT_DIR`)
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
X-List-Received-Date: Mon, 11 Oct 2010 19:35:52 -0000
X-Groupsio-MsgNum: 24700
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-KK76XD/kEtNPxLkEL+RZ"

--=-KK76XD/kEtNPxLkEL+RZ
Content-Type: multipart/mixed; boundary="=-L2TkYfbLe7myYh0D04m/"

--=-L2TkYfbLe7myYh0D04m/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 11.10.2010, 03:35 +0200 schrieb Frederik Sdun:
> * Paul Menzel <paulepanter@users.sourceforge.net> [11.10.2010 01:03]:
> > Am Montag, den 11.10.2010, 00:47 +0200 schrieb Frederik Sdun:
> > > * Paul Menzel <paulepanter@users.sourceforge.net> [11.10.2010 00:17]:
> > > > Am Sonntag, den 10.10.2010, 11:11 -0700 schrieb Chris Larson:
> > > > > On Sun, Oct 10, 2010 at 10:38 AM, Paul Menzel wrote:
> > > > >=20
> > > > > > Am Sonntag, den 10.10.2010, 10:09 -0700 schrieb Chris Larson:
> > > > > > > On Sun, Oct 10, 2010 at 10:05 AM, Paul Menzel wrote:
> > > >=20
> > > > [=E2=80=A6]
> > > >=20
> > > > > > Secondly I am having a similar problem with `gobject-introspect=
ion`
> > > > > > where [1]
> > > > > >
> > > > > >        gir/Makefile.am:GLIB_INCLUDEDIR=3D$(shell pkg-config --v=
ariable=3Dincludedir glib-2.0)/glib-2.0
> > > > > >        gir/Makefile.am:GLIB_LIBDIR=3D$(shell pkg-config --varia=
ble=3Dlibdir glib-2.0)
> > > > > >
> > > > > > returns the wrong path.
> > > > > >
> > > > > >        Making all in gir
> > > > > >        make[2]: Entering directory
> > > > > > `/oe/build-minimal-libc/minimal-dev/work/armv7a-oe-linux-gnueab=
i/gobject-introspection-0.9.12-r0/gobject-introspection-0.9.12/gir'
> > > > > >        make[2]: *** No rule to make target
> > > > > > `/usr/lib/glib-2.0/include/glibconfig.h', needed by `GLib-2.0.g=
ir'.  Stop.
> > > > > >        make[2]: Leaving directory
> > > > > > `/oe/build-minimal-libc/minimal-dev/work/armv7a-oe-linux-gnueab=
i/gobject-introspection-0.9.12-r0/gobject-introspection-0.9.12/gir'
> > > > > >        make[1]: *** [all-recursive] Error 1
> > > > >=20
> > > > > /usr/{lib,include} paths are mangled by pkg-config using
> > > > > PKG_CONFIG_SYSROOT_DIR.  If that's not happening here, that's a b=
ug that
> > > > > should be investigated, but I fail to see how setting PKG_CONFIG =
is going to
> > > > > magically fix it.
> > > >=20
> > > > Unfortunately I could not figure out, what is going on. My suspicio=
n is,
> > > > that the function `shell` of the Makefile does not honor the enviro=
nment
> > > > variables.
> > > >=20
> > > > I tried to change the syntax to
> > > >=20
> > > >         GLIB_INCLUDEDIR :=3D `$(PKG_CONFIG) --variable=3Dincludedir=
 glib-2.0`/glib-2.0
> > > >         GLIB_LIBDIR :=3D `$(PKG_CONFIG) --variable=3Dlibdir glib-2.=
0`
> > > >=20
> > > > (`git grep PKG_CONFIG` to see that this is used in some places) or
> > > >=20
> > > >         GLIB_INCLUDEDIR=3D$(shell /oe/build-minimal-libc/minimal-de=
v/sysroots/i686-linux/usr/bin/pkg-config --variable=3Dincludedir glib-2.0)/=
glib-2.0
> > > >         GLIB_LIBDIR :=3D $(shell /oe/build-minimal-libc/minimal-dev=
/sysroots/i686-linux/usr/bin/pkgconfig --variable=3Dlibdir glib-2.0)
> > > >=20
> > > > but although the second one worked on the command line, it did not =
work
> > > > and did not return any path at all. (I edited `Makefile` in `work` =
and
> > > > executed `run.do_compile.=E2=80=A6` manually.)
> > > >=20
> > > > I also looked at the changes of pkg-config [1] after 0.23, but coul=
d not
> > > > find anything applicable to this problem.
> >=20
> > > > [1] http://cgit.freedesktop.org/pkg-config/tree/NEWS
> > >
> > > I think the problem is, that pkg-config --variable is used here, whic=
h
> > > doesn't expand the paths.
> > > I try to provide a patch, which make it possible to specify the sysro=
ot
> > > and uses pkg-config --cflags-only-I for the flags
> >=20
> > That is a good idea. But remember that the staged package config files
> > have the full path included already.
> >=20
> >         $ /oe/build-minimal-libc/minimal-dev/sysroots/i686-linux/usr/bi=
n/pkg-config --variable=3Dlibdir glib-2.0=20
> >         /oe/build-minimal-libc/minimal-dev/sysroots/i686-linux/usr/lib
> >=20
> > or
> >=20
> >         $ PKG_CONFIG_DIR=3D"/home/paul/oe/build-minimal-libc/minimal-de=
v/sysroots/armv7a-oe-linux-gnueabi/usr/lib/pkgconfig" ~/oe/build-minimal-li=
bc/minimal-dev/sysroots/i686-linux/usr/bin/pkg-config --variable=3Dlibdir g=
lib-2.0
> >         /oe/build-minimal-libc/minimal-dev/sysroots/i686-linux/usr/lib
> >=20
> >=20
> > Thanks,
> >=20
> > Paul
> I added some prints to dumper.py from gobject-introspection and it seems
> that pkg-config doesn't provide the correct -L flags, even if I specify
> --libs-only-L. Any ideas how to fix this?
>=20
>=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20

Here's a diff of my current status.=20


--=-L2TkYfbLe7myYh0D04m/
Content-Type: application/x-compressed-tar; name="introspection.tar.gz"
Content-Disposition: attachment; filename="introspection.tar.gz"
Content-Transfer-Encoding: base64

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

--=-L2TkYfbLe7myYh0D04m/--

--=-KK76XD/kEtNPxLkEL+RZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyzZssACgkQvbwBzXsbjyoXKQCglN5myXufhDVDXu5OEilS0KLj
ykEAoIbSX9ZTaaorfV2h2/R4kko53gIH
=YDuO
-----END PGP SIGNATURE-----

--=-KK76XD/kEtNPxLkEL+RZ--
