Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HDz6S-000182-Ph
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Feb 2007 09:21:32 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 008BACCB88
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2007 03:21:31 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Mon, 05 Feb 2007 03:21:32 -0500
X-Sasl-enc: ZcyQQX9UuObIU8E76ubh1u5yr8iu4TUBVvB3/23WlIsq 1170663691
Received: from [192.168.0.11] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id 334EFFA11
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2007 03:21:30 -0500 (EST)
Message-ID: <45C6E906.9090602@whitby.id.au>
Date: Mon, 05 Feb 2007 18:51:26 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: How will OE handle the US timezone change?
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
X-List-Received-Date: Mon, 05 Feb 2007 08:21:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Not that I really care (not living in the US), but people using distros
built from OE are getting concerned about how the new US DST timezone
thing is going to be handled.

Are there any OE developers in the US who know enough and care enough to
 fix it properly?  Our someone else who is gracious enough to help our
US friends out of their timezone mess?

At the moment, there seems to be a timezones package which downloads
binary files from some OPIE site.  I've heard that timezone data is
endian specific, so it seems that some better solution might be required.

-- Rod


