Received: from [89.151.113.230] (helo=srv02.nortechonline.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Simon.Hodgson@nortechonline.co.uk>)
	id 1N5mDD-0006fu-Vv for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 21:12:15 +0100
Received: from srv02.nortechonline.net ([89.151.113.230]) by
	srv02.nortechonline.net ([89.151.113.230]) with mapi; Wed, 4 Nov 2009
	20:11:13 +0000
From: "Hodgson, Simon" <Simon.Hodgson@nortechonline.co.uk>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Nov 2009 20:11:13 +0000
Thread-Topic: Mono
Thread-Index: AQHKXYr0Ncl4ki06WU+HLcJbWhvlHA==
Message-ID: <B44D4D5BF344094DABB900C4E0F6E3533945A88B7F@srv02.nortechonline.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 89.151.113.230
X-SA-Exim-Mail-From: Simon.Hodgson@nortechonline.co.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Mono
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
X-List-Received-Date: Wed, 04 Nov 2009 20:12:15 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I've built Mono for OpenEmbedded to run on an arm processor. But when I try=
 to run just a simple Hello World test I get:=20

mini-codegen.c:1073:mono_local_regalloc: assertion failed: (ins->dreg !=3D =
-1)=20

Does anyone have any suggestion as to what I might be doing wrong?=20

mono -V produces:
root@at91sam9g20ek:~# mono -V
Mono JIT compiler version 2.4.2.3 (tarball Tue Nov  3 03:08:58 EST 2009)
Copyright (C) 2002-2008 Novell, Inc and Contributors. www.mono-project.com
        TLS:           normal
        GC:            Included Boehm (with typed GC)
        SIGSEGV:       normal
        Notifications: epoll
        Architecture:  armel,vfp
        Disabled:      none

Is there anymore info perhaps I can provide?

Thanks=20


Simon=


