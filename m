Received: from [65.182.109.70] (helo=mta1.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1MLzOh-0000hq-UY
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jul 2009 14:58:49 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta1.brinkster.com (Postfix) with ESMTP id D3142397983
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2009 08:46:47 -0400 (EDT)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: 0.4
X-Spam-Level: 
X-Spam-Status: No, score=0.4 tagged_above=-10 required=5 tests=[AWL=-0.332,
	BAYES_00=-2.599, MSGID_MULTIPLE_AT=1.449, RCVD_IN_PBL=0.905,
	RCVD_IN_SORBS_DUL=0.877, RDNS_DYNAMIC=0.1]
Received: from mta1.brinkster.com ([127.0.0.1])
	by localhost (mta1.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sNxSXIvarTya
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2009 08:46:47 -0400 (EDT)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta1.brinkster.com (Postfix) with ESMTP id D22FC397546
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2009 08:46:46 -0400 (EDT)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <20090701115959.GA10962@pcimg12.dei.unipd.it>
In-Reply-To: <20090701115959.GA10962@pcimg12.dei.unipd.it>
Date: Wed, 1 Jul 2009 13:46:16 +0100
Message-ID: <04a901c9fa49$ee4648f0$cad2dad0$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Acn6Ra2pgpTOWQ3tTJiRwFGd9H/OhQAA8T1Q
Subject: Re: looking for an arm-based board
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
X-List-Received-Date: Wed, 01 Jul 2009 12:58:56 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

> This time  I need a  small arm with  standard peripherals (UART,  SPI
> or
> I2C) and ethernet.  The task it has  to do is controlling  a few
> devices
> with the commands received over TCP/IP.
> 
> Since I don't know all the supported machines, can you suggest me a
> cost
> effective ARM7 or ARM9 board that works well with OE stable/2009?

If you want a cheap board that is well supported and very actively developed
by OE (both dev and stable/2009) then the obvious choice is the BeagleBoard.
You would need to add Ethernet into the mix but a simple USB stick (or I/C)
can do that job well.

It's a Cortex-A7 board so it may be over the top in the capacity stakes but
it's hard to knock it ;-).

John




