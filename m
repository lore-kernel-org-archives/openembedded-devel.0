Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P0Y0R-0003bk-RT
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 13:05:57 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 5D478491282
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Sep 2010 13:05:46 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 28 Sep 2010 13:05:45 +0200
Message-ID: <4CA1CC11.3060509@dresearch.de>
Date: Tue, 28 Sep 2010 13:05:53 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.9) Gecko/20100915 Lightning/1.0b2 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285660172.4168.10.camel@mattotaupa>	<1285661564-1308-1-git-send-email-t.fromm@dresearch.de>	<1285662820.4168.24.camel@mattotaupa>
	<4CA1B071.3000908@dresearch.de>
In-Reply-To: <4CA1B071.3000908@dresearch.de>
X-OriginalArrivalTime: 28 Sep 2010 11:05:45.0936 (UTC)
	FILETIME=[19989D00:01CB5EFD]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [v2] wvstreams-4.6: Remove dbus support because it breaks the build
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
X-List-Received-Date: Tue, 28 Sep 2010 11:05:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 28.09.2010 11:08, schrieb Thilo Fromm:
>> Do you know, if and how =C2=BBPATCH=C2=AB got stripped in the subject?
>> Without it, Patchwork will not pick it up, I think.
>=20
> It got stripped because of your recommendation to use
> --subject-prefix=3D"v2". The "How to submit a patch to OpenEmbedded"
> wiki page at
> <http://wiki.openembedded.net/index.php/How_to_submit_a_patch_to_OpenEm=
bedded#Create_and_Commit_your_patch>
> recommends the same.

Wiki is updated.

Steffen

--=20
Steffen Sledz
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str.3, D-10319 Berlin, Germany
Tel: +49 (30) 515932237 mailto:sledz@DResearch.DE
Fax: +49 (30) 515932299 http://www.DResearch.DE
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 54412;
Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642



