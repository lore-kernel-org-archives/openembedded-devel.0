Return-Path: <prvs=827775333=Andreas.Obergschwandtner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 0C28C79BEF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 06:36:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.54,415,1534802400"; 
   d="scan'208";a="1746370"
From: Andreas Obergschwandtner - SKIDATA <Andreas.Obergschwandtner@skidata.com>
To: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>,
	=?iso-8859-1?Q?Andr=E9_Draszik?= <git@andred.net>
Thread-Topic: [oe] [meta-java][PATCH] openjdk-8-native: hotspot: handle
	format-overflow error for gcc >= 7
Thread-Index: AQHUVK2T0g65ISaCD064FbQZnjkRCw==
Date: Tue, 23 Oct 2018 06:36:47 +0000
Message-ID: <f10d38bf27e843e580ed0f386031e09f@skidata.com>
References: <20180925085538.24188-1-andreas.obergschwandtner@skidata.com>
	<706876eeb67589b7a04d0243b91156ac480c6434.camel@andred.net>
	<515ae35f-d56a-571e-44b4-bcd3cb0133c4@skidata.com>
Accept-Language: de-AT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.111.252]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] openjdk-8-native: hotspot: handle format-overflow error for gcc >= 7
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
X-List-Received-Date: Tue, 23 Oct 2018 06:36:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Am 22.10.18 um 15:14 schrieb Richard Leitner - SKIDATA:=0A=
> Hi Andr=E9,=0A=
>=0A=
> On 10/18/18 3:47 PM, Andr=E9 Draszik wrote:=0A=
>> Hi (Richard),=0A=
>>=0A=
>>=0A=
>> On Tue, 2018-09-25 at 10:55 +0200, Andreas Obergschwandtner wrote:=0A=
>>> fixed the format-overflow warnings by patch affected files in=0A=
>>> openjdk-8-hotspot=0A=
>>>=0A=
>>> Signed-off-by: Andreas Obergschwandtner <=0A=
>>> andreas.obergschwandtner@skidata.com>=0A=
>>> ---=0A=
>>>   .../hotspot-handle-gcc7-format-overflow.patch | 25 ++++++++++++++++++=
+=0A=
>>>   1 file changed, 25 insertions(+)=0A=
>>>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/hotspot-han=
dle-=0A=
>>> gcc7-format-overflow.patch=0A=
>> This patch seems to have been staged to master-next, but the patch is no=
t=0A=
>> actually being used / referenced by the recipe.=0A=
> Thanks for that catch!=0A=
> I also faced this problem now during the test build.=0A=
>=0A=
> Therefore: Anreas, may you please send a v2? Thanks!=0A=
>=0A=
> Until then I'll remove it from master-next.=0A=
>=0A=
> regards;Richard.L=0A=
>=0A=
Hi,=0A=
=0A=
sorry for that, I will provide a v2 shortly.=0A=
=0A=
=0A=
Best regards,=0A=
Andreas=0A=

