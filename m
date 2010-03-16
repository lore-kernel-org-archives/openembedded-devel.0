Received: from exchsrvr.syntech-fuelmaster.com ([199.44.250.2]
	helo=courier.syntech-fuelmaster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mbutsch@syntech-fuelmaster.com>) id 1NrdZo-0002UL-Dd
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 21:41:26 +0100
Received: from Courier.syntech.org ([fe80::f1e9:ec58:2caf:f234]) by
	Courier.syntech.org ([fe80::f1e9:ec58:2caf:f234%14]) with mapi;
	Tue, 16 Mar 2010 16:37:55 -0400
From: Mark Butsch <mbutsch@syntech-fuelmaster.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Mar 2010 16:37:54 -0400
Thread-Topic: need help with "Couldn't find shared library provider for ..."
Thread-Index: AcrFSIulEg3rteJPRxOj2ykWQ/vTAA==
Message-ID: <6C2434209962DC46B88345CA85C334A285DAA67688@Courier.syntech.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 199.44.250.2
X-SA-Exim-Mail-From: mbutsch@syntech-fuelmaster.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: need help with "Couldn't find shared library provider for ..."
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
X-List-Received-Date: Tue, 16 Mar 2010 20:41:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am getting the following Note when building my code:

NOTE: Running task 469 of 474 (ID: 10, /home/ad/mbutsch/phytec-mx27/com.syn=
tech/recipes/aposd-ecd/aposd-ecd.bb, do_qa_staging)
NOTE: Couldn't find shared library provider for libfipscrypto.so

I googled for this and the suggestions where to include a "PROVIDES =3D" in=
 my recipe, but that doesn't make the Note go away.

Can anyone provide me with the magic words to put in my recipe?

Thanks,

Mark


