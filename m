Received: from bay0-omc4-s21.bay0.hotmail.com ([65.54.190.223])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1Oe81g-0006Fu-Fm
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 16:54:33 +0200
Received: from BAY127-W2 ([65.54.190.199]) by bay0-omc4-s21.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 28 Jul 2010 07:54:12 -0700
Message-ID: <BAY127-W2DE0FDEACF7F8948D3BC7D8A80@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Jul 2010 20:54:12 +0600
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 28 Jul 2010 14:54:12.0145 (UTC)
	FILETIME=[BD85A210:01CB2E64]
X-SA-Exim-Connect-IP: 65.54.190.223
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: kernel for DM6446
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
X-List-Received-Date: Wed, 28 Jul 2010 14:54:34 -0000
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


I am bitbaking linux davinci recipe in openembedded to build a just kernel =
image for DM6446. Weather this is the suitable recipe for this?
Also it is giving an error of permission denied to /root as shown in termin=
al log. how I may remove this error? plz help.

[Saleh@localhost root]$ bitbake linux-davinci
NOTE: Handling BitBake files: \ (0004/8169) [ 0 %]ERROR: [Errno 13] Permiss=
ion denied: '/root' while parsing /sdr/openembedded/recipes/oprofile/oprofi=
leui_svn.bb
NOTE: Handling BitBake files: - (8169/8169) [100 %]
NOTE: Parsing finished. 7530 cached=2C 308 parsed=2C 330 skipped=2C 0 maske=
d.
ERROR: Parsing errors found=2C exiting...
[Saleh@localhost root]$=20


Saleh
 		 	   		 =20
_________________________________________________________________
Hotmail: Trusted email with Microsoft=92s powerful SPAM protection.
https://signup.live.com/signup.aspx?id=3D60969=

