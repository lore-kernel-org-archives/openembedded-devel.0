Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PwzSE-0002vj-O5
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 17:08:11 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 6BC96491282
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Mar 2011 16:37:27 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 8 Mar 2011 16:37:27 +0100
Message-ID: <4D764D37.9000401@dresearch.de>
Date: Tue, 08 Mar 2011 16:37:27 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.15) Gecko/20110303 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <il56eoMAN_POSIXLY_CORRECT=1@dough.gmane.org>	<1299588887-18797-1-git-send-email-sledz@dresearch.de>
	<il5eqa$fkr$1@dough.gmane.org>
In-Reply-To: <il5eqa$fkr$1@dough.gmane.org>
X-OriginalArrivalTime: 08 Mar 2011 15:37:27.0427 (UTC)
	FILETIME=[BA8C7D30:01CBDDA6]
Subject: Re: [PATCH v3] gupnp_0.13.4/gupnp-av_0.5.9: disable introspection
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
X-List-Received-Date: Tue, 08 Mar 2011 16:08:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 08.03.2011 15:34, schrieb Koen Kooi:
> On 08-03-11 13:54, Steffen Sledz wrote:
>> Introspection uses host tools within compile stage. Missing tools or
>> tools of wrong version result in errors like
>=20
>> |   GEN    GUPnP-1.0.gir
>> | Couldn't find include 'Soup-2.4.gir' (search path: ...)
>=20
>> or
>=20
>> |   GEN    GUPnP-1.0.gir
>> | /usr/share/gir-1.0/Soup-2.4.gir: Incompatible version 1.0 (supported=
: 1.2)
>=20
>> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
>=20
> Acked-by: Koen Kooi <koen@dominion.thruhere.net>

pushed

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



