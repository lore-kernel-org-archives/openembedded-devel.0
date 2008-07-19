Received: from [81.228.9.186] (helo=av9-2-sn3.vrr.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1KK655-0005HL-Ud
	for openembedded-devel@openembedded.org; Sat, 19 Jul 2008 08:38:11 +0200
Received: by av9-2-sn3.vrr.skanova.net (Postfix, from userid 502)
	id 23FAA380D8; Sat, 19 Jul 2008 08:37:18 +0200 (CEST)
Received: from smtp3-2-sn3.vrr.skanova.net (smtp3-2-sn3.vrr.skanova.net
	[81.228.9.102])
	by av9-2-sn3.vrr.skanova.net (Postfix) with ESMTP id E05DA37E4E
	for <openembedded-devel@openembedded.org>;
	Sat, 19 Jul 2008 08:37:17 +0200 (CEST)
Received: from [10.175.196.221] (213-67-42-101-no158.tbcn.telia.com
	[213.67.42.101])
	by smtp3-2-sn3.vrr.skanova.net (Postfix) with ESMTP id B98D837E43
	for <openembedded-devel@openembedded.org>;
	Sat, 19 Jul 2008 08:37:17 +0200 (CEST)
Message-ID: <48818A99.2030303@atmel.com>
Date: Sat, 19 Jul 2008 08:32:57 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.14 (X11/20080421)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-Enigmail-Version: 0.95.6
Subject: Working image for AVR32?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 19 Jul 2008 06:38:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I tried Angstrom/gpe-image and then base-image.
First with TARGET_OS="linux" and then "linux-uclibc".

It hangs in the glibc do_configure.

What is the best DISTRO/image combination for the AVR32?

BR
Ulf Samuelsson

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIgYqYAyRRH5cXxqwRAmwIAJ9bV1UYYFMux+WfZ8FqLl/jlR/l3wCfRr5c
+A2QxRmN4NfP9+td6DJGBFI=
=KtDZ
-----END PGP SIGNATURE-----


