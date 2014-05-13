Return-Path: <alexandre.fournier@kiplink.fr>
Received: from webmail.wisp-e.com (unknown [212.83.147.100])
	by mail.openembedded.org (Postfix) with ESMTP id 230E260196
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 09:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by webmail.wisp-e.com (Postfix) with ESMTP id 428CC1A15A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 11:01:32 +0200 (CEST)
Received: from webmail.wisp-e.com ([127.0.0.1])
	by localhost (webmail.wisp-e.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id lzxnpDaoyjHO
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 11:01:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by webmail.wisp-e.com (Postfix) with ESMTP id B50C21A15EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 11:01:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at wisp-e.com
Received: from webmail.wisp-e.com ([127.0.0.1])
	by localhost (webmail.wisp-e.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Jjc-WKQfxVvO
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 11:01:31 +0200 (CEST)
Received: from webmail.wisp-e.com (localhost [127.0.0.1])
	by webmail.wisp-e.com (Postfix) with ESMTP id A1DBC1A15A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 11:01:31 +0200 (CEST)
Date: Tue, 13 May 2014 11:01:31 +0200 (CEST)
From: Alexandre FOURNIER <alexandre.fournier@kiplink.fr>
To: openembedded-devel@lists.openembedded.org
Message-ID: <679158182.7138296.1399971691632.JavaMail.zimbra@kiplink.fr>
In-Reply-To: <CAMKF1soW7Do399pYg+TwNDDOn5PLHOpxrdpo0gx4Nc3yW-MW9g@mail.gmail.com>
References: <1399908925-9351-1-git-send-email-alexandre.fournier@kiplink.fr>
	<CAMKF1soW7Do399pYg+TwNDDOn5PLHOpxrdpo0gx4Nc3yW-MW9g@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.200.62]
X-Mailer: Zimbra 8.0.7_GA_6021 (ZimbraWebClient - GC32 (Linux)/8.0.7_GA_6021)
Thread-Topic: net-snmp: install net-snmp-config script to STAGING_BINDIR_CROSS
Thread-Index: LVTFPy+Qct1uDx5tuJkMyoqMJtPZmw==
Subject: Re: [meta-oe][PATCH] net-snmp: install net-snmp-config script	to STAGING_BINDIR_CROSS
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
X-List-Received-Date: Tue, 13 May 2014 09:01:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for your feedback Raj,

Reposted a new version of this patch.

--=20
Alexandre Fournier

----- Mail original -----
De: "Khem Raj" <raj.khem@gmail.com>
=C3=80: "openembeded-devel" <openembedded-devel@lists.openembedded.org>
Envoy=C3=A9: Lundi 12 Mai 2014 18:29:28
Objet: Re: [oe] [meta-oe][PATCH] net-snmp: install net-snmp-config script=
=09to STAGING_BINDIR_CROSS

On Mon, May 12, 2014 at 8:35 AM, Alexandre Fournier
<alexandre.fournier@kiplink.fr> wrote:
> -PR =3D "r1"
> +PR =3D "r2"

not needed.
--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

