Return-Path: <amery@hanoverdisplays.com>
X-Greylist: delayed 310 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 31 May 2017 10:36:44 UTC
Received: from mail.hanoverdisplays.com (mail.hanoverdisplays.com [62.7.92.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6215F72F96
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 May 2017 10:36:44 +0000 (UTC)
Received: from MAILDB.hanover.local ([fe80::6c2c:e4ad:bf0a:351d]) by
	mail.hanover.local ([fe80::1440:163c:a37d:4312%11]) with mapi id
	14.03.0319.002; Wed, 31 May 2017 11:31:35 +0100
From: Alejandro Mery <amery@hanoverdisplays.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 00/03] morty pull request
Thread-Index: AdLZ+ROzg0wmUBI8SkuTatGM2yEjKg==
Date: Wed, 31 May 2017 10:31:34 +0000
Message-ID: <CF323D845261FD4F9B1E997381250334E33743BF@maildb.hanover.local>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.207]
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 00/03] morty pull request
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 May 2017 10:36:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please consider these commits cherry-picked from master for morty:=0A=
=0A=
fc801961457fe2fbb24973bb43b302ad46044cb8 devmem2: Change source URL to=0A=
regain access to it=0A=
6c584374a599f6f8d3607f20ecfc13a67ccf1da1 devmem2: use different filename=0A=
to avoid checksum conflicts=0A=
b17bbbe2245f72144e3d036aa273c1b67434fa1c gitver: fix try/except syntax=0A=
for python3 support=0A=
=0A=
=0A=
The following changes since commit fe5c83312de11e80b85680ef237f8acb04b4b26e=
:=0A=
=0A=
  libdnet: Update SRC_URI to fix checksum errors (2017-02-28 11:37:51 -0500=
)=0A=
=0A=
are available in the git repository at:=0A=
=0A=
  https://github.com/amery/meta-openembedded amery/morty=0A=
=0A=
for you to fetch changes up to 077fa5dfcb10c153e726caefb37385b1eb9fb270:=0A=
=0A=
  gitver: fix try/except syntax for python3 support (2017-05-26 17:14:23=0A=
+0100)=0A=
=0A=
----------------------------------------------------------------=0A=
Alejandro Mery (1):=0A=
      gitver: fix try/except syntax for python3 support=0A=
=0A=
Denys Dmytriyenko (1):=0A=
      devmem2: use different filename to avoid checksum conflicts=0A=
=0A=
Nicolas Ferre (1):=0A=
      devmem2: Change source URL to regain access to it=0A=
=0A=
 meta-oe/classes/gitver.bbclass             |  4 ++--=0A=
 meta-oe/recipes-support/devmem2/devmem2.bb | 12 ++++++++----=0A=
 2 files changed, 10 insertions(+), 6 deletions(-)=0A=

