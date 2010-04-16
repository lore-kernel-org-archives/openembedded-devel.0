Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O2olp-0005Jy-SG
	for Openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 18:51:59 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 5D45CEB1A8
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 12:48:29 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Fri, 16 Apr 2010 12:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:message-id:mime-version:content-type;
	s=smtpout; bh=8RTRACA3oYBAddgwN05L/esDHNI=;
	b=fn5vKC3c7SSzvsw+8hPkBuqdKLoybFWIVNJM9yJQXQJ1dpv9goAJF+YZm/QZCKrW2gI4tf5kkvnL/JsbJMyiws//PIGAwekWErNsE17TIjmMKHI7MEkjggubDVciRP/8kN+8sn+LFLRfhYxGoq9+TokXIzC7kNENDjOrk8kE9lQ=
X-Sasl-enc: mRo35OEn5HzGTqLkcw3KM9JI8KJfN/eViJ4HRssI2ohE 1271436508
Received: from [192.168.1.34] (hnvr-4d07a1c5.pool.mediaWays.net [77.7.161.197])
	by mail.messagingengine.com (Postfix) with ESMTPSA id B2B104C491C
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 12:48:28 -0400 (EDT)
Date: Fri, 16 Apr 2010 18:49:42 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Message-ID: <alpine.LNX.2.00.1004161842100.28729@asterix.crazy-teaparty.dyndns.org>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: support for TQ tb5200l
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
X-List-Received-Date: Fri, 16 Apr 2010 16:51:59 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

The following patches add support for TQ's TB5200L a small powerpc-based
machine providing ethernet, USB host, RS232, RS485 and 2 CAN busses.
See http://www.tq-components.com for details.

Bye,
   Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


