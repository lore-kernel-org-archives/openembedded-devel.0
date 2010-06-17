Received: from bay0-omc4-s8.bay0.hotmail.com ([65.54.190.210])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1OPGXc-0004B0-L6
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 16:58:17 +0200
Received: from BAY127-W21 ([65.54.190.199]) by bay0-omc4-s8.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 17 Jun 2010 07:52:23 -0700
Message-ID: <BAY127-W21A25D95A66DE95723B147D8DF0@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Jun 2010 20:52:22 +0600
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 17 Jun 2010 14:52:23.0497 (UTC)
	FILETIME=[B1D38390:01CB0E2C]
X-SA-Exim-Connect-IP: 65.54.190.210
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Error of Rootfs for console-image
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
X-List-Received-Date: Thu, 17 Jun 2010 14:58:17 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


OpenEmbedded is giving an error of not building root files system due to mi=
ssing dependency of gpp_node
for ossie_demo as shown in attached log file.
When I bitbake ossie-demo and ossie-gpp-node seperately these are built suc=
cessfully. Error occurs when
I run bitbake console-image.

where might be the problem ? Plz help me to diagnose this error.

Saleh 		 	   		 =20
_________________________________________________________________
Hotmail: Free=2C trusted and rich email service.
https://signup.live.com/signup.aspx?id=3D60969=

