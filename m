Received: from [195.234.128.72] (helo=scotty.chl-informatik.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <christopher.lang@chl-informatik.de>)
	id 1GN9GB-0002CG-Eq
	for openembedded-devel@openembedded.org; Tue, 12 Sep 2006 16:29:11 +0200
Received: from linux64.chl-informatik.de (linux64.chl-informatik.de
	[192.168.10.17])
	by scotty.chl-informatik.de (8.12.3/8.12.3/SuSE Linux 0.6) with ESMTP
	id k8CDa4VR015854 for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2006 15:36:05 +0200
From: Christopher Lang <christopher.lang@chl-informatik.de>
To: openembedded-devel@openembedded.org
Date: Tue, 12 Sep 2006 16:30:39 +0200
User-Agent: KMail/1.9.1
MIME-Version: 1.0
Message-Id: <200609121630.39520.christopher.lang@chl-informatik.de>
X-Mailman-Approved-At: Tue, 12 Sep 2006 16:49:04 +0200
Subject: relative paths in Openembedded/bitbake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Sep 2006 14:29:11 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


=46rom what I can see all paths in OE/bitbake are absolute paths. This make=
s it=20
difficult to move an OE build directory to another location.

Questions:

=2D which paths in which files do I need to change to move an entire build=
=20
directory? (conf files of course, any other files?)

=2D Is it possible to set up an OE build directory based on relative paths?

=2D If the 2nd question was answered with no, are there any plans to enable=
=20
OE/bitbake to be able to handle an entire build directory with relative=20
paths?

many thanks

Chris



