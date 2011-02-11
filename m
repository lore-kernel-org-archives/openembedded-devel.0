Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Pnosd-0003kt-K9
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 10:01:31 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 2B61F49128C;
	Fri, 11 Feb 2011 10:00:28 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 11 Feb 2011 10:00:28 +0100
Message-ID: <4D54FAA7.8030604@dresearch.de>
Date: Fri, 11 Feb 2011 10:00:23 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <4D53E971.5090109@dresearch.de>	<AANLkTimEYm1sDsLob7rwkZy8GshO2KxihZAQBm4azB5e@mail.gmail.com>	<4D53EE67.3020705@dresearch.de>
	<AANLkTikMYFbyza7Ma2d-N_GNpy+U=Gy3gKPx8BRE13eZ@mail.gmail.com>
In-Reply-To: <AANLkTikMYFbyza7Ma2d-N_GNpy+U=Gy3gKPx8BRE13eZ@mail.gmail.com>
X-OriginalArrivalTime: 11 Feb 2011 09:00:28.0131 (UTC)
	FILETIME=[20D09B30:01CBC9CA]
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: different access rights for oe branches?
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
X-List-Received-Date: Fri, 11 Feb 2011 09:01:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 10.02.2011 18:22, schrieb Khem Raj:
> On Thu, Feb 10, 2011 at 5:55 AM, Steffen Sledz <sledz@dresearch.de> wro=
te:
>> Am 10.02.2011 14:48, schrieb Chris Larson:
>>> On Thu, Feb 10, 2011 at 6:34 AM, Steffen Sledz <sledz@dresearch.de> w=
rote:
>>>> We like to create a branch specific for our hipox machine.
>>>>
>>>> Is it possible to define access rights different to the dev-branch h=
ere?
>>>>
>>>> We would like to give write access to some of our developers which d=
o not have/need write access do dev. In opposite it would be nice to limi=
t the write access to these maintainers.
>>>
>>> We use gitolite now, which can indeed exert control over branch acces=
s
>>> for the users, afaik.
>>
>> Fine. :)
>>
>> Who can setup these rights?
>=20
> the admins :) create the branch and what sort of access control is
> required we can configure that

@admins: Please create a new branch named "hipox" by branching the "testi=
ng-release-2011.03" branch.

Am 10.02.2011 18:25, schrieb Khem Raj:
> well while its possible to give access to your developers I would
> suggest that this branch use a pull based approach where
> may be you maintain the branch and your devs submit the changes.

@khem: Please limit the write access to the new branch to me for the mome=
nt. May be we'll extend this to a few other developers/maintainers later.

Thanx,
Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



