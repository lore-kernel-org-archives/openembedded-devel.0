Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HaA0V-0006Vu-AO
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Apr 2007 14:27:04 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 3217E216869
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Apr 2007 08:26:58 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Sat, 07 Apr 2007 08:27:03 -0400
X-Sasl-enc: mG5dJBKEtTnf5gKCBTo3U47W2ro86BqUNs6EjaMZgtmd 1175948822
Received: from [127.0.0.1] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id 5FDAA18EBC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Apr 2007 08:27:02 -0400 (EDT)
Message-ID: <46178DC9.1000207@whitby.id.au>
Date: Sat, 07 Apr 2007 21:55:45 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46176E51.2030608@dominion.kabel.utwente.nl>	<CD2A5546-06FC-414A-9C74-FB640EBFC4A5@selfish.org>
	<4617753E.409@dominion.kabel.utwente.nl>
In-Reply-To: <4617753E.409@dominion.kabel.utwente.nl>
Subject: Re: [RFC] rm_work
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
X-List-Received-Date: Sat, 07 Apr 2007 12:27:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Holger Freyther schreef:
>>> how many recipes still break with rm_work
> 
> angstrom-x11-image, angstrom-console-image and openmoko-devel-image work for various machines.

All recipes used by nslu2-linux are compatible with rm_work - we use it
on our autobuilders.

-- Rod


