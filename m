Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7D94A772BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 09:52:57 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id j10so8787924wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 01:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=l14YFW0d0BJu44hmeKhFWKMQ206axHUXmVU0P4us//8=;
	b=laqaOfi9niAi5E7+4ck6nCWXU75oD97pRt4r4UtBRciuKqcz51RKkiKftw9oZAzxBh
	F2pDEZMyUlMVE9owYWhZXQYurNnLiqmOURYhN0mQih9dV3UA5S3Q41g5+la/VkBuxT1I
	3FWEkDuvuoQa3xYbhzxhusV7JBHHyoDcDaaJATla0KJ3rBhUqiEHJQleYIy4enG5VdzN
	nQZ8WlLJlHtL3pZ4AhaE4jMto3HnE/jSwKx22GjiS6yoUBFaZkE9i6zFNhql5R2+hWTU
	HX4JxHrNltPurXyDVgkRYmQz4My0H2G3mQL8npdPaVbwR6BTIhMLEjPebcWoLID0uKdX
	4LzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=l14YFW0d0BJu44hmeKhFWKMQ206axHUXmVU0P4us//8=;
	b=e2jy4MDpleu0Rn5QflcItklpUBNhrSaf3sQtj50fmNQstuyNXhREUu0DjFVSzydEjJ
	59e57Kgc1yW8GGJAmWjtUmkwBbjOMbhvNR7yyLQ8v93TLaUVeU+TLvYmn98qQeJt94LR
	mMNVw0USPYrdq4obaKOBX4/TqrHj4H1Sccc98mkeN3Mqzke5PAHSiPFOK6PAkS4ZEmt3
	K3WLgwesrzMovCCD5x+1DTTa0YgPor9FBvzVcBoxNr0NcZTn7IoQhktkfkxseX5B+WnK
	oVm6qSeqf3lAsR/pAE5Wwa5a1Z771l09Hhgu2pmOIiGV8FQpIOCwo6U60bMOks+m31nV
	dUVw==
X-Gm-Message-State: AKaTC02f6UkmmnARJ30u452fR24mr0+9j8h95LgwLySVenU/WUC5vOCyitmkoh9NUyaH4A==
X-Received: by 10.194.122.65 with SMTP id lq1mr558052wjb.12.1481795577868;
	Thu, 15 Dec 2016 01:52:57 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u81sm1639100wmu.10.2016.12.15.01.52.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Dec 2016 01:52:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 Dec 2016 10:53:00 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161215095300.GA3244@jama>
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-8-raj.khem@gmail.com>
	<20161126001515.GB8369@jama>
	<B4055432-E49F-46E0-9612-D07BA01D5781@gmail.com>
MIME-Version: 1.0
In-Reply-To: <B4055432-E49F-46E0-9612-D07BA01D5781@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-multimedia][PATCH 08/49] kodi: Add krypton/17.x Jarvis/16.x recipes
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
X-List-Received-Date: Thu, 15 Dec 2016 09:52:58 -0000
X-Groupsio-MsgNum: 64338
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2016 at 04:57:31PM -0800, Khem Raj wrote:
>=20
> > On Nov 25, 2016, at 4:15 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> >=20
> > On Wed, Nov 23, 2016 at 01:21:28AM -0800, Khem Raj wrote:
> >> 16.x is the default since its the latest released version
> >>=20
> >> remove obsoleted xbmc recipes
> >> rename to recipes-mediacenter
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +# breaks compilation
> >> +ASNEEDED =3D ""
> >> +
> >> +ACCEL ?=3D ""
> >> +ACCEL_x86 =3D "vaapi vdpau"
> >> +ACCEL_x86-64 =3D "vaapi vdpau"
> >> +
> >> +PACKAGECONFIG ??=3D "${ACCEL}"
> >> +PACKAGECONFIG_append +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x=
11', ' x11', '', d)}"
> >> +PACKAGECONFIG_append +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'o=
pengl', ' opengl', ' openglesv2', d)}"
> >> +
> >> +PACKAGECONFIG[opengl] =3D "--enable-gl,--enable-gles,"
> >> +PACKAGECONFIG[openglesv2] =3D "--enable-gles,--enable-gl,virtual/egl"
> >> +PACKAGECONFIG[vaapi] =3D "--enable-vaapi,--disable-vaapi,libva"
> >> +PACKAGECONFIG[vdpau] =3D "--enable-vdpau,--disable-vdpau,libvdpau"
> >> +PACKAGECONFIG[mysql] =3D "--enable-mysql,--disable-mysql,mysql5"
> >> +PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,libxinerama libxmu=
 libxrandr libxtst"
> >> +PACKAGECONFIG[pulseaudio] =3D "--enable-pulse,--disable-pulse,pulseau=
dio"
> >=20
> > Did I overlook libva recipe somewhere?
> >=20
> > It doesn't even start building for qemux86* because of this libva and
> > for qemuarm it fails to configure:
> > http://lists.openembedded.org/pipermail/openembedded-devel/2016-Novembe=
r/110050.html
>=20
> Sent a patch for libva which should help with x86 issue. For arm issue, I=
 see that error is due to java installation on build machine. I have sent a=
nother patch for kodi-17
> to fix build for qemuarm but thats not needed for kodi-16 which is defaul=
t.

kodi-16 is still default, but fails because of this java issue :/

There is also another issue with kodi-17 detected in qemux86* builds:

ERROR: Following files are installed in sysroot, but not tracked by sstate:
qemux86-64/usr/include/guid.h
qemux86-64/usr/lib/libcrossguid.a
INFO: Output written in: /home/jenkins/oe/world/shr-core/tmp-glibc/sysroot.=
cruft.1481664087

I believe both these files are installed by kodi, this looks suspicious:
    make -C tools/depends/target/crossguid PREFIX=3D${STAGING_DIR_HOST}${pr=
efix}

>=20
> | /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin=
/swig -w401 -c++ -o xbmc/interfaces/python/generated/AddonModuleXbmc.xml -x=
ml -I./xbmc -xmllang python xbmc/interfaces/swig/AddonModuleXbmc.i
> | # Work around potential groovy bug reported at: http://bugs.debian.org/=
cgi-bin/bugreport.cgi?bug=3D733234
> | /usr/bin/java -cp "./tools/codegenerator/groovy/groovy-all-2.4.4.jar:./=
tools/codegenerator/groovy/commons-lang-2.6.jar:./tools/codegenerator:xbmc/=
interfaces/python" \
> |           org.codehaus.groovy.tools.FileSystemCompiler -d ./tools/codeg=
enerator ./tools/codegenerator/Helper.groovy  ./tools/codegenerator/SwigTyp=
eParser.groovy xbmc/interfaces/python/MethodType.groovy xbmc/interfaces/pyt=
hon/PythonTools.groovy
> | Error occurred during initialization of VM
> | Could not reserve enough space for object heap
> | Error: Could not create the Java Virtual Machine.
> | Error: A fatal exception has occurred. Program will exit.
> | codegenerator.mk:44: recipe for target 'xbmc/interfaces/python/generate=
d/AddonModuleXbmc.cpp' failed
> | make: *** [xbmc/interfaces/python/generated/AddonModuleXbmc.cpp] Error 1
>=20
>=20
>=20
>=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWFJn+wAKCRA3VSO3ZXaA
HI9PAJwK2bzg+ppgKkue/NtEL3gguBy5SgCbBWMVkTBRdbtz2r2Xi/JoMzd1w10=
=iz98
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
