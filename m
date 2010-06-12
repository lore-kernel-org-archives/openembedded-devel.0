Received: from bay0-omc1-s21.bay0.hotmail.com ([65.54.190.32])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1ONPhX-00049a-8m
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jun 2010 14:20:40 +0200
Received: from BAY127-W5 ([65.54.190.61]) by bay0-omc1-s21.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Sat, 12 Jun 2010 05:15:09 -0700
Message-ID: <BAY127-W5627AAFF624E9FC796B9DD8DA0@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: OSSIE Embedded Discussion <ossie-sca@opensdr.com>, OSSIE Discussion
	<ossie-discuss@listserv.vt.edu>, Openembedded Discussion
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 12 Jun 2010 18:15:09 +0600
Importance: Normal
In-Reply-To: <BAY127-W6E3019E386511CE8FD58FD8D90@phx.gbl>
References: <BAY127-W6E3019E386511CE8FD58FD8D90@phx.gbl>
MIME-Version: 1.0
X-OriginalArrivalTime: 12 Jun 2010 12:15:09.0996 (UTC)
	FILETIME=[E6F4BEC0:01CB0A28]
X-SA-Exim-Connect-IP: 65.54.190.32
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Error of Rootfs
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
X-List-Received-Date: Sat, 12 Jun 2010 12:20:40 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Actually when I bitbake ossie-demo and ossie-gpp-node seperately these are =
built successfully. But when I run bitbake console-image this error occurs.
where might be the problem
Saleh







OpenEmbedded is giving an error of not building root files system due to mi=
ssing dependency of gpp_node but the ipk package of gpp node is available i=
n /deploy/glibc/ipk/armv5te. I've attached the log file of rootfs from  /wo=
rk/dm6446-evm-angstrom-linux-gnueabi/console-image-1.0-r0/temp and packages=
.stamps  and stamps files from /deploy/glibc/ipk/armv5te to show ipkg packa=
ges available.

plz help me to diagnose this error.

Saleh
 		 	   		 =20
 		 	   		 =20
Your E-mail and More On-the-Go. Get Windows Live Hotmail Free. Sign up now.=
 		 	   		 =20
_________________________________________________________________
Hotmail: Trusted email with powerful SPAM protection.
https://signup.live.com/signup.aspx?id=3D60969=

