Received: from bay0-omc4-s3.bay0.hotmail.com ([65.54.190.205])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1OM0Rs-0006NW-3J
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 17:11:06 +0200
Received: from BAY127-W23 ([65.54.190.199]) by bay0-omc4-s3.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 8 Jun 2010 08:05:15 -0700
Message-ID: <BAY127-W2325648E02B2D81BA370B0D8D60@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Jun 2010 21:05:14 +0600
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 08 Jun 2010 15:05:15.0677 (UTC)
	FILETIME=[005D14D0:01CB071C]
X-SA-Exim-Connect-IP: 65.54.190.205
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: path error in bitbake file
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
X-List-Received-Date: Tue, 08 Jun 2010 15:11:46 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


I want to give a path of a directory /sdr/GPP_node in bitbake recipe in whi=
ch source files are placed. I did this as=20

SRC_URI =3D "/sdr=3Bmodule=3DGPP_node"

But it is showing error as shown below. kindly tell me the exact format for=
 this path.


NOTE: Running task 1783 of 3200 (ID: 1081=2C /sdr/ossie_collection/packages=
/ossie-nodes/ossie-gpp-node_svn.bb=2C do_fetch)
NOTE: Task failed: Malformed URL: /sdr=3Bmodule=3DGPP_node
ERROR: TaskFailed event exception=2C aborting
ERROR: Build of /sdr/ossie_collection/packages/ossie-nodes/ossie-gpp-node_s=
vn.bb do_fetch failed
ERROR: Task 1081 (/sdr/ossie_collection/packages/ossie-nodes/ossie-gpp-node=
_svn.bb=2C do_fetch) failed
NOTE: Tasks Summary: Attempted 1782 tasks of which 1782 didn't need to be r=
erun and 1 failed.
ERROR: '/sdr/ossie_collection/packages/ossie-nodes/ossie-gpp-node_svn.bb' f=
ailed


Saleh
 		 	   		 =20
_________________________________________________________________
Hotmail: Trusted email with powerful SPAM protection.
https://signup.live.com/signup.aspx?id=3D60969=

