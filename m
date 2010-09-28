Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1P0WQX-00077N-7t
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 11:24:46 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 53CC5491278
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Sep 2010 11:24:36 +0200 (CEST)
Received: from bfg9000.intern.dresearch.de ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 28 Sep 2010 11:24:36 +0200
Message-ID: <4CA1B44E.3070704@dresearch.de>
Date: Tue, 28 Sep 2010 11:24:30 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100915 Lightning/1.0b1 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285660172.4168.10.camel@mattotaupa>	<1285661564-1308-1-git-send-email-t.fromm@dresearch.de>	<1285662820.4168.24.camel@mattotaupa>
	<4CA1B071.3000908@dresearch.de>
In-Reply-To: <4CA1B071.3000908@dresearch.de>
X-OriginalArrivalTime: 28 Sep 2010 09:24:36.0020 (UTC)
	FILETIME=[F7A4EF40:01CB5EEE]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
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
X-List-Received-Date: Tue, 28 Sep 2010 09:24:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello Paul,

>>> From: t.fromm<t.fromm@ba11ecae-741b-462f-8724-1218f99f5906>
>>
>> Where does that line come from. Did you send this patch from the same
>> system and did you configure git correctly?
>>
>> git config user.name Thilo Fromm
>> git config user.email t.fromm@dresearch.de
>>
>> It is just a cosmetic error, but this line will be shown in the commit
>> history and used for the weekly changelog generation.
>
> I have these two config fields set up exactly like this. Git, however,
> chooses to generate a mail with two From: header lines.

Wait, I got it - I had to reset the original author. I committed this=20
patch before I configured my git to use a real email address.



Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Developer
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228   mailto:t.fromm@dresearch.de
Fax: +49 (30) 515 932 77    http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB:54412
Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle


