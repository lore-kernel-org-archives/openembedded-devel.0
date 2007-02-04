Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HDe8e-0005Dc-1W
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Feb 2007 10:58:24 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 88320A2964
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Feb 2007 04:58:23 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Sun, 04 Feb 2007 04:58:23 -0500
X-Sasl-enc: O9xgxcHlzjyPCX+7lkKnUbHRTM5nRF57cXg+iu6quRqk 1170583103
Received: from [192.168.0.11] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id C02A92055F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Feb 2007 04:58:22 -0500 (EST)
Message-ID: <45C5AE3E.1060300@whitby.id.au>
Date: Sun, 04 Feb 2007 20:28:22 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45C256FA.5080504@whitby.id.au>
In-Reply-To: <45C256FA.5080504@whitby.id.au>
Subject: Re: RFC: New version of linphone (console only unless there are	objections)
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
X-List-Received-Date: Sun, 04 Feb 2007 09:58:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Rod Whitby wrote:
> I have checked in linphone_1.6.0.bb for your edification (with
> preferred_version = -1).  This will be used with yeaphone-0.1.bb to
> allow a cheap usb handset connected to an NSLU2 to be a VoIP solution.
> 
> Unless anyone objects (i.e. they want GPE support, and are willing to
> test it in 1.6.0 and maintain it), I propose removing the
> default_preference=-1 in a couple of days time and making the
> console-only 1.6.0 version the default version in OE.
> 
> Any objections?

As there were no objections, this will happen later today.

-- Rod


