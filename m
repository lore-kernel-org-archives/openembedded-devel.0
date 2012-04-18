Received: from nm9-vm0.bullet.mail.ne1.yahoo.com ([98.138.91.67])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <maniacbug@ymail.com>) id 1SKegk-0006G4-Bo
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2012 01:53:30 +0200
Received: from [98.138.90.49] by nm9.bullet.mail.ne1.yahoo.com with NNFMP;
	18 Apr 2012 23:42:02 -0000
Received: from [98.138.87.8] by tm2.bullet.mail.ne1.yahoo.com with NNFMP;
	18 Apr 2012 23:42:02 -0000
Received: from [127.0.0.1] by omp1008.mail.ne1.yahoo.com with NNFMP;
	18 Apr 2012 23:42:02 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 419506.78886.bm@omp1008.mail.ne1.yahoo.com
Received: (qmail 62584 invoked by uid 60001); 18 Apr 2012 23:42:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ymail.com; s=s1024;
	t=1334792522; bh=C4Cru8QNrwKF/T2dmvdcBEh9IJdGdECyBXyW14GdkTo=;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=EYkBTs9mdULEZYHvZ+c2fBxjpxx67t4nHIctkC3O8wgtwu2FTF87JOPf6FU1n0WeDOEDgGpXc2Eb4YJiatTOsI+kQvvTm4BFnfGEgGMoW0dyncLkYol+RYpcQ3/Id/C5gYNOkR48VO9GSQI31uic/Zzhw0CVhk/HAEK+/ToalwA=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=ymail.com;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=CDxypvlSb8QIYKzYHg94vsGJ1Zzcc3AH6fZq74jEjLJV4rozxFvPJNJQ0kqt023P6JM0URFnCi7F9xN4cC/WMO/PgTbv87rELX1RIXIbxyTiou/nobnYO1Zlrx9IX9g+SuIlmK2URT0a06XdzBVg5zJCpfFxgw4Pu2tOf/IWhKs=;
X-YMail-OSG: OBNUwIYVM1la467a_.ZjozuFNzY5rsQbgYtOEUNI9ZF94cJ
	AT8Cw1ezzEZGIFMmnCnnrPtFYKt0lX9p5tn2wcAiGxn_hQkh9ekanLZXWEm_
	EphapSmVT5xD93weCx3xwhbEJIZhDv9nCzZs3zKlY5g2MWlksGdojCEEIRgM
	isZn7jJCMstOs5MDq8Oi9PcfMckQv3TcJ2k42B4NisEcLsQEo6s4EGdHshOH
	0Qblu9dBfypReu0ur3Ro9uct1BwqFr1uGrnWRTJTr5Z36d141XgrVaOUOGl7
	x2xxO7GqJqkyX.6lW_8Z5oEFkSzwRyvwp1Ky6PSQkVj1wpk9gemhqXDmQwUU
	.7lW0aWzrYhxhjJQX_SXqAEQOiu7X457BkYht.iLiTbZ3dYrTcVwzDsOilDL
	6piuYgaYkrGMbGkmVynBd0QR0p1KrbRLHgicJRCFsArTSQdzk.6RMT.6g49W
	kp3vmo7QpFejhzlsLlqQY3k_xyo18T5fSUSAQqUEGrnDMDOUuHTvai0ecOk.
	YO9XkSHWUCXQg8tnF0Vy7_gpemdTQaJOs6CPm3EsmuvSCz8L3tVdd9_ZRI3J
	hmCLvekiMrj3PCwgYzVNlk9Hai7NRttHqDsy6gErCZvSWN3XWY56dZOsJKf3
	nYtzQ1FP2gzgzTtuzkLkM2xfctGrhTaRH5vYwQsPZAG_zQLWSWTGUk0M1Rjg
	sIHeegAK1a6_q85TW8g2DdV4A1t5.P4jpg37vMVyKRmVxhPwjBT6awJ8gbjF
	ecOGZYTI7FXsex6ao_FSoozbJchZnBGfN996Y5dCdEj1uwYxS114rfKFZhd8
	U0y5xzd9cVFi_4dw199FncNkGEcw6L46kXm.G1nmX4UgGnw--
Received: from [131.107.0.86] by web121604.mail.ne1.yahoo.com via HTTP;
	Wed, 18 Apr 2012 16:42:02 PDT
X-Mailer: YahooMailWebService/0.8.117.340979
Message-ID: <1334792522.59161.YahooMailNeo@web121604.mail.ne1.yahoo.com>
Date: Wed, 18 Apr 2012 16:42:02 -0700 (PDT)
From: maniacbug <maniacbug@ymail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: Help with first compile
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
X-List-Received-Date: Wed, 18 Apr 2012 23:53:30 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi.=A0 I am trying to bring up OE for the first time, following this guide:=
=A0 http://docs.openembedded.org/usermanual/usermanual.html.=A0 Running on =
Ubuntu 11.10.=0A=0AI've followed every step precisely through "Building Sof=
tware".=A0 Then I try "bitbake base-image", and get pages of errors.=A0 The=
 top lines are listed below.=A0 Is this doc out of date?=A0 Or, is it possi=
