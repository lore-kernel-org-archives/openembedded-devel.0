Received: from asmtpout025.mac.com ([17.148.16.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1P3yaQ-0001Ta-Hv
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 00:05:21 +0200
MIME-version: 1.0
Received: from [192.168.1.100] ([87.201.169.209])
	by asmtp025.mac.com (Oracle Communications Messaging Exchange Server
	7u4-18.01 64bit (built Jul 15 2010)) with ESMTPSA id
	<0L9X004GHUJ6TA50@asmtp025.mac.com>
	for openembedded-devel@lists.openembedded.org; Thu,
	07 Oct 2010 14:04:21 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@mac.com>
Date: Fri, 08 Oct 2010 01:04:13 +0400
Message-id: <4E064324-2FF0-4F2B-BCB7-04AFD285689B@mac.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 17.148.16.100
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: opkg install gdbserver
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
X-List-Received-Date: Thu, 07 Oct 2010 22:05:21 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; CHARSET=US-ASCII

Hi,
        I have a target board that is not connected to the internet. 

What should I do to get gdbserver onto the target? 

I have built gdb-cross. Is there another recipe I can add to omap3-console-image, to make sure that gdbserver gets pulled in?

Best regards,

Elvis Dowson


