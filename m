Return-Path: <B40527@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe006.messaging.microsoft.com [216.32.180.16])
	by mail.openembedded.org (Postfix) with ESMTP id 126F46D537
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 03:02:45 +0000 (UTC)
Received: from mail89-va3-R.bigfish.com (10.7.14.240) by
	VA3EHSOBE006.bigfish.com (10.7.40.26) with Microsoft SMTP Server id
	14.1.225.22; Fri, 1 Nov 2013 03:02:45 +0000
Received: from mail89-va3 (localhost [127.0.0.1])	by mail89-va3-R.bigfish.com
	(Postfix) with ESMTP id BEB882E01AA;
	Fri,  1 Nov 2013 03:02:45 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371Ic89bhzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzz1de098h8275bh1de097hz2dh2a8h5c0h839h93fhd24hd2bhf0ah1288h12a5h12a9h12bdh137ah139eh13b6h1441h1504h1537h162dh1631h1751h1758h17f1h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h20dbh2218h2216h1155h)
Received: from mail89-va3 (localhost.localdomain [127.0.0.1]) by mail89-va3
	(MessageSwitch) id 1383274933402345_29901;
	Fri,  1 Nov 2013 03:02:13 +0000 (UTC)
Received: from VA3EHSMHS007.bigfish.com (unknown [10.7.14.233])	by
	mail89-va3.bigfish.com (Postfix) with ESMTP id 6A90E220071;
	Fri,  1 Nov 2013 03:01:53 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS007.bigfish.com
	(10.7.99.17) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 1 Nov 2013 03:01:51 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 1 Nov 2013 03:01:50 +0000
Received: from b40527c60e6e6f (b40527-c60e6e6f.ap.freescale.net
	[10.192.208.151])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id rA131l4U025722;	Thu, 31 Oct 2013 20:01:48 -0700
From: Zongchun YU <b40527@freescale.com>
To: 'Khem Raj' <raj.khem@gmail.com>, 'openembeded-devel'
	<openembedded-devel@lists.openembedded.org>
References: <1383205247-8487-1-git-send-email-b40527@freescale.com>
	<CAMKF1sqTBq-J_trvVcmVcCT7uuJEaXuECaczSEbjDRNQDWRz3A@mail.gmail.com>
In-Reply-To: <CAMKF1sqTBq-J_trvVcmVcCT7uuJEaXuECaczSEbjDRNQDWRz3A@mail.gmail.com>
Date: Fri, 1 Nov 2013 11:05:31 +0800
Message-ID: <001c01ced6af$3b5db1a0$b21914e0$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Ac7WV06hLv11NoleSpmgMUBsi6V7RAAVsyJA
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
X-List-Received-Date: Fri, 01 Nov 2013 03:02:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: zh-cn

>get rid of that, and why are the configure patches not ok for =
upstreaming ?

Hello Khem.

Thanks for your comments, I am a newcomer for upstreaming. Do you mean =
that first I should send the two patches
to upstream?

Best Regards
Zongchun
-----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
=E5=8F=91=E4=BB=B6=E4=BA=BA: Khem Raj [mailto:raj.khem@gmail.com]=20
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2013=E5=B9=B411=E6=9C=881=E6=97=A5 =
0:36
=E6=94=B6=E4=BB=B6=E4=BA=BA: openembeded-devel
=E6=8A=84=E9=80=81: Zongchun Yu; b44149@freescale.com
=E4=B8=BB=E9=A2=98: Re: [oe] [meta-oe][PATCH v2] tcpreplay:add recipe

On Thu, Oct 31, 2013 at 12:40 AM,  <b40527@freescale.com> wrote:
> +PR =3D "r0"

get rid of that, and why are the configure patches not ok for =
upstreaming ?



