Received: from smtprelay-h31.telenor.se ([213.150.131.4])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Pk3Cu-0005OE-Mg
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 00:30:52 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h31.telenor.se (Postfix) with ESMTP id 51329EAD34
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Feb 2011 00:29:56 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmgWAD/VRk1T4zjzPGdsb2JhbAAMhAmSRY4sAQEBATWsXZBLgSODN3QEiwyBFQ
X-IronPort-AV: E=Sophos;i="4.60,406,1291590000"; d="scan'208";a="170572279"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.56.243])
	by ipb1.telenor.se with ESMTP; 01 Feb 2011 00:29:56 +0100
Message-ID: <4D4745F2.3000309@atmel.com>
Date: Tue, 01 Feb 2011 00:29:54 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D47307B.4040504@atmel.com> <20110131222354.GC10042@ibawizard.net>
In-Reply-To: <20110131222354.GC10042@ibawizard.net>
X-Enigmail-Version: 0.95.7
Subject: Re: Sorry about the recent mess
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
X-List-Received-Date: Mon, 31 Jan 2011 23:30:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Petr =C5=A0tetiar skrev:
> Ulf Samuelsson <ulf.samuelsson@atmel.com> [2011-01-31 22:58:19]:
>=20
>> git format-patch -8 --start-at=3D16
>=20
> Something like that? git format-patch HEAD~16..HEAD~8
>=20
> -- ynezz
>=20

Yes, that worked as a charm.
BR
Ulf

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



