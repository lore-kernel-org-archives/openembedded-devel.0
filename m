Received: from [66.111.4.29] (helo=out5.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HGVeA-0004xa-2u
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Feb 2007 08:31:00 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 857DA1AAA63
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Feb 2007 02:30:43 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by out1.internal (MEProxy); Mon, 12 Feb 2007 02:30:43 -0500
X-Sasl-enc: 9eZbJXGzPATHTlYXPf5mg4ph0hQTLbBMJPkZ57O4pCY4 1171265443
Received: from [192.168.0.11] (unknown [58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id C1538112EE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Feb 2007 02:30:42 -0500 (EST)
Message-ID: <45D01799.2020101@whitby.id.au>
Date: Mon, 12 Feb 2007 18:00:33 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Major changes to ixp4xx and nslu2 machines, and slugos distro
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
X-List-Received-Date: Mon, 12 Feb 2007 07:31:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The "ixp4xx" OE machine selection is now deprecated, and will tell you
to either use "ixp4xxbe" or "ixp4xxle" if you try to use it.

The "nslu2" OE machine selection is now deprecated, and will tell you to
either use "nslu2be" or "nslu2le" if you try to use it.

The "openslug" and "debianslug" OE distro selections are now deprecated
- you should replace them with "slugos".

SlugOS packages currently end in _arm.ipk or _armeb.ipk - this has now
changed to _armv5te.ipk and _armv5teb.ipk

The "ucslugc" distro is effectively unmaintained (and has been for a
long time).  If no-one steps up to maintain it, I'll be moving it to the
obsolete directory.

-- Rod Whitby
-- NSLU2-Linux Project Lead



