Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 79A766E7AD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 09:43:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.95,735,1384297200"; d="scan'208";a="40158886"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 28 Jan 2014 10:43:26 +0100
Received: from COSNADEXC11.usr.ingenico.loc (10.31.4.211) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Tue, 28 Jan 2014 10:43:26 +0100
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.243]) by
	COSNADEXC11.usr.ingenico.loc ([10.31.4.211]) with mapi id
	14.02.0328.009; Tue, 28 Jan 2014 10:43:26 +0100
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [RFC PATCHv3] bash-completion: add recipe
Thread-Index: AQHO+krB3nitn5j92EWlZIS0hGdanZqaIoyg
Date: Tue, 28 Jan 2014 09:43:25 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B5753B953@COSNADEXC13.usr.ingenico.loc>
References: <1387189897-2627-1-git-send-email-Matthieu.Crapet@ingenico.com>
In-Reply-To: <1387189897-2627-1-git-send-email-Matthieu.Crapet@ingenico.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [RFC PATCHv3] bash-completion: add recipe
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
X-List-Received-Date: Tue, 28 Jan 2014 09:43:47 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

PARALLEL_MAKE =3D ""

seems required (something is wrong with "symlinks" make rule, in completion=
s directory).

Cheers,
Matthieu


