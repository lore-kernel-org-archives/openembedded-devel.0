Return-Path: <Zongchun.Yu@freescale.com>
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0251.outbound.messaging.microsoft.com [213.199.154.251])
	by mail.openembedded.org (Postfix) with ESMTP id B3FA16D686
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2013 03:38:14 +0000 (UTC)
Received: from mail118-db9-R.bigfish.com (10.174.16.245) by
	DB9EHSOBE029.bigfish.com (10.174.14.92) with Microsoft SMTP Server id
	14.1.225.22; Thu, 7 Nov 2013 03:38:15 +0000
Received: from mail118-db9 (localhost [127.0.0.1])	by
	mail118-db9-R.bigfish.com (Postfix) with ESMTP id B28022C0187;
	Thu,  7 Nov 2013 03:38:15 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(z37d5kzc89bhc857hzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzz1d7338h17326ah8275bh8275dh18c673h1c8fb4h1de097h186068hz2dh109h2a8h5c0h839hd24hd2bhf0ah1288h12a5h12bdh137ah139eh1441h1504h1537h162dh1631h1751h1758h17f1h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1bceh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h20dbh20f0h2218h2216h1155h)
Received: from mail118-db9 (localhost.localdomain [127.0.0.1]) by mail118-db9
	(MessageSwitch) id 1383795494370814_30849;
	Thu,  7 Nov 2013 03:38:14 +0000 (UTC)
Received: from DB9EHSMHS014.bigfish.com (unknown [10.174.16.233])	by
	mail118-db9.bigfish.com (Postfix) with ESMTP id 4520A22004C;
	Thu,  7 Nov 2013 03:38:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB9EHSMHS014.bigfish.com
	(10.174.14.24) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 7 Nov 2013 03:38:13 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Thu, 7 Nov 2013 03:38:12 +0000
Received: from b40527c60e6e6f (b40527-c60e6e6f.ap.freescale.net
	[10.192.208.151])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id rA73cAFp016473;	Wed, 6 Nov 2013 20:38:10 -0700
From: Zongchun YU <b40527@freescale.com>
To: 'Martin Jansa' <martin.jansa@gmail.com>
References: <1383716430-18050-1-git-send-email-Zongchun.Yu@freescale.com>
	<CA+chaQcpPKUwM6LfuKvvStDLvRYBEeBuPmHnxXuJdEee=zv3tA@mail.gmail.com>
In-Reply-To: <CA+chaQcpPKUwM6LfuKvvStDLvRYBEeBuPmHnxXuJdEee=zv3tA@mail.gmail.com>
Date: Thu, 7 Nov 2013 11:42:22 +0800
Message-ID: <003701cedb6b$5f7bde20$1e739a60$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Ac7a8QQJauYiorM0R5CqerZwyTGQuQAd+k9A
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] tcpdump, tcpreplay:relocate tcpdump and add tcpreplay recipe
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
X-List-Received-Date: Thu, 07 Nov 2013 03:38:15 -0000
Content-Language: zh-cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>Please use -M to get smaller diff.

Hello Martin.

=20

Thanks for your reminder. I have send one new patch to you and the mail =
list.=20

But I don=E2=80=99t know why the patch is rejected by the mail list? It =
is ok before.

If you have suggestion. Please reply to me directly.

=20

Best Regards

Zongchun


