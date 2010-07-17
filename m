Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=DB3EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Soumya.R@kpitcummins.com>) id 1Oa2H6-0002lj-Bl
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 09:57:42 +0200
Received: from mail1-db3-R.bigfish.com (10.3.81.246) by
	DB3EHSOBE006.bigfish.com (10.3.84.26) with Microsoft SMTP Server id
	8.1.436.0; Sat, 17 Jul 2010 07:42:19 +0000
Received: from mail1-db3 (localhost.localdomain [127.0.0.1])	by
	mail1-db3-R.bigfish.com (Postfix) with ESMTP id 0B0D4DA05CE	for
	<openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jul 2010 07:42:19 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VPS-6(zz14ffOzz1202hzzz32i2a8h67h)
Received: from mail1-db3 (localhost.localdomain [127.0.0.1]) by mail1-db3
	(MessageSwitch) id 1279352538936158_24362;
	Sat, 17 Jul 2010 07:42:18 +0000 (UTC)
Received: from DB3EHSMHS006.bigfish.com (unknown [10.3.81.247])	by
	mail1-db3.bigfish.com (Postfix) with ESMTP id E01FC151004E	for
	<openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jul 2010 07:42:18 +0000 (UTC)
Received: from Kcinpunhjhc01.kpit.com (203.197.93.240) by
	DB3EHSMHS006.bigfish.com (10.3.87.106) with Microsoft SMTP Server (TLS)
	id 14.0.482.44; Sat, 17 Jul 2010 07:42:18 +0000
Received: from Kcinpunhjcms01.kpit.com ([172.10.16.121]) by
	Kcinpunhjhc01.kpit.com ([172.10.16.123]) with mapi;
	Sat, 17 Jul 2010 13:12:15 +0530
From: Soumya R <Soumya.R@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 17 Jul 2010 13:11:56 +0530
Thread-Topic: Could not find dbus-daemon in our root file system
Thread-Index: AQHLJYOIsxMf5Pth8k+n7m0CigDS5A==
Message-ID: <76E258664B189C4CBEF125491CA11ECC9455F8DE76@KCINPUNHJCMS01.kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Reverse-DNS: Kcinpunhjhc01.kpit.com
X-SA-Exim-Connect-IP: 213.199.154.144
X-SA-Exim-Mail-From: Soumya.R@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Could not find dbus-daemon in our root file system
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
X-List-Received-Date: Sat, 17 Jul 2010 07:57:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,
   =

    I am working on openembedded form past few days for Au1350 mipsel archi=
tecture. I need to include
dbus-daemon where should i include this?. I have included dbus-deamon-proxy=
_git.bb in dbus in recipes and also
in task-qte-toolcain-target.bb..I have build a root file system and toolcha=
in from it.. But i could not find the dbus-deamon =

binary in our rfs.. Please suggest me if i am doing anything wrong..


Regards,
soumya =




