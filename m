Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PxD9e-0002zO-Ng
	for Openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 07:45:54 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id B819C27C403;
	Wed,  9 Mar 2011 07:44:21 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 9 Mar 2011 07:44:21 +0100
Message-ID: <4D7721C1.9050703@dresearch.de>
Date: Wed, 09 Mar 2011 07:44:17 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.15) Gecko/20110303 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <4D64BD5E.6040805@dresearch.de> <4D6DF124.2080607@dresearch.de>
	<AANLkTi=sJanB_o6LGmg=3-96=iDD8VMrM-DLp4EC+zBr@mail.gmail.com>
	<4D6E0CF4.4040005@dresearch.de>
	<AANLkTi=UYfsdZQvvQzLMBkZ21wFpPQK-p7pdbSy1F-_H@mail.gmail.com>
	<4D75DBE0.5090601@dresearch.de>
	<AANLkTi=MWAtHv6fxExUwExiMra6EFv+oACNm2Hn+jDbS@mail.gmail.com>
In-Reply-To: <AANLkTi=MWAtHv6fxExUwExiMra6EFv+oACNm2Hn+jDbS@mail.gmail.com>
X-OriginalArrivalTime: 09 Mar 2011 06:44:21.0705 (UTC)
	FILETIME=[6BFC6390:01CBDE25]
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: net-snmp-svn-r7.0 do_compile failed
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
X-List-Received-Date: Wed, 09 Mar 2011 06:45:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 08.03.2011 19:21, schrieb Khem Raj:
> On Mon, Mar 7, 2011 at 11:33 PM, Steffen Sledz <sledz@dresearch.de> wro=
te:
>> Am 02.03.2011 21:45, schrieb Khem Raj:
>>>>> and for others you can backport the
>>>>> fix and you can backport it as it is ideally that patch should
>>>>> have changed configure.ac and regenerated configure but they patche=
d
>>>>> configure instead. but its ok to patch configure here since
>>>>> we do not regenerate configure for net-snmp recipe.
>>>>
>>>> As mentioned before i failed trying this. The patch does not apply w=
ithout modifications. :(
>>>>
>>>
>>> hmmm I cant promise but if I have time I can look into it
>>
>> Hi Khem, any chance that you can work on it in the next days?
>=20
> I thought you check git regularly I already fixed it with
> 3fac2c7d24b4c4c3cbdff2a6b303a4db47e089f4

Great, thanx.

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



