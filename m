Received: from goliath.siemens.de ([192.35.17.28])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1PSPn0-0001XX-Gd
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 08:59:15 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.12.11.20060308/8.12.11) with ESMTP id
	oBE7vdtT020954 for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 08:57:40 +0100
Received: from DEMCHP99ET1MSX.ww902.siemens.net
	(demchp99et1msx.ww902.siemens.net [139.25.131.180])
	by mail3.siemens.de (8.13.6/8.13.6) with ESMTP id oBE7vd6i015156
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 08:57:39 +0100
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.7]) by
	DEMCHP99ET1MSX.ww902.siemens.net ([139.25.131.180]) with mapi;
	Tue, 14 Dec 2010 08:57:39 +0100
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 14 Dec 2010 08:57:38 +0100
Thread-Topic: [oe] [PATCH] eglibc: use HTTP for svn checkout
Thread-Index: Acua6SC8dIj1oNtBTQe0jVZRVgK7VwAe0WMw
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819ED3B95194@DEMCHP99E35MSX.ww902.siemens.net>
References: <4D065431.6080304@dell.com>
In-Reply-To: <4D065431.6080304@dell.com>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.35.17.28
X-SA-Exim-Mail-From: Fabrice.Aeschbacher@siemens.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc: use HTTP for svn checkout
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Dec 2010 07:59:15 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Agreed; this is a change I have to do manually every time

Regards,
  Fabrice

-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded=
-devel-bounces@lists.openembedded.org] Im Auftrag von Ryan D Phillips
Gesendet: Montag, 13. Dezember 2010 18:13
An: openembedded-devel@lists.openembedded.org
Betreff: [oe] [PATCH] eglibc: use HTTP for svn checkout

  SVN over HTTP is a more reliable transport for developers behind=20
restrictive
proxies.

Regards,
Ryan


