Received: from tritech.se ([91.191.137.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1QgyaN-0005sk-9G
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jul 2011 14:30:39 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p6DCGOXt014407
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2011 14:16:29 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Wed, 13 Jul 2011 14:16:25 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Unwanted dependency on X from ppp
Thread-Index: AcxBVadKX3oznpENRgmgOmmUfA9rmg==
Date: Wed, 13 Jul 2011 12:16:24 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C06B114@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Unwanted dependency on X from ppp
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
X-List-Received-Date: Wed, 13 Jul 2011 12:30:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Everyone!

I'm building a small "headless" embedded system with OE and the Angstrom di=
stro. A normal rootfs build consists of about 1500 tasks. Everything fine s=
o far.

Now I wanted to include the ppp daemon in my build and thus just added "ppp=
" to IMAGE_INSTALL. Suddenly the rootfs build is about 4000 tasks and a lot=
 of X/display related stuff is downloaded and built. I fail to see the conn=
ection.

I'm afraid I'm not using the latest trunk or release of OE but any suggesti=
ons or directions on how to find/eliminate the cause of the problem would b=
e greatly appreciated!

Best Regards,
Mats


