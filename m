Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Soumya.R@kpitcummins.com>) id 1OLuOI-00024F-6o
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 10:42:38 +0200
Received: from mail104-tx2-R.bigfish.com (10.9.14.242) by
	TX2EHSOBE003.bigfish.com (10.9.40.23) with Microsoft SMTP Server id
	8.1.340.0; Tue, 8 Jun 2010 08:23:05 +0000
Received: from mail104-tx2 (localhost.localdomain [127.0.0.1])	by
	mail104-tx2-R.bigfish.com (Postfix) with ESMTP id 8D9A61B70419	for
	<openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jun 2010 08:23:05 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VPS-12(zz14ffO1443Nzz1202hzzz32i27ah2a8h43h63h)
Received: from mail104-tx2 (localhost.localdomain [127.0.0.1]) by mail104-tx2
	(MessageSwitch) id 1275985385425148_15835;
	Tue,  8 Jun 2010 08:23:05 +0000 (UTC)
Received: from TX2EHSMHS043.bigfish.com (unknown [10.9.14.254])	by
	mail104-tx2.bigfish.com (Postfix) with ESMTP id 5A671A3804F	for
	<openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jun 2010 08:23:05 +0000 (UTC)
Received: from kcinpunhjhc02.kpit.com (220.225.38.51) by
	TX2EHSMHS043.bigfish.com (10.9.99.143) with Microsoft SMTP Server (TLS)
	id 14.0.482.44; Tue, 8 Jun 2010 08:23:04 +0000
Received: from Kcinpunhjcms01.kpit.com ([169.254.1.87]) by
	kcinpunhjhc02.kpit.com ([172.10.16.124]) with mapi;
	Tue, 8 Jun 2010 13:53:00 +0530
From: Soumya R <Soumya.R@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Jun 2010 13:52:58 +0530
Thread-Index: AQHLBuPN1GgdANJZ4EqkHHwMCWteBQ==
Message-ID: <76E258664B189C4CBEF125491CA11ECC9445E0CF95@KCINPUNHJCMS01.kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Bypass-Agent: EF-1;
X-Reverse-DNS: unknown
X-SA-Exim-Connect-IP: 65.55.88.12
X-SA-Exim-Mail-From: Soumya.R@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=AWL, BAYES_00, MISSING_SUBJECT,
	RCVD_IN_DNSWL_LOW autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: (No subject)
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
X-List-Received-Date: Tue, 08 Jun 2010 08:42:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,
     =20
     I get the following error when I run bitbake avn-image

NOTE: Handling BitBake files: \ (0172/0172) [100 %]
NOTE: Parsing finished. 163 cached, 7 parsed, 2 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
ERROR: '['/home/likewise-open/KPIT/soumyar/openembedded/recipes/glibc/glibc=
_2.10.1.bb']' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity=
 'linux-libc-headers-dev' but it wasn't found in any PACKAGE or RPROVIDES v=
ariables
NOTE: Runtime target 'linux-libc-headers-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['linux-libc-headers-dev']
ERROR: Required build target 'avn-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['avn-image', 'opkg-native', '=
gnu-config-native']

               How do I resolve this error?? Any suggestions is badly neede=
d..

Thanks in advance

Regards,
Soumya





