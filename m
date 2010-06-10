Received: from outbound-va3.frontbridge.com ([216.32.180.16]
	helo=VA3EHSOBE010.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Soumya.R@kpitcummins.com>) id 1OMb3u-0002Kl-AP
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 08:16:24 +0200
Received: from mail174-va3-R.bigfish.com (10.7.14.239) by
	VA3EHSOBE010.bigfish.com (10.7.40.12) with Microsoft SMTP Server id
	8.1.340.0; Thu, 10 Jun 2010 05:56:52 +0000
Received: from mail174-va3 (localhost.localdomain [127.0.0.1])	by
	mail174-va3-R.bigfish.com (Postfix) with ESMTP id A2204198030D	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 05:56:52 +0000 (UTC)
X-SpamScore: -17
X-BigFish: VPS-17(zz14e3M14ffO1443Nzz1202hzzz32i2a8h65h)
Received: from mail174-va3 (localhost.localdomain [127.0.0.1]) by mail174-va3
	(MessageSwitch) id 1276149409409141_3427;
	Thu, 10 Jun 2010 05:56:49 +0000 (UTC)
Received: from VA3EHSMHS015.bigfish.com (unknown [10.7.14.245])	by
	mail174-va3.bigfish.com (Postfix) with ESMTP id 7407970059	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 05:56:48 +0000 (UTC)
Received: from Kcinpunhjhc01.kpit.com (203.197.93.240) by
	VA3EHSMHS015.bigfish.com (10.7.99.25) with Microsoft SMTP Server (TLS)
	id 14.0.482.44; Thu, 10 Jun 2010 05:56:47 +0000
Received: from Kcinpunhjcms01.kpit.com ([169.254.1.87]) by
	Kcinpunhjhc01.kpit.com ([172.10.16.123]) with mapi;
	Thu, 10 Jun 2010 11:26:43 +0530
From: Soumya R <Soumya.R@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Jun 2010 11:26:42 +0530
Thread-Index: AQHLCGGz8zU1XSsLuE+dZUfd97FOiQ==
Message-ID: <76E258664B189C4CBEF125491CA11ECC9445E0CF9F@KCINPUNHJCMS01.kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Reverse-DNS: Kcinpunhjhc01.Kpit.com
X-SA-Exim-Connect-IP: 216.32.180.16
X-SA-Exim-Mail-From: Soumya.R@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=AWL, BAYES_00, MISSING_SUBJECT,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
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
X-List-Received-Date: Thu, 10 Jun 2010 06:16:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,
=20
     I am using ubuntu 10.4 LTS and i am trying to build my own customized =
image
for mipsel.. When i run bitbake avn-image i get the following error.

cp: cannot stat `/home/likewise-open/KPIT/soumyar/openembedded/recipes/pyth=
on/python-native-2.6.4/05-enable-ctypes-cross-build.patch': No such file or=
 directory
NOTE: Task failed:=20
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/likewise-open/KPIT/soumyar/openembedded/recipes/pytho=
n/python-native_2.6.4.bb do_unpack failed
ERROR: Task 749 (/home/likewise-open/KPIT/soumyar/openembedded/recipes/pyth=
on/python-native_2.6.4.bb, do_unpack) failed
NOTE: Waiting for 3 active tasks to finish

  I am unable to tar Python-2.6.4.tar.bz2 by using the command=20
tar -zxvf Python-2.6.4.tar.bz2
gzip: stdin: not in gzip format
tar: Child returned status 1
tar: Exiting with failure status due to previous errors
 =20
   so i downgraded the gzip but still the same error.. If anybody got the s=
ame error and resolved it please help me out.. I am stuck here:-(


Thanks in advance :-)

Regards,
Soumya



 =20



