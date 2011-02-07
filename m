Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PmMEb-0001SU-Ov
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 09:14:09 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id D125E49127F;
	Mon,  7 Feb 2011 09:13:10 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 7 Feb 2011 09:13:10 +0100
Message-ID: <4D4FA996.8090400@dresearch.de>
Date: Mon, 07 Feb 2011 09:13:10 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=QkexH5odXt9-6a9SFe=hhyv=tsiBXOhHt-u9p@mail.gmail.com>	<4D4C1986.8090908@dresearch.de>
	<AANLkTim9GhtKZHMbi_vdfcbM=PqSGuwVGf68i03DDKfE@mail.gmail.com>
In-Reply-To: <AANLkTim9GhtKZHMbi_vdfcbM=PqSGuwVGf68i03DDKfE@mail.gmail.com>
X-OriginalArrivalTime: 07 Feb 2011 08:13:10.0809 (UTC)
	FILETIME=[DBFCA090:01CBC69E]
Subject: Re: testing branch 2011-02-03
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
X-List-Received-Date: Mon, 07 Feb 2011 08:14:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 04.02.2011 19:07, schrieb Khem Raj:
> On Fri, Feb 4, 2011 at 7:21 AM, Steffen Sledz <sledz@dresearch.de> wrot=
e:
>> On 02/04/2011 02:08 PM, Cliff Brake wrote:
>>> master has been merged to testing-next and is ready for clean builds.
>>
>> My first try with the new branch and minimal-image failed configuring =
libtool-native-2.2.6b-r28.1 with a perl version mismatch error (see attac=
hed log). :(
>>
>> Build Configuration:
>> BB_VERSION        =3D "1.10.2"
>> METADATA_BRANCH   =3D "testing-next"
>> METADATA_REVISION =3D "f06b04c"
>> TARGET_ARCH       =3D "arm"
>> TARGET_OS         =3D "linux-gnueabi"
>> MACHINE           =3D "hipox"
>> DISTRO            =3D "angstrom"
>> DISTRO_VERSION    =3D "2010.7-test-20110204"
>> TARGET_FPU        =3D "soft"
>>
>> openSUSE 11.3 32-bit
>=20
> I wonder for angstrom-2010 we use libtool 2.4 how come you end up with =
2.2 ?

It isn't angstrom-2010 but angstrom-2008.1.

For the =C3=85ngstr=C3=B6m version confusion see the other thread[1] i st=
arted.

Steffen

[1] <http://thread.gmane.org/gmane.comp.handhelds.openembedded/42208>

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



