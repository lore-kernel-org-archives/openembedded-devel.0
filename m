Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JWF20-0004up-8S
	for openembedded-devel@openembedded.org; Mon, 03 Mar 2008 19:04:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m23I3js7011160
	for <openembedded-devel@openembedded.org>; Mon, 3 Mar 2008 18:03:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11064-03 for <openembedded-devel@openembedded.org>;
	Mon,  3 Mar 2008 18:03:41 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m23I3bvw011148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 3 Mar 2008 18:03:37 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Mon, 03 Mar 2008 18:03:36 +0000
Message-Id: <1204567416.9002.5.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	m23I3js7011160
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Poky Version 3.1 (Pinky) Released
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Mar 2008 18:05:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I thought I'd mention the new Poky release (Pinky 3.1) here in case
anyone is interested. The release notes follow.

This release has seen many major improvements to the core of the build
system and in the usability of Poky output as a development environment.

A quick summary of the major changes is:

 * Development of Anjuta integration with Poky=E2=80=99s SDK and QEMU, ma=
king=20
   cross development of applications simple.
 * Addition of a users manual.
 * New machine support: Compulab EM-X270, Zylonite, Freescale MX31ADS,=20
   Phytec PhyCORE-iMX31, Logic iMX31 Lite and the HTC Universal=20
   (experimental).
 * Improved existing machine support, particularly the experimental=20
   Nokia tablet support.
 * Standalone toolchain and SDK application developers can develop=20
   against.
 * Addition of new tools to the SDK such as QEMU
 * Conversion to use the sysroot mode of gcc, making cross compiling=20
   both easier and more robust.
 * Conversion to use pkgconfig in sysroot mode
 * Updates to recent versions of almost all packages
 * Addition of NetworkManager to standard images
 * Addition of a Webkit based browser
 * uclibc support

The release also includes many bugfixes and other smaller tweaks and
updates.

The release tarball:
http://pokylinux.org/releases/poky-pinky-3.1.tgz

Device Images:
http://pokylinux.org/releases/pinky-3.1/

The (new) Poky Website:
http://pokylinux.org




