Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1KmHAS-0005ok-Bz
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Oct 2008 02:08:12 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id C8263172DB5;
	Sat,  4 Oct 2008 20:03:49 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Sat, 04 Oct 2008 20:03:49 -0400
X-Sasl-enc: s0oi1IqXZlJ5nxcqu0tQvEkQG2YYDI7SY3+5Asoa8n2J 1223165029
Received: from [192.168.1.11] (CPE-121-209-20-127.sa.bigpond.net.au
	[121.209.20.127])
	by mail.messagingengine.com (Postfix) with ESMTPSA id B4C66BF0E;
	Sat,  4 Oct 2008 20:03:48 -0400 (EDT)
Message-ID: <48E8045C.6080907@whitby.id.au>
Date: Sun, 05 Oct 2008 10:33:40 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.16 (Windows/20080708)
MIME-Version: 1.0
To: mickeyl@openembedded.org
Cc: openembedded-devel@lists.openembedded.org
Subject: fso-testing fails to build - can't find cross compiler
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
X-List-Received-Date: Sun, 05 Oct 2008 00:08:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Mickey,

I'm rebuilding FSO for downloads.freesmartphone.org repo after the
TMPDIR ABI change, and it's failing on dbus where configure can't find
the gcc cross compiler.

  http://tinderbox.openembedded.net/packages/159970/

Is anyone else getting the same result?

[copied to OE in case it's a systemic problem after the staging changes]

-- Rod


