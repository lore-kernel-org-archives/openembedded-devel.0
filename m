Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PnX0w-0004AM-1d
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 14:56:54 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id CA48E491297;
	Thu, 10 Feb 2011 14:55:51 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 10 Feb 2011 14:55:51 +0100
Message-ID: <4D53EE67.3020705@dresearch.de>
Date: Thu, 10 Feb 2011 14:55:51 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D53E971.5090109@dresearch.de>
	<AANLkTimEYm1sDsLob7rwkZy8GshO2KxihZAQBm4azB5e@mail.gmail.com>
In-Reply-To: <AANLkTimEYm1sDsLob7rwkZy8GshO2KxihZAQBm4azB5e@mail.gmail.com>
X-OriginalArrivalTime: 10 Feb 2011 13:55:51.0880 (UTC)
	FILETIME=[3A945480:01CBC92A]
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
X-List-Received-Date: Thu, 10 Feb 2011 13:56:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 10.02.2011 14:48, schrieb Chris Larson:
> On Thu, Feb 10, 2011 at 6:34 AM, Steffen Sledz <sledz@dresearch.de> wro=
te:
>> We like to create a branch specific for our hipox machine.
>>
>> Is it possible to define access rights different to the dev-branch her=
e?
>>
>> We would like to give write access to some of our developers which do =
not have/need write access do dev. In opposite it would be nice to limit =
the write access to these maintainers.
>=20
> We use gitolite now, which can indeed exert control over branch access
> for the users, afaik.

Fine. :)

Who can setup these rights?

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



