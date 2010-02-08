Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NeWOK-0006bB-1u
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 17:23:19 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 48ED949127F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Feb 2010 17:20:46 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 8 Feb 2010 17:21:38 +0100
Message-ID: <4B7039F6.60108@dresearch.de>
Date: Mon, 08 Feb 2010 17:21:10 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B701EA0.5090304@dresearch.de>
	<20100208154050.GZ24852@ibawizard.net>
In-Reply-To: <20100208154050.GZ24852@ibawizard.net>
X-OriginalArrivalTime: 08 Feb 2010 16:21:38.0944 (UTC)
	FILETIME=[CAA22000:01CAA8DA]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: configure failes for mc-4.6.2-r4
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
X-List-Received-Date: Mon, 08 Feb 2010 16:23:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Petr =C5=A0tetiar wrote:
> Steffen Sledz <sledz@dresearch.de> [2010-02-08 15:24:32]:
>=20
>> Is anybody familar with autotools able to fix this?
>> | configure.ac:104: required file `config/config.rpath' not found
>=20
> You mean something like 'touch config.rpath' ? :)

Maybe. But when and where?  ;-)

I've no idea how to patch the recipe to let it run succesfully.



