Return-Path: <Zongchun.Yu@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe001.messaging.microsoft.com [216.32.181.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4CAEB6DD07
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 02:57:16 +0000 (UTC)
Received: from mail211-ch1-R.bigfish.com (10.43.68.227) by
	CH1EHSOBE019.bigfish.com (10.43.70.76) with Microsoft SMTP Server id
	14.1.225.22; Tue, 26 Nov 2013 02:57:14 +0000
Received: from mail211-ch1 (localhost [127.0.0.1])	by
	mail211-ch1-R.bigfish.com (Postfix) with ESMTP id D39F2360AF9;
	Tue, 26 Nov 2013 02:57:14 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzda00hdc73hzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzzz2dh109h2a8h5c0h839h944hd24hd2bhf0ah1220h1288h12a5h12a9h12bdh137ah139eh13b6h1441h1504h1537h162dh1631h1751h1758h17f1h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h20dbh2218h2216h226dh22d0h1155h)
Received: from mail211-ch1 (localhost.localdomain [127.0.0.1]) by mail211-ch1
	(MessageSwitch) id 1385434633181142_24703;
	Tue, 26 Nov 2013 02:57:13 +0000 (UTC)
Received: from CH1EHSMHS021.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.240])	by mail211-ch1.bigfish.com (Postfix) with ESMTP id
	1E1F9260160;	Tue, 26 Nov 2013 02:57:13 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS021.bigfish.com
	(10.43.70.21) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 26 Nov 2013 02:57:11 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 26 Nov 2013 02:57:10 +0000
Received: from b40527c60e6e6f (b40527-c60e6e6f.ap.freescale.net
	[10.192.208.151])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id rAQ2v7o3016496;	Mon, 25 Nov 2013 19:57:08 -0700
From: Zongchun YU <b40527@freescale.com>
To: 'Otavio Salvador' <otavio@ossystems.com.br>, 'OpenEmbedded Devel List'
	<openembedded-devel@lists.openembedded.org>
References: <1385366403-5491-1-git-send-email-b40527@freescale.com>
	<CAP9ODKo9KDmcMMG3ay8E-nTzpyyRK_tAa3Aq5-MhfF4pO-+rOQ@mail.gmail.com>
In-Reply-To: <CAP9ODKo9KDmcMMG3ay8E-nTzpyyRK_tAa3Aq5-MhfF4pO-+rOQ@mail.gmail.com>
Date: Tue, 26 Nov 2013 10:58:08 +0800
Message-ID: <005701ceea53$57670ec0$06352c40$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Ac7p6Drj5RQe5glfTdeGXEkOVlfkRwAasCog
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: 'Zongchun Yu' <Zongchun.Yu@freescale.com>
Subject: Re: [meta-oe][meta-networking][PATCHv2] tcpdump, tcpreplay:relocate tcpdump and add tcpreplay recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Nov 2013 02:57:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: zh-cn

>Please split the patch in two, one for the move for meta-networking and
another to add the tcpreplay utility.
Thanks for your comments. I have resent the patches. Please review.



