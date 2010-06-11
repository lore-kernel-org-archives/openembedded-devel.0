Received: from bay0-omc4-s16.bay0.hotmail.com ([65.54.190.218])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1ON53G-0003bs-NY
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jun 2010 16:17:44 +0200
Received: from BAY127-W25 ([65.54.190.199]) by bay0-omc4-s16.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 11 Jun 2010 07:12:14 -0700
Message-ID: <BAY127-W25B7597F9749355FAD8493D8D90@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: OSSIE Discussion <ossie-discuss@listserv.vt.edu>, OSSIE Embedded
	Discussion <ossie-sca@opensdr.com>, Openembedded Discussion
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Jun 2010 20:12:14 +0600
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 11 Jun 2010 14:12:14.0519 (UTC)
	FILETIME=[177C2470:01CB0970]
X-SA-Exim-Connect-IP: 65.54.190.218
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Error of Rootfs
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
X-List-Received-Date: Fri, 11 Jun 2010 14:17:45 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


OpenEmbedded is giving an error of not building root files system due to mi=
ssing dependency of gpp_node but the ipk package of gpp node is available i=
n /deploy/glibc/ipk/armv5te. I've attached the log file of rootfs from  /wo=
rk/dm6446-evm-angstrom-linux-gnueabi/console-image-1.0-r0/temp and packages=
.stamps  and stamps files from /deploy/glibc/ipk/armv5te to show ipkg packa=
ges available.

plz help me to diagnose this error.

Saleh
 		 	   		 =20
_________________________________________________________________
Hotmail: Free=2C trusted and rich email service.
https://signup.live.com/signup.aspx?id=3D60969=

