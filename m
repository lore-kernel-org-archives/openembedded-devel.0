Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Q7tPQ-0005I5-31
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 19:54:36 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb [147.11.189.41])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p37HqAiX016716
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Apr 2011 10:52:11 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.1.73]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.01.0255.000;
	Thu, 7 Apr 2011 10:52:10 -0700
From: "Hatle, Mark" <mark.hatle@windriver.com>
To: "<openembedded-devel@lists.openembedded.org>"
	<openembedded-devel@lists.openembedded.org>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Yocto project video
Thread-Index: AQHL9IZlFPcn+Y/5mEWqMovwuC915pRTIx0A//+M3rk=
Date: Thu, 7 Apr 2011 17:52:09 +0000
Message-ID: <A36AA2D6-5A55-47C3-AA1B-25EC101CA046@windriver.com>
References: <4D9CAD27.4050106@balister.org>,
	<1302198254.23237.4.camel@mattotaupa>
In-Reply-To: <1302198254.23237.4.camel@mattotaupa>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: Yocto project video
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
X-List-Received-Date: Thu, 07 Apr 2011 17:54:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable





On Apr 7, 2011, at 10:44 AM, "Paul Menzel" <paulepanter@users.sourceforge.n=
et> wrote:

> Am Mittwoch, den 06.04.2011, 11:12 -0700 schrieb Philip Balister:
>> For your amusement:
>>=20
>> http://www.yoctoproject.org/
>>=20
>> Please note, the audience is non-technical people, not us :) We already=
=20
>> know how to build embedded systems.
>>=20
>> I thought the video did a good job of presenting the larger goals of the=
=20
>> Yocto Project.
>=20
> Yes, I like this video. Thank you for sharing it.
>=20
> I did not understand the one thing though on how it is easy to choose a
> commercial Linux distribution? Which one do they mean and can they
> handle BitBake recipes? Or what did they mean?
>=20

"they" want a clear transition from a build system and recipe set to a comm=
ercially supported Eco system of OSVs.

They being semiconductor manufacturers, OSVs, product integrators, etc.... =
Historically the problem has been that someone will start a prototype with =
a semiconductor (or open source) system.. They then decide to build a devic=
e and look for commercial support... At which point they generally have to =
start over once they choose their support partner.

With Yocto, if you start with the open source version and layers, you can t=
hen have a clear known path to a commercial service contract with a more cl=
ear expectation of what can or can not be reused.

That's the theory, we hope we can make it a reality.

>=20
> Thanks,
>=20
> Paul
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


