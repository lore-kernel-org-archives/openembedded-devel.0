Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PcYHX-0005g5-Rp
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 08:04:39 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 72796491278
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 08:04:11 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 11 Jan 2011 08:04:11 +0100
Message-ID: <4D2C00E7.2010807@dresearch.de>
Date: Tue, 11 Jan 2011 08:04:07 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 11 Jan 2011 07:04:11.0553 (UTC)
	FILETIME=[BFA50910:01CBB15D]
Subject: epiphany still broken
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
X-List-Received-Date: Tue, 11 Jan 2011 07:04:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I'm back to OE after two month and do_configure for epiphany-2.30.2 still fails [1]. :(

As mentioned in earlier threads[2] i'll push my original patch which disables the ca-file use [3], if nobody can fix this in the next days.

Steffen

[1] <http://tinderbox.openembedded.org/packages/1591919/>
[2] <http://thread.gmane.org/gmane.comp.handhelds.openembedded/38251/focus=38830>
[3] <http://thread.gmane.org/gmane.comp.handhelds.openembedded/37453/focus=37585>



