Return-Path: <B40527@freescale.com>
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0253.outbound.messaging.microsoft.com [213.199.154.253])
	by mail.openembedded.org (Postfix) with ESMTP id E40FF6D3C9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 09:05:33 +0000 (UTC)
Received: from mail13-db9-R.bigfish.com (10.174.16.249) by
	DB9EHSOBE014.bigfish.com (10.174.14.77) with Microsoft SMTP Server id
	14.1.225.22; Thu, 31 Oct 2013 09:05:35 +0000
Received: from mail13-db9 (localhost [127.0.0.1])	by mail13-db9-R.bigfish.com
	(Postfix) with ESMTP id E9B29402F4;
	Thu, 31 Oct 2013 09:05:34 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzda00hdc73hzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzzz2dh2a8h5c0h839h944hd24hd2bhf0ah1220h1288h12a5h12a9h12bdh137ah139eh13b6h1441h1504h1537h162dh1631h1751h1758h17f1h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h20dbh2218h2216h1155h)
Received: from mail13-db9 (localhost.localdomain [127.0.0.1]) by mail13-db9
	(MessageSwitch) id 138321033332153_19165;
	Thu, 31 Oct 2013 09:05:33 +0000 (UTC)
Received: from DB9EHSMHS028.bigfish.com (unknown [10.174.16.226])	by
	mail13-db9.bigfish.com (Postfix) with ESMTP id ED7D92A004B;
	Thu, 31 Oct 2013 09:05:32 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB9EHSMHS028.bigfish.com
	(10.174.14.38) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 31 Oct 2013 09:05:32 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Thu, 31 Oct 2013 09:05:30 +0000
Received: from b40527c60e6e6f (b40527-c60e6e6f.ap.freescale.net
	[10.192.208.151])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r9V95R5W014898;	Thu, 31 Oct 2013 02:05:28 -0700
From: Zongchun YU <b40527@freescale.com>
To: 'Martin Jansa' <martin.jansa@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1383205247-8487-1-git-send-email-b40527@freescale.com>
	<20131031081012.GC32015@jama>
In-Reply-To: <20131031081012.GC32015@jama>
Date: Thu, 31 Oct 2013 17:09:07 +0800
Message-ID: <006201ced618$dc97d420$95c77c60$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Ac7WEKI8PmmLnDOwT4OouRFd0AMM5QABYTJw
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
X-List-Received-Date: Thu, 31 Oct 2013 09:05:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: zh-cn

Hi Martin.

Thanks for your kind comments. I see tcpdump in meta-oe layer too. tcpreplay
may use packages captured by tcpdump.
putting them in the same layer maybe better. Wish your suggestion?

Best Regards
Zongchun



