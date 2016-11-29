Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id D7B0E71ABB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 00:57:31 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id e9so14539629pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 16:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=U7oA7xnQZicb65j/7Yh9cQcFE1PokyVWJi/p141OGJU=;
	b=JWQgGcpCibU6fT2egFMnYAD3glkm8ghorIqi/JDW4LK8T58gbSyj7YDuMzrrYchSE7
	Skmws1Tiipf/ComrM/Rf4WnSXWcMg10eRXENoLil48RjsbKy8pXLZHiaQ1HvFXXW1AHZ
	M9d0xcqwN+CdtxzLMMz56tOBX01rz+qTrDtcUpYjJoYRE7jel6T3TsFPeSSicgFpXJXM
	dNQ8wE3XvG4Fc1NzxGHoxrQ7735iVMssxkvS/dZ4tV0rRQd51Qyl7sZ2TnGF8r8gJsHI
	WNWOoI8nWSrhAlHyclFcJWrxVNOxRYFqrh0A1L6DqvqA9C5+70PtHlJbWgEOD3KF8xSU
	nJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=U7oA7xnQZicb65j/7Yh9cQcFE1PokyVWJi/p141OGJU=;
	b=ZgZ8qPGRLZ+nCqTuz4A4mrcB/WmnMcDYZx3a1BaKrOGSiedcXa2oZskkZ+U+RZOt3Q
	UIt02mNozCGA+TxLT2nvv1He4MB4BDL8xGxH8ErcAap3jQD2xjVwrLCmJyopAAZfvOkl
	3qV1nXw07NK419E3CZ3SNfvq7FPJxO92Uuhz+B2rlK8oIdlXrETIT/PMbXxMcZwia1sg
	iA+E0rmwDv63r7uMyoT/6KcpZVDdDYBjQT5oIzvpIVpE1Uv5DxZrSs+K1UdeIsjvDCt+
	/OCK1IqjpU/vBVkqMhV9BirDOOLs672bgiuWEDY0mhsh0IqMQy5PEjV3XsmPbJ4xxVab
	PnGg==
X-Gm-Message-State: AKaTC02M7DdMFhw6Ddw1SCfYqbEAWEcQhJqEJEjy/EXftmPlTFstg4BMM+jcFty/fQqU0w==
X-Received: by 10.84.218.8 with SMTP id q8mr55797248pli.138.1480381052958;
	Mon, 28 Nov 2016 16:57:32 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:f08c:19b4:e718:7b0b?
	([2601:646:8882:b8c:f08c:19b4:e718:7b0b])
	by smtp.gmail.com with ESMTPSA id
	k25sm35370541pfg.84.2016.11.28.16.57.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 16:57:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <B4055432-E49F-46E0-9612-D07BA01D5781@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Mon, 28 Nov 2016 16:57:31 -0800
In-Reply-To: <20161126001515.GB8369@jama>
To: openembedded-devel@lists.openembedded.org
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-8-raj.khem@gmail.com>
	<20161126001515.GB8369@jama>
X-Mailer: Apple Mail (2.3251)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Tue, 29 Nov 2016 00:57:33 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 25, 2016, at 4:15 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Wed, Nov 23, 2016 at 01:21:28AM -0800, Khem Raj wrote:
>> 16.x is the default since its the latest released version
>>=20
>> remove obsoleted xbmc recipes
>> rename to recipes-mediacenter
>> +S =3D "${WORKDIR}/git"
>> +
>> +# breaks compilation
>> +ASNEEDED =3D ""
>> +
>> +ACCEL ?=3D ""
>> +ACCEL_x86 =3D "vaapi vdpau"
>> +ACCEL_x86-64 =3D "vaapi vdpau"
>> +
>> +PACKAGECONFIG ??=3D "${ACCEL}"
>> +PACKAGECONFIG_append +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'x11', ' x11', '', d)}"
>> +PACKAGECONFIG_append +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'opengl', ' opengl', ' openglesv2', d)}"
>> +
>> +PACKAGECONFIG[opengl] =3D "--enable-gl,--enable-gles,"
>> +PACKAGECONFIG[openglesv2] =3D =
"--enable-gles,--enable-gl,virtual/egl"
>> +PACKAGECONFIG[vaapi] =3D "--enable-vaapi,--disable-vaapi,libva"
>> +PACKAGECONFIG[vdpau] =3D "--enable-vdpau,--disable-vdpau,libvdpau"
>> +PACKAGECONFIG[mysql] =3D "--enable-mysql,--disable-mysql,mysql5"
>> +PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,libxinerama =
libxmu libxrandr libxtst"
>> +PACKAGECONFIG[pulseaudio] =3D =
"--enable-pulse,--disable-pulse,pulseaudio"
>=20
> Did I overlook libva recipe somewhere?
>=20
> It doesn't even start building for qemux86* because of this libva and
> for qemuarm it fails to configure:
> =
http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/1=
10050.html

Sent a patch for libva which should help with x86 issue. For arm issue, =
I see that error is due to java installation on build machine. I have =
sent another patch for kodi-17
to fix build for qemuarm but thats not needed for kodi-16 which is =
default.

| =
/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/sw=
ig -w401 -c++ -o xbmc/interfaces/python/generated/AddonModuleXbmc.xml =
-xml -I./xbmc -xmllang python xbmc/interfaces/swig/AddonModuleXbmc.i
| # Work around potential groovy bug reported at: =
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D733234
| /usr/bin/java -cp =
"./tools/codegenerator/groovy/groovy-all-2.4.4.jar:./tools/codegenerator/g=
roovy/commons-lang-2.6.jar:./tools/codegenerator:xbmc/interfaces/python" =
\
|           org.codehaus.groovy.tools.FileSystemCompiler -d =
./tools/codegenerator ./tools/codegenerator/Helper.groovy  =
./tools/codegenerator/SwigTypeParser.groovy =
xbmc/interfaces/python/MethodType.groovy =
xbmc/interfaces/python/PythonTools.groovy
| Error occurred during initialization of VM
| Could not reserve enough space for object heap
| Error: Could not create the Java Virtual Machine.
| Error: A fatal exception has occurred. Program will exit.
| codegenerator.mk:44: recipe for target =
'xbmc/interfaces/python/generated/AddonModuleXbmc.cpp' failed
| make: *** [xbmc/interfaces/python/generated/AddonModuleXbmc.cpp] Error =
1




> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


