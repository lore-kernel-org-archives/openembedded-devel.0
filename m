Return-Path: <Zongchun.Yu@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe002.messaging.microsoft.com [216.32.180.12])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4686D3A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2013 09:34:22 +0000 (UTC)
Received: from mail14-va3-R.bigfish.com (10.7.14.234) by
	VA3EHSOBE005.bigfish.com (10.7.40.25) with Microsoft SMTP Server id
	14.1.225.22; Thu, 7 Nov 2013 09:34:23 +0000
Received: from mail14-va3 (localhost [127.0.0.1])	by mail14-va3-R.bigfish.com
	(Postfix) with ESMTP id 1A45E10017D;
	Thu,  7 Nov 2013 09:34:23 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(z37d5kzda00hdc73hzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzzz2dh109h2a8h5c0h839h944hd24hd2bhf0ah1220h1288h12a5h12a9h12bdh137ah139eh13b6h1441h1504h1537h162dh1631h1751h1758h17f1h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h20dbh2218h2216h1155h)
Received: from mail14-va3 (localhost.localdomain [127.0.0.1]) by mail14-va3
	(MessageSwitch) id 1383816861444708_8870;
	Thu,  7 Nov 2013 09:34:21 +0000 (UTC)
Received: from VA3EHSMHS019.bigfish.com (unknown [10.7.14.235])	by
	mail14-va3.bigfish.com (Postfix) with ESMTP id 5DA7E600C1;
	Thu,  7 Nov 2013 09:34:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS019.bigfish.com
	(10.7.99.29) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 7 Nov 2013 09:34:21 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Thu, 7 Nov 2013 09:34:20 +0000
Received: from b40527c60e6e6f (b40527-c60e6e6f.ap.freescale.net
	[10.192.208.151])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id rA79YGZK018693;	Thu, 7 Nov 2013 02:34:17 -0700
From: Zongchun YU <b40527@freescale.com>
To: 'Martin Jansa' <martin.jansa@gmail.com>, <Zongchun.Yu@freescale.com>
References: <1383792523-9623-1-git-send-email-Zongchun.Yu@freescale.com>
	<20131107091210.GA3682@jama>
In-Reply-To: <20131107091210.GA3682@jama>
Date: Thu, 7 Nov 2013 17:38:30 +0800
Message-ID: <006401cedb9d$209a3ad0$61ceb070$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Ac7bmWyruwZdESdYTw6quSl/uCeK8gAAdv2w
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCHv2] tcpdump, tcpreplay:relocate tcpdump and add tcpreplay recipe
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
X-List-Received-Date: Thu, 07 Nov 2013 09:34:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: zh-cn

>Can you update the packagegroup in meta-oe which depends on tcpdump?
>PACKAGECONFIG or just dropping tcpdump from it is fine with me.

Martin, please see the last parts of the patch. I have dropped tcpdump in
the packagegroup recipe And it is fine with me too.



