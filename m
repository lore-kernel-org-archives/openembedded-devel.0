Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1Lzg8E-00053Y-BW
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 May 2009 01:57:34 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 8A5FC3381B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Apr 2009 19:52:09 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Thu, 30 Apr 2009 19:52:09 -0400
X-Sasl-enc: WSL1qWfauRlYC9ujYMf7CNp+Pe/hk/9GE3sDBHEGoA7I 1241135529
Received: from [192.168.1.11] (au2.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTPSA id B57FE390B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Apr 2009 19:52:08 -0400 (EDT)
Message-ID: <49FA39A1.6030009@whitby.id.au>
Date: Fri, 01 May 2009 09:22:01 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.21 (Windows/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
Subject: Removal of Unslung distro from OE .dev branch
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
X-List-Received-Date: Thu, 30 Apr 2009 23:57:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The Unslung distro moved from OE git to nslu2-linux SVN back in October
2008.

Now is the time to remove it from the OE .dev branch.

The benefits of this are that anyone making major infrastructural
changes to OE will no longer need to worry about an old stagnant
distribution which is stuck at a 2.4 kernel, and old glibc and gcc, and
is generally very difficult to support in the latest OE due to it's age.

I will be doing the work to remove it today.  All future work on the
Unslung distro is at http://svn.nslu2-linux.org/svnroot/unslung/trunk/

-- Rod Whitby
-- Unslung distro maintainer


