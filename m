Received: from dsl027-183-242.sfo1.dsl.speakeasy.net ([216.27.183.242]
	helo=mail.qvxlabs.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <afalls@qvxlabs.com>) id 1PMbso-0005qp-FF
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Nov 2010 08:41:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.qvxlabs.com (Postfix) with SMTP id DC9A1743866
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 23:39:56 -0800 (PST)
Received: from earth.localnet (unknown [10.1.1.34])
	by mail.qvxlabs.com (Postfix) with ESMTP id 8F25E743865
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 23:39:56 -0800 (PST)
From: Ardavon Falls <afalls@qvxlabs.com>
Organization: QVXLabs Inc
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Nov 2010 23:39:57 -0800
User-Agent: KMail/1.13.5 (Linux/2.6.35-23-generic; KDE/4.5.1; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201011272339.57718.afalls@qvxlabs.com>
X-DSPAM-Result: Whitelisted
X-DSPAM-Processed: Sat Nov 27 23:39:56 2010
X-DSPAM-Confidence: 0.9979
X-DSPAM-Probability: 0.0000
X-DSPAM-Signature: 4cf2074c16461704514828
X-SA-Exim-Connect-IP: 216.27.183.242
X-SA-Exim-Mail-From: afalls@qvxlabs.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Gumstix Verdex builds hang on boot, any ideas?
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
X-List-Received-Date: Sun, 28 Nov 2010 07:41:15 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

When I try to run the image created, everything appears to boot normally, 
until halfway through the init/sysV boot process, it hangs printing the 
message...

sa1100-rtc sa1100-rtc: rtc core: registered sa1100-rtc as rtc0 

I am using the following settings:
distro: minimal
machine: gumstix-verdex
target_os: linux

Any suggestions? has anyone else ran into this issue?

Thanks
Ardy

!DSPAM:4cf2074c16461704514828!




