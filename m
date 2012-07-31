Received: from mx02.stofanet.dk ([212.10.10.12])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <sgh@sgh.dk>)
	id 1SwLSp-0007Fu-Sv for openembedded-devel@lists.openembedded.org;
	Wed, 01 Aug 2012 01:02:56 +0200
Received: from 5634f1b4.rev.stofanet.dk ([86.52.241.180] helo=asrock)
	by mx03.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1SwKgi-0000XL-1z
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Aug 2012 00:13:12 +0200
Received: from koontz.localnet (sgh.sgh.dk [192.168.0.23])
	by asrock (Postfix) with ESMTPS id 281837ED62
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2012 00:13:12 +0200 (CEST)
From: =?ISO-8859-1?Q?S=F8ren?= Holm <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 01 Aug 2012 00:13:11 +0200
Message-ID: <19763872.0k6beRVpJp@koontz>
User-Agent: KMail/4.9 beta2 (Linux/3.5.0-6-generic; KDE/4.8.90; i686; ; )
MIME-Version: 1.0
Subject: QA-error when compiling boost
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
X-List-Received-Date: Tue, 31 Jul 2012 23:02:57 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi=20

I'm having difficulties compiling boost on a 64 bit machine. I get this=
 QA error

http://pastebin.com/eDRHiXXv

The weird thing is that  my OE-core configuration is  setup by oe-init-=
build-
env so I would guess anyone compiling for qemux86 on a 64 bit machine w=
ould=20
get this error. On a 32 bit machine it would problably not fail - at le=
ast not=20
because of architecture.

BJAM has never been a friend of mine, so I hope you can help out.

--=20
S=F8ren Holm


