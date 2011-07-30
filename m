Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qn71k-0007MB-2z
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 12:44:16 +0200
Received: (qmail invoked by alias); 30 Jul 2011 10:39:57 -0000
Received: from p4FDF1F3D.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.31.61]
	by mail.gmx.net (mp052) with SMTP; 30 Jul 2011 12:39:57 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/ZtcodQPfZqU8Q42GOWFwUR9iRgw9W8/UzNEL4W7
	i40B83JwmJnjmM
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org,
	gumstix-users@lists.sourceforge.net
Date: Sat, 30 Jul 2011 12:42:40 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201107301242.41215.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: fakeroot 1.14.5 source is missing
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
X-List-Received-Date: Sat, 30 Jul 2011 10:44:16 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi guys,

I tried to build an image based on gumstix overo-2011 branch [1] but the sources 
for fakeroot 1.14.5 can not be downloaded.

ERROR: fakeroot-native-1.14.5: 
ftp://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.14.5.orig.tar.bz2 
cannot check archive integrity

In [2] I saw that it is it is not there ( anymore ? ).

As far as I can see we have the same issue in mainline oe 2011.03-maintenance.

[1] http://gitorious.org/gumstix-oe/mainline/commits/overo-2011.03
[2] ftp://ftp.debian.org/debian/pool/main/f/fakeroot/


