Received: from [66.33.216.122] (helo=hapkido.dreamhost.com ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1N8s9t-0003YK-Iy
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 10:09:36 +0100
Received: from homiemail-a21.g.dreamhost.com (caiajhbdcbbj.dreamhost.com
	[208.97.132.119])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 6FAB917E74B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 01:08:14 -0800 (PST)
Received: from [129.132.133.199] (mtec-hg-docking-1-dhcp-199.ethz.ch
	[129.132.133.199])
	by homiemail-a21.g.dreamhost.com (Postfix) with ESMTPA id CA405300061
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 01:08:12 -0800 (PST)
Message-ID: <4AFD21FA.8000605@SSpaeth.de>
Date: Fri, 13 Nov 2009 10:08:10 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: dbus-native still failing
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
X-List-Received-Date: Fri, 13 Nov 2009 09:09:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Richard, I've seen you fixed dbus-native. However it still doesn't
work for me:

/src/shr-unstable/tmp/staging/x86_64-linux/usr/bin/install -c
.libs/dbus-daemon src/shr-unstable/tmp/staging/x86_64-linux/usr/bin

/src/shr-unstable/tmp/staging/x86_64-linux/usr/bin/install: cannot stat
`.libs/dbus-daemon': No such file or directory


