Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 01CBF65F62
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 06:49:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,995,1389740400"; d="scan'208";a="50744338"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 06 May 2014 08:49:51 +0200
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.236]) by
	COSNADEXC22.usr.ingenico.loc ([10.31.4.222]) with mapi id
	14.02.0318.001; Tue, 6 May 2014 08:49:51 +0200
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] tk: cleanup
Thread-Index: AQHPaH84n1I5g4ZIO0yL47tzeoPgZJszGb1w
Date: Tue, 6 May 2014 06:49:50 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B8D34349D@COSNADEXC13.usr.ingenico.loc>
References: <1399305083-21507-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<20140505162916.GL2486@jama>
In-Reply-To: <20140505162916.GL2486@jama>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] tk: cleanup
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
X-List-Received-Date: Tue, 06 May 2014 06:49:52 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

> Does it also fix the tk issues which were shown in all world build report=
s?

I'm afraid not. That was my primary objective, but I was unable to reproduc=
e the issue (even with insane PARALLEL_MAKE parameter).
It's quite cosmetics, but the BINCONFIG_GLOB/SSTATE_SCAN_FILES fix is worth=
 it.

Regards,
M

