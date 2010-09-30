Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P1Euc-0007TU-KG
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 10:54:47 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 11956491278
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 10:54:35 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 30 Sep 2010 10:54:34 +0200
Message-ID: <4CA4504D.6080900@dresearch.de>
Date: Thu, 30 Sep 2010 10:54:37 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.9) Gecko/20100915 Lightning/1.0b2 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285765693.4578.14.camel@mattotaupa>
	<1285774983-31373-1-git-send-email-t.fromm@dresearch.de>
In-Reply-To: <1285774983-31373-1-git-send-email-t.fromm@dresearch.de>
X-OriginalArrivalTime: 30 Sep 2010 08:54:34.0863 (UTC)
	FILETIME=[1AE5AFF0:01CB607D]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] linux-libc-headers (2.6.24): Add falloc.h to kernel	exported headers
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
X-List-Received-Date: Thu, 30 Sep 2010 08:54:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 29.09.2010 17:43, schrieb Thilo Fromm:
> upstream: OE-only
> This adds include/linux/falloc.h to the list of files exported by the k=
ernel=20
> to the C library. The include file is required for building e.g. a rece=
nt=20
> util-linux-ng against 2.6.24.
>=20
> Starting from 2.6.25 a similar patch has been accepted upstream (the ma=
inline=20
> kernel). For 2.6.24, however, falloc.h is not exported although it's pr=
esent.
>=20
> Signed-off-by: Thilo Fromm <t.fromm@dresearch.de>

Acked-by: Steffen Sledz <sledz@dresearch.de>

--=20
Steffen Sledz
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str.3, D-10319 Berlin, Germany
Tel: +49 (30) 515932237 mailto:sledz@DResearch.DE
Fax: +49 (30) 515932299 http://www.DResearch.DE
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 54412;
Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642



