Return-Path: <B40527@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe005.messaging.microsoft.com [216.32.181.185])
	by mail.openembedded.org (Postfix) with ESMTP id 3D2ED6AF9F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 11:32:49 +0000 (UTC)
Received: from mail74-ch1-R.bigfish.com (10.43.68.231) by
	CH1EHSOBE015.bigfish.com (10.43.70.65) with Microsoft SMTP Server id
	14.1.225.22; Fri, 1 Nov 2013 11:32:49 +0000
Received: from mail74-ch1 (localhost [127.0.0.1])	by mail74-ch1-R.bigfish.com
	(Postfix) with ESMTP id C5240380152;
	Fri,  1 Nov 2013 11:32:49 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzda00hdc73hzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzzz2dh2a8h5c0h839h944hd24hd2bhf0ah1220h1288h12a5h12a9h12bdh137ah139eh13b6h1441h1504h1537h162dh1631h1751h1758h17f1h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h20dbh2218h2216h1155h)
Received: from mail74-ch1 (localhost.localdomain [127.0.0.1]) by mail74-ch1
	(MessageSwitch) id 138330553791931_14552;
	Fri,  1 Nov 2013 11:32:17 +0000 (UTC)
Received: from CH1EHSMHS001.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.250])	by mail74-ch1.bigfish.com (Postfix) with ESMTP id
	CCD701C0067;	Fri,  1 Nov 2013 11:31:59 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS001.bigfish.com
	(10.43.70.1) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 1 Nov 2013 11:31:58 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 1 Nov 2013 11:31:57 +0000
Received: from b40527c60e6e6f (b40527-c60e6e6f.ap.freescale.net
	[10.192.208.151])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id rA1BVsne028059;	Fri, 1 Nov 2013 04:31:55 -0700
From: Zongchun YU <b40527@freescale.com>
To: 'Martin Jansa' <martin.jansa@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1383205247-8487-1-git-send-email-b40527@freescale.com>
	<20131031081012.GC32015@jama> <20131101110833.GP32015@jama>
In-Reply-To: <20131101110833.GP32015@jama>
Date: Fri, 1 Nov 2013 19:35:39 +0800
Message-ID: <007d01ced6f6$7f44b070$7dce1150$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Ac7W8rUnvJmB7MY1S6yBLyecJUib3wAA00Ag
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: 'Zongchun Yu' <Zongchun.Yu@freescale.com>, b44149@freescale.com
Subject: Re: [meta-oe][PATCH v2] tcpreplay:add recipe
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
X-List-Received-Date: Fri, 01 Nov 2013 11:32:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: zh-cn

>it fails to detect libpcap in my world builds:

Thanks for your feedback. I am investigating this issue. It will be fixed in
the latest patches.



