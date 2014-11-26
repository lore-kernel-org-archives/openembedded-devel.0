Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.112])
	by mail.openembedded.org (Postfix) with ESMTP id 7BFD472051
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 08:43:19 +0000 (UTC)
Received: from [216.82.254.195] by server-16.bemta-7.messagelabs.com id
	31/A1-02697-FE095745; Wed, 26 Nov 2014 08:35:59 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-6.tower-200.messagelabs.com!1416990958!21707769!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.12.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2264 invoked from network); 26 Nov 2014 08:35:58 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-6.tower-200.messagelabs.com with RC4-SHA encrypted SMTP;
	26 Nov 2014 08:35:58 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.377.0;
	Wed, 26 Nov 2014 02:35:47 -0600
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Wed, 26 Nov 2014 02:35:57 -0600
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0210.002;
	Wed, 26 Nov 2014 09:35:55 +0100
From: "Viguera, Javier" <Javier.Viguera@digi.com>
To: 'akuster' <akuster@mvista.com>
Thread-Topic: [oe] [meta-oe][master][dizzy]PATCH] xserver-common: disable
	TCP connections
Thread-Index: AQHQCPTJoD3J6OeHMEqp8QNr0I+5kJxylaxg
Date: Wed, 26 Nov 2014 08:35:55 +0000
Message-ID: <DA8287CC96892A4EB4FCF4FB3FBDA1AB08E243@dor-sms-xch01.digi.com>
References: <1416939435-30118-1-git-send-email-javier.viguera@digi.com>
	<5474F112.2080505@mvista.com>
In-Reply-To: <5474F112.2080505@mvista.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.189]
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean
MIME-Version: 1.0
Cc: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][master][dizzy]PATCH] xserver-common: disable TCP connections
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
X-List-Received-Date: Wed, 26 Nov 2014 08:43:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Armin

> -----Original Message-----
> From: akuster [mailto:akuster@mvista.com]
> Sent: Tuesday, November 25, 2014 10:14 PM
> To: Viguera, Javier
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][master][dizzy]PATCH] xserver-common:
> disable TCP connections
>=20
> Javier,
>=20
> What is the disposition of the patch?
>=20
> There is a recommend format, see:
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_
> Header_Recommendations
>=20
> please resubmit once correct.
>=20
> regards,
> - Armin

Resubmitted with 'upstream-status' as V2.

-- jviguera

