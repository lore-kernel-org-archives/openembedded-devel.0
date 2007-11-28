Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1IxG06-0004nf-Kp
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2007 07:02:22 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 395A4576F9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2007 00:59:28 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Wed, 28 Nov 2007 00:59:28 -0500
X-Sasl-enc: vayHpWlUXr24/rhQzgbnT0MW0ledO5IyFyDG7c5Wmmcj 1196229567
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 5D8C31C734
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2007 00:59:27 -0500 (EST)
Message-ID: <474D03A3.9090805@whitby.id.au>
Date: Wed, 28 Nov 2007 16:28:59 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <474BFBF6.2000602@whitby.id.au>
In-Reply-To: <474BFBF6.2000602@whitby.id.au>
Subject: Re: RFC: Adding endian support to linux.inc
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
X-List-Received-Date: Wed, 28 Nov 2007 06:02:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Rod Whitby wrote:
> I wish to propose the following patch to linux.inc to enable automatic
> support for setting the endian configuration value for those CPUs that
> can run in both big and little endian modes.
> 
> Silence will be taken as acceptance, and if there are no objections this
> change will be committed sometime this coming weekend.

Since it got three ACKs in a row, I've committed it.

-- Rod


