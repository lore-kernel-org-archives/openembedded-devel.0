Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Y080067@e.ntu.edu.sg>) id 1Rb2gJ-0007yY-PG
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 05:12:32 +0100
Received: from mail126-ch1-R.bigfish.com (10.43.68.248) by
	CH1EHSOBE018.bigfish.com (10.43.70.68) with Microsoft SMTP Server id
	14.1.225.23; Thu, 15 Dec 2011 02:50:05 +0000
Received: from mail126-ch1 (localhost [127.0.0.1])	by
	mail126-ch1-R.bigfish.com (Postfix) with ESMTP id D91C132014E;
	Thu, 15 Dec 2011 02:50:08 +0000 (UTC)
X-SpamScore: 18
X-BigFish: PS18(zzc85fh14ffO8532mzz1202hzz8275bh8275dhf73b6ilz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:111.221.23.141; KIP:(null); UIP:(null);
	IPV:NLI; H:SINPRD0104HT001.apcprd01.prod.exchangelabs.com;
	RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail126-ch1 (localhost.localdomain [127.0.0.1]) by mail126-ch1
	(MessageSwitch) id 1323917408767289_21339;
	Thu, 15 Dec 2011 02:50:08 +0000 (UTC)
Received: from CH1EHSMHS021.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.241])	by mail126-ch1.bigfish.com (Postfix) with ESMTP id
	B61981401BC;	Thu, 15 Dec 2011 02:50:08 +0000 (UTC)
Received: from SINPRD0104HT001.apcprd01.prod.exchangelabs.com (111.221.23.141)
	by CH1EHSMHS021.bigfish.com (10.43.70.21) with Microsoft SMTP Server
	(TLS) id 14.1.225.23; Thu, 15 Dec 2011 02:50:05 +0000
Received: from SINPRD0104MB133.apcprd01.prod.exchangelabs.com ([169.254.1.40])
	by SINPRD0104HT001.apcprd01.prod.exchangelabs.com ([10.210.223.37])
	with mapi id 14.15.0018.001; Thu, 15 Dec 2011 02:50:00 +0000
From: #LOH KHAI PING# <Y080067@e.ntu.edu.sg>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Enquire > Initramfs
Thread-Index: Acy61Dq13dnuUUOGSpmDs7Hl6NHB0w==
Date: Thu, 15 Dec 2011 02:49:59 +0000
Message-ID: <BB88E9AFCBAA2B4DA2CE2EA1D67484FB0C6ACBF7@SINPRD0104MB133.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.210.222.10]
MIME-Version: 1.0
X-OriginatorOrg: e.ntu.edu.sg
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: "#LOH KHAI PING# \(Y080067@ntu.edu.sg\)" <Y080067@ntu.edu.sg>
Subject: Enquire > Initramfs
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
X-List-Received-Date: Thu, 15 Dec 2011 04:12:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am currently doing research on openembedded for my project. I facing some=
 problems hoping you guys can enlighten me. I manage to follow this tutoria=
l www.3open.org/d/oe/build_kernel_with_inline_initramfs  to create a initra=
msfs(.cpio)+kernel . It manage to get boot up on my board. But when I try t=
o load it separately it fails.

I try to load .cpio.gz and kernel. For example I load my .cpio.gz at 0x2100=
0000. I pass this address as initrd to my kernel but my kernel cant seems t=
o find .cpio.gz . Below is the error message.

http://pastebin.com/Li22FBER

Really wish you guys could assist me.

Regards,
Khai Ping

