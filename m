Return-Path: <B40290@freescale.com>
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0248.outbound.messaging.microsoft.com [213.199.154.248])
	by mail.openembedded.org (Postfix) with ESMTP id 7D5906185B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Sep 2013 08:34:39 +0000 (UTC)
Received: from mail6-db9-R.bigfish.com (10.174.16.237) by
	DB9EHSOBE032.bigfish.com (10.174.14.95) with Microsoft SMTP Server id
	14.1.225.22; Mon, 9 Sep 2013 08:34:40 +0000
Received: from mail6-db9 (localhost [127.0.0.1])	by mail6-db9-R.bigfish.com
	(Postfix) with ESMTP id 1ECC55C00ED;
	Mon,  9 Sep 2013 08:34:40 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zz98dI9371I542I1432I4015Izz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah1de097h186068h8275bh8275dhz2dh2a8h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5hbe9i1155h)
Received: from mail6-db9 (localhost.localdomain [127.0.0.1]) by mail6-db9
	(MessageSwitch) id 137871567859505_30061;
	Mon,  9 Sep 2013 08:34:38 +0000 (UTC)
Received: from DB9EHSMHS006.bigfish.com (unknown [10.174.16.243])	by
	mail6-db9.bigfish.com (Postfix) with ESMTP id 0A16DBC0040;
	Mon,  9 Sep 2013 08:34:38 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB9EHSMHS006.bigfish.com
	(10.174.14.16) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Mon, 9 Sep 2013 08:34:37 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.211]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.03.0158.002; Mon, 9 Sep 2013 08:34:35 +0000
From: Guo Chunrong-B40290 <B40290@freescale.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, mulhern <mulhern@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH 1/4] snort: add recipe
Thread-Index: AQHOogqYoU561R7uv0G5+bk1CYFU3Zmn2hGAgBVMWFA=
Date: Mon, 9 Sep 2013 08:34:34 +0000
Message-ID: <B21730BB6DA1D24B83348D9301EA417E10462197@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1377486939-31135-1-git-send-email-b40290@freescale.com>
	<19428695.8q4QRytnTK@helios>
In-Reply-To: <19428695.8q4QRytnTK@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.206]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/4] snort: add recipe
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
X-List-Received-Date: Mon, 09 Sep 2013 08:34:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello ,
Please give some comments about patch .

Thanks,
chunrong

-----Original Message-----
From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]=20
Sent: Tuesday, August 27, 2013 3:04 AM
To: Guo Chunrong-B40290; mulhern
Cc: openembedded-devel@lists.openembedded.org; Saul Wold
Subject: Re: [oe] [meta-oe][PATCH 1/4] snort: add recipe

Hi Chunrong,

On Monday 26 August 2013 11:15:39 b40290@freescale.com wrote:
> From: Chunrong Guo <B40290@freescale.com>
>=20
>    *snort - a free lightweight network intrusion detection
>          system for UNIX and Windows

I have to admit I thought this was something that mulhern was working on - =
is that correct mulhern?

In any case I think this would probably be something best put into meta- se=
curity [1].

Cheers,
Paul

[1] http://layers.openembedded.org/layerindex/layer/meta-security/

--=20

Paul Eggleton
Intel Open Source Technology Centre



