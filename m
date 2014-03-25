Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 929306F897
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2014 07:36:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,726,1389740400"; d="scan'208";a="43235321"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 25 Mar 2014 08:36:06 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Tue, 25 Mar 2014 08:36:06 +0100
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.243]) by
	COSNADEXC12.usr.ingenico.loc ([10.31.4.212]) with mapi id
	14.02.0328.009; Tue, 25 Mar 2014 08:36:06 +0100
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] terminus-font: add new recipe for
	version	4.38
Thread-Index: AQHPRGLJRRV/Y8K3U0ueIIoAGc5gF5rv3uEwgACQ54CAAQCOMA==
Date: Tue, 25 Mar 2014 07:36:05 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B5754E493@COSNADEXC13.usr.ingenico.loc>
References: <1395313904-6600-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<CAMKF1sqxERqVRbKkSfz1eJ4s_8WiWLbpK10RHpvBdRzfi7e5FQ@mail.gmail.com>
	<8672BB614B4CCA40A6B3BDD6FD82050B5754DF69@COSNADEXC13.usr.ingenico.loc>
	<CAMKF1so5GBMH7JehZ1wRt7A+x12_zr7yDEsUS_uPngn7JnfipQ@mail.gmail.com>
In-Reply-To: <CAMKF1so5GBMH7JehZ1wRt7A+x12_zr7yDEsUS_uPngn7JnfipQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] terminus-font: add new recipe for version	4.38
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
X-List-Received-Date: Tue, 25 Mar 2014 07:36:13 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

> ?=3D is better fit here.
It's because there is only one option ?

Do you want me to repost patch?
The problem is that it is already on meta-openembedded git master-next bran=
ch.

Matthieu


-----Message d'origine-----
De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedd=
ed-devel-bounces@lists.openembedded.org] De la part de Khem Raj
Envoy=E9=A0: lundi 24 mars 2014 18:16
=C0=A0: openembeded-devel
Objet=A0: Re: [oe] [meta-oe][PATCH] terminus-font: add new recipe for versi=
on 4.38

On Mon, Mar 24, 2014 at 12:38 AM, Matthieu CRAPET <Matthieu.CRAPET@ingenico=
.com> wrote:
> Most recipes are using ??=3D and not ?=3D
> What is a best way?

?=3D is better fit here.
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

