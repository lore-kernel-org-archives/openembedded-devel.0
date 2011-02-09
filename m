Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Pn6I8-0005sg-69
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 10:24:52 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 4CA4B49128C;
	Wed,  9 Feb 2011 10:23:51 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 9 Feb 2011 10:23:51 +0100
Message-ID: <4D525D27.5030902@dresearch.de>
Date: Wed, 09 Feb 2011 10:23:51 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D4BE849.9070704@dresearch.de> <4D5247CD.20700@dresearch.de>
	<4D525A03.2020601@xora.org.uk>
In-Reply-To: <4D525A03.2020601@xora.org.uk>
X-OriginalArrivalTime: 09 Feb 2011 09:23:51.0452 (UTC)
	FILETIME=[106EE5C0:01CBC83B]
Subject: =?UTF-8?B?UmU6IMOFbmdzdHLDtm0gdmVyc2lvbnM/?=
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
X-List-Received-Date: Wed, 09 Feb 2011 09:24:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 09.02.2011 10:10, schrieb Graeme Gregory:
> On 09/02/2011 07:52, Steffen Sledz wrote:
>> Am 04.02.2011 12:51, schrieb Steffen Sledz:
>>> I'm a bit confused about the Angstrom versions.
>>>
>>> Setting in local.conf is
>>>
>>>   DISTRO =3D "angstrom-2008.1"
>>>
>>> but bitbake reports
>>>
>>>   Build Configuration:
>>>   BB_VERSION        =3D "1.10.2"
>>>   METADATA_BRANCH   =3D "testing-next"
>>>   METADATA_REVISION =3D "3a7b93a"
>>>   TARGET_ARCH       =3D "arm"
>>>   TARGET_OS         =3D "linux-gnueabi"
>>>   MACHINE           =3D "hipox"
>>>   DISTRO            =3D "angstrom"
>>>   DISTRO_VERSION    =3D "2010.7-test-20110204"
>>>   TARGET_FPU        =3D "soft"
>>>
>>> Is this intented?
>>>
>>> BTW: Which is the suggested/released =C3=85ngstr=C3=B6m version? http=
://www.angstrom-distribution.org/ seems to be not very helpful here. e.g.=
 the FAQ link results in an PAGE NOT FOUND. :(
> 2008.1 is the "stable" version of Angstrom which has all the benefit of
> our extensive toolchain testing.
>=20
> 2010.x is angstrom-next and is the in progress version moving to gcc 4.=
5
> blah blah blah.

OK, but why bitbake reports DISTRO_VERSION =3D "2010.7-test-20110204" if =
it is set to DISTRO =3D "angstrom-2008.1" ???

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



