Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OhQDR-0006vj-JA
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 18:56:18 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 618DD11001E8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Aug 2010 18:56:05 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B93B711001B9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Aug 2010 18:56:04 +0200 (CEST)
Received: from rhein.familie-heinold.de (f052233034.adsl.alicedsl.de
	[78.52.233.34]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Aug 2010 18:56:04 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id E47F53C090; Fri,  6 Aug 2010 18:56:03 +0200 (CEST)
Date: Fri, 6 Aug 2010 18:56:03 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100806165603.GA15542@rhein.zuhause.netz>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5DD5@deimsg40.de.net.world>
MIME-Version: 1.0
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5DD5@deimsg40.de.net.world>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox: fix defconfig handling problems triggered by "configure according to {MACHINE, DISTRO}_FEATURES"; added inetd handling
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
X-List-Received-Date: Fri, 06 Aug 2010 16:56:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfgang,

thanks for the patch. Would be nice if you can resend the patch with a comment according
to the oe guidelines mentioned here http://wiki.openembedded.net/index.php/Commit_log_example

Bye Henning


