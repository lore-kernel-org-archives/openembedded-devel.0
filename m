Return-Path: <bevenson@melinkcorp.com>
Received: from pluto.melinkcorp.com (rrcs-98-100-91-244.central.biz.rr.com
	[98.100.91.244])
	by mail.openembedded.org (Postfix) with ESMTP id 90B126ADE5
	for <Openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2013 01:28:51 +0000 (UTC)
Received: from pluto.melinkcorp.local ([10.0.2.4]) by pluto.melinkcorp.local
	([10.0.2.4]) with mapi; Wed, 31 Jul 2013 21:28:52 -0400
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Jul 2013 21:28:50 -0400
Thread-Topic: opkg: How to make package signal reboot required?
Thread-Index: Ac6OVnoaZ2tgDVa8REWE0K13UR63bg==
Message-ID: <91586D499ADFD74FBCFB8425266A5DE40153ADA9D291@pluto.melinkcorp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 003D89D8004E40003D8B25
acceptlanguage: en-US
MIME-Version: 1.0
Subject: opkg: How to make package signal reboot required?
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
X-List-Received-Date: Thu, 01 Aug 2013 01:28:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All,

I have a package that I created for my setup which, when upgraded, will req=
uire a system reboot.  Is there a general flag/setting that already exists =
to put in my Bitbake recipe to signal that the package requires a reboot?  =
If so, does it just set a flag that a reboot is required or does it force a=
 reboot?

Regards,
Bryan


