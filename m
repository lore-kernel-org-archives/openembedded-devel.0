Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PqR6v-0004bT-5f
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 15:15:05 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 97B17491283
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 15:13:51 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 18 Feb 2011 15:13:51 +0100
Message-ID: <4D5E7E9F.40408@dresearch.de>
Date: Fri, 18 Feb 2011 15:13:51 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch.de>
References: <DB561678F08F554EB0D9F21B70E268A5056575@exchange.intern.dresearch.de>
	<1298038322-20481-1-git-send-email-sledz@dresearch.de>
In-Reply-To: <1298038322-20481-1-git-send-email-sledz@dresearch.de>
X-OriginalArrivalTime: 18 Feb 2011 14:13:51.0749 (UTC)
	FILETIME=[11894350:01CBCF76]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] u-boot-2009.03: use AMD fixups for AMIC too
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
X-List-Received-Date: Fri, 18 Feb 2011 14:15:05 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Am 18.02.2011 15:12, schrieb Steffen Sledz:
> From: Mario Schuknecht <m.schuknecht@dresearch.de>
>=20
> * AMIC flashes are AMD clones and need the same fixups.

I made some modifications to the patch to make it available at least for =
all u-boot-2009.03 users.

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



