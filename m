Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0930D6FE7E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 13:41:14 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1XF1Su-0005Ol-2w from drew_moseley@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Aug 2014 06:41:16 -0700
Received: from SVR-ORW-FEM-06.mgc.mentorg.com ([147.34.97.120]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 6 Aug 2014 06:41:15 -0700
Received: from NA-MBX-03.mgc.mentorg.com ([fe80::9a:1569:df57:45b8]) by
	SVR-ORW-FEM-06.mgc.mentorg.com ([147.34.97.120]) with mapi id
	14.02.0247.003; Wed, 6 Aug 2014 06:41:15 -0700
From: "Moseley, Drew" <drew_moseley@mentor.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] evtest: Provide updated checksums
Thread-Index: AQHPsXlt1EKOyvK7pkC4DqaNRXRBT5vECbQAgAAA4YA=
Date: Wed, 6 Aug 2014 13:41:15 +0000
Message-ID: <DDDF1E21-0028-492F-B858-9174A09DB1BA@mentor.com>
References: <1407331293-4055-1-git-send-email-drew_moseley@mentor.com>
	<53E22FBE.4060004@mlbassoc.com>
In-Reply-To: <53E22FBE.4060004@mlbassoc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.34.91.1]
MIME-Version: 1.0
X-OriginalArrivalTime: 06 Aug 2014 13:41:15.0989 (UTC)
	FILETIME=[185DB850:01CFB17C]
Subject: Re: [meta-oe][PATCH] evtest: Provide updated checksums
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Aug 2014 13:41:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B53850DE56780F4A8A0AB9BCD33F64F7@mentor.com>
Content-Transfer-Encoding: quoted-printable


On Aug 6, 2014, at 9:38 AM, Gary Thomas <gary@mlbassoc.com> wrote:

> On 2014-08-06 07:21, Drew Moseley wrote:
>> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
>> ---
>>  meta-oe/recipes-support/evtest/evtest_1.25.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta-oe/recipes-support/evtest/evtest_1.25.bb b/meta-oe/rec=
ipes-support/evtest/evtest_1.25.bb
>> index 640cec0..ccaa0c6 100644
>> --- a/meta-oe/recipes-support/evtest/evtest_1.25.bb
>> +++ b/meta-oe/recipes-support/evtest/evtest_1.25.bb
>> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa95=
4499f7abaabaa882bbe"
>>  DEPENDS =3D "libxml2"
>>=20
>>  SRC_URI =3D "http://cgit.freedesktop.org/~whot/evtest/snapshot/evtest-$=
{PV}.tar.bz2;name=3Darchive"
>> -SRC_URI[archive.md5sum] =3D "770d6af03affe976bdbe3ad1a922c973"
>> -SRC_URI[archive.sha256sum] =3D "3d34123c68014dae6f7c19144ef79ea2915fa7a=
2f89ea35ca375a9cf9e191473"
>> +SRC_URI[archive.md5sum] =3D "0ef3fe5e20fa2dee8994827d48482902"
>> +SRC_URI[archive.sha256sum] =3D "6e93ef54f0aa7d263f5486ce4a14cac53cf5003=
6bfd20cf045fef2b27ee6664b"
>>=20
>>  inherit autotools pkgconfig
>=20
> Why did these change?  It's really BAD practice to have a new/different
> version of a program with an old name (hence different checksums).
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

No clue.  I downloaded them today and those were the sums that were there.

Drew=

