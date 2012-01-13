Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Rlb0r-0006sN-Qu
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jan 2012 07:53:22 +0100
Received: (qmail invoked by alias); 13 Jan 2012 06:45:49 -0000
Received: from p5B0A1969.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.25.105]
	by mail.gmx.net (mp008) with SMTP; 13 Jan 2012 07:45:49 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19mzdIXYLdmwU7VkLsHyR3OByv7tPqXMPzaq0Y4Bm
	oV2qVJvHCn1gX1
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jan 2012 07:46:58 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201201130746.59009.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-mozilla] configure error
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
X-List-Received-Date: Fri, 13 Jan 2012 06:53:22 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

FYI: after last update I wanted to give firefox a try and got

| checking for cairo-tee >= 1.10... Package cairo-tee was not found in the pkg-
config search path. Perhaps you should add the directory containing `cairo-
tee.pc' to the PKG_CONFIG_PATH environment variable No package 'cairo-tee' found
| configure: error: Library requirements (cairo-tee >= 1.10) not met; consider 
adjusting the PKG_CONFIG_PATH environment variable if your libraries are in a 
nonstandard prefix so pkg-config can find them.
| *** Fix above errors and then restart with               "make -f client.mk 
build"
| make[2]: *** [configure] Error 1

Andreas


