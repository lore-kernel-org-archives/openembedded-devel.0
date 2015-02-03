Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 417 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 03 Feb 2015 09:12:57 UTC
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.104])
	by mail.openembedded.org (Postfix) with ESMTP id 4B24F6E5D7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Feb 2015 09:12:57 +0000 (UTC)
Received: from [216.82.254.195] by server-8.bemta-7.messagelabs.com id
	7C/D4-03195-87F80D45; Tue, 03 Feb 2015 09:06:00 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-9.tower-200.messagelabs.com!1422954358!20807610!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.12.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5726 invoked from network); 3 Feb 2015 09:05:58 -0000
Received: from mail.mx4.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-9.tower-200.messagelabs.com with RC4-SHA encrypted SMTP;
	3 Feb 2015 09:05:58 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.389.2;
	Tue, 3 Feb 2015 03:05:33 -0600
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 3 Feb 2015 03:05:57 -0600
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0224.002;
	Tue, 3 Feb 2015 10:05:55 +0100
From: "Viguera, Javier" <Javier.Viguera@digi.com>
To: 'Paul Eggleton' <paul.eggleton@linux.intel.com>, 'Tom King'
	<ka6sox@gmail.com>
Thread-Topic: [oe] [meta-networking] crda-1.1.3 broken in dylan, dora, daisy
	and dizzy
Thread-Index: AQHQPLGYDmnC7X8dtEaLLmaemAjX0pzeoR9w
Date: Tue, 3 Feb 2015 09:05:54 +0000
Message-ID: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0D891E@dor-sms-xch01.digi.com>
References: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0D86B1@dor-sms-xch01.digi.com>
	<3777411.pG0mYOicST@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <3777411.pG0mYOicST@peggleto-mobl5.ger.corp.intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.188]
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean
MIME-Version: 1.0
Cc: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking] crda-1.1.3 broken in dylan, dora, daisy and dizzy
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
X-List-Received-Date: Tue, 03 Feb 2015 09:13:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul and Tom,

> -----Original Message-----
> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
>=20
> I agree, #2 is the best option to take care of the older branches.
>=20
> Tom, can you please fetch the following files and add them to the OE
> source
> mirror:
>=20
>   http://distfiles.lesslinux.org/crda-1.1.3.tar.bz2
>   http://distfiles.lesslinux.org/2013.01.11-regulatory.bin
>=20
> I've verified the md5sums match the recipe:
>=20
>   29579185e06a75675507527243d28e5c  crda-1.1.3.tar.bz2
>   e0c8a5ca63fb8bf803213f9a0c90b50b  2013.01.11-regulatory.bin

Good to know we agree on the best option.

Could I make a humble request to speed up the copy of the packages to OE so=
urce mirror?

We have a BSP layer that depends on this and currently our build is broken =
fetching crda.

-
Javier Viguera
Software Engineer