ble to divine from this what error I may have made?=0A=0AThanks!=0A=0A----=
=0A=0Amb@mb:~/Source/oe/build$ echo $PATH=0A/home/mb/Source/oe/bitbake/bin:=
/opt/cs/arm-uclinux/bin:/home/mb/bin:/usr/local/sbin:/usr/local/bin:/usr/sb=
in:/usr/bin:/sbin:/bin:/usr/games=0Amb@mb:~/Source/oe/build$ echo $BBPATH=
=0A/home/mb/Source/oe/build:/home/mb/Source/oe/openembedded=0Amb@mb:~/Sourc=
e/oe/build$ echo $OEBASE=0A/home/mb/Source/oe=0Amb@mb:~/Source/oe/build$ ca=
t conf/local.conf=0ABBFILES =3D "${OEBASE}/openembedded/recipes/*/*.bb"=0AD=
ISTRO =3D "angstrom-2008.1"=0AMACHINE =3D "om-gta01"=0A=0A----=0A=0AERROR: =
Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsin=
g /home/mb/Source/oe/openembedded/recipes/preboot/initramfs-preboot-image.b=
b=0ANOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal=
 (<string>, line 1) while evaluating:=0A${@':'.join(uniq(os.path.normpath(o=
s.path.join(fp, p, o)) for fp in '/home/mb/Source/oe/openembedded/recipes/a=
ngstrom'.split(':') for p in 'angstrom-version-2_${DISTRO_VERSION}-r9:angst=
rom-version-${DISTRO_VERSION}:angstrom-version:angstrom-version-${DISTRO_VE=
RSION}:angstrom-version:files:.'.split(':') for o in reversed([''] + filter=
(None, 'pn-angstrom-version:fail-fast:build-linux:arm:INVALID:angstrom-2008=
.1:om-gta01:local'.split(':')))))}=0ANOTE: <type 'exceptions.SyntaxError'>:=
EOL while scanning string literal (<string>, line 1) while evaluating:=0A${=
@patch_deps(d)}=0AERROR: EOL while scanning string literal (<string>, line =
1) while parsing /home/mb/Source/oe/openembedded/recipes/angstrom/angstrom-=
version.bb=0ANOTE: <type 'exceptions.TypeError'>:list indices must be integ=
ers, not NoneType while evaluating:=0Ahttp://projects.linuxtogo.org/frs/dow=
nload.php/14/prismstumbler-0.7.4pre1.tar.gz=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 file://gpsapi.patch=A0=A0=A0=A0=A0=A0 ${@['', 'file://wireless.patch'][=
bb.data.getVar('PREFERRED_VERSION_linux-libc-headers', d, 1) and bb.data.ge=
tVar('PREFERRED_VERSION_linux-libc-headers', d, 1).split('.')[2] < '30']}=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://fix-includes.patch;striplevel=3D0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://libgps-check.patch=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 file://replace-gps_query.patch=0AERROR: Error in executi=
ng: /home/mb/Source/oe/openembedded/recipes/prismstumbler/prismstumbler_0.7=
.3+0.7.4pre1.bb=0AERROR: Exception:<type 'exceptions.TypeError'> Message:li=
st indices must be integers, not NoneType=0AERROR: Printing the environment=
 of the function=0AERROR:=A0 0001:def __anonfunc():=0AERROR:=A0 0002:=A0=A0=
=A0 __anon_185__home_mb_Source_oe_openembedded_classes_staging_bbclass(d)=
=0AERROR:=A0 0003:=A0=A0=A0 __anon_90__home_mb_Source_oe_openembedded_class=
es_packaged_staging_bbclass(d)=0AERROR:=A0 0004:=A0=A0=A0 __anon_419_classe=
s_base_bbclass(d)=0AERROR:=A0 0005:=A0=A0=A0 __anon_102__home_mb_Source_oe_=
openembedded_classes_siteinfo_bbclass(d)=0AERROR: list indices must be inte=
gers, not NoneType while parsing /home/mb/Source/oe/openembedded/recipes/pr=
ismstumbler/prismstumbler_0.7.3+0.7.4pre1.bb=0ANOTE: <type 'exceptions.Synt=
axError'>:EOL while scanning string literal (<string>, line 1) while evalua=
ting:=0A${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "${PRE=
FERRED_PROVIDER_virtual/update-alternatives}", d)}=A0=A0=A0=A0


