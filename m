Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MynnO-00066w-39
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Oct 2009 16:28:45 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 79FBC16E235
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2009 16:27:47 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 351312A4285
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2009 16:27:47 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 16 Oct 2009 16:29:31 +0200
Message-ID: <4AD882C6.8090609@dresearch.de>
Date: Fri, 16 Oct 2009 16:27:18 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AD59AF2.50003@dresearch.de>
	<4AD8531B.6070208@dresearch.de>	<4AD87CF8.8040706@dresearch.de>
	<200910161820.44480.khimov@altell.ru>
In-Reply-To: <200910161820.44480.khimov@altell.ru>
X-OriginalArrivalTime: 16 Oct 2009 14:29:32.0046 (UTC)
	FILETIME=[1395B2E0:01CA4E6D]
X-SA-Exim-Connect-IP: 87.193.137.78
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: glibc_2.9 compile failed for armv5te
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
X-List-Received-Date: Fri, 16 Oct 2009 14:28:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Roman I Khimov wrote:
> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0 16 =D0=BE=D0=BA=D1=82=D1=8F=
=D0=B1=D1=80=D1=8F 2009 18:02:32 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Steffen S=
ledz =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
>> Any protests against putting a
>>
>>   PARALLEL_MAKE =3D " "
>>
>> into recipes/glibc/glibc_2.9.bb? Or better into recipes/glibc/glibc.in=
c?
>=20
> It would slow down glibc builds considerably and glibc is already one o=
f most=20
> time-consuming things in the whole build process. So if it's really som=
e build=20
> dependency problem (which I've never experienced in glibc), better fix =
this=20
> particular dependency problem.

As i wrote before i see no way to find the dependency problem for
myself. Sorry. Anyone else?

Steffen




