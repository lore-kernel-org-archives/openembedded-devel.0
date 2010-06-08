Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Soumya.R@kpitcummins.com>) id 1OLtMS-0000uV-PH
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 09:37:01 +0200
Received: from mail167-tx2-R.bigfish.com (10.9.14.237) by
	TX2EHSOBE006.bigfish.com (10.9.40.26) with Microsoft SMTP Server id
	8.1.340.0; Tue, 8 Jun 2010 07:17:10 +0000
Received: from mail167-tx2 (localhost.localdomain [127.0.0.1])	by
	mail167-tx2-R.bigfish.com (Postfix) with ESMTP id E04001A4020F	for
	<openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jun 2010 07:17:09 +0000 (UTC)
X-SpamScore: -17
X-BigFish: VPS-17(zz14e3M14ffO1443Nzz1202hzzz32i2a8h66h)
Received: from mail167-tx2 (localhost.localdomain [127.0.0.1]) by mail167-tx2
	(MessageSwitch) id 1275981429815145_1777;
	Tue,  8 Jun 2010 07:17:09 +0000 (UTC)
Received: from TX2EHSMHS009.bigfish.com (unknown [10.9.14.241])	by
	mail167-tx2.bigfish.com (Postfix) with ESMTP id BAEE816D004D	for
	<openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jun 2010 07:17:09 +0000 (UTC)
Received: from Kcinpunhjhc01.kpit.com (203.197.93.240) by
	TX2EHSMHS009.bigfish.com (10.9.99.109) with Microsoft SMTP Server (TLS)
	id 14.0.482.44; Tue, 8 Jun 2010 07:17:07 +0000
Received: from Kcinpunhjcms01.kpit.com ([169.254.1.87]) by
	Kcinpunhjhc01.kpit.com ([172.10.16.123]) with mapi;
	Tue, 8 Jun 2010 12:42:04 +0530
From: Soumya R <Soumya.R@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Jun 2010 12:42:04 +0530
Thread-Topic: ERROR: Please set the 'PERSISTENT_DIR
Thread-Index: AQHLBtnl2jol1/6BZkSbfu8G8eeZWw==
Message-ID: <76E258664B189C4CBEF125491CA11ECC9445E0CF93@KCINPUNHJCMS01.kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Reverse-DNS: Kcinpunhjhc01.kpit.com
X-SA-Exim-Connect-IP: 65.55.88.13
X-SA-Exim-Mail-From: Soumya.R@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: ERROR: Please set the 'PERSISTENT_DIR
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
X-List-Received-Date: Tue, 08 Jun 2010 07:37:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All ,

   I am getting the error while configuring the bitbake
[root@fedora12 bitbake-1.8.18]# bitbake nano
ERROR: Please set the 'PERSISTENT_DIR' or 'CACHE' variable.
I got the sources of the bitbake and gave following commands
python setup.py build
python setup.py install
 =20
  Please help me out to resolve this error..

Thanks in advance..

Regards,
Soumya=



