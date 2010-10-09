Received: from asmtpout028.mac.com ([17.148.16.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1P4iwb-0004rl-4I
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 01:35:14 +0200
MIME-version: 1.0
Received: from [192.168.1.100] ([87.201.169.78])
	by asmtp028.mac.com (Oracle Communications Messaging Exchange Server
	7u4-18.01 64bit (built Jul 15 2010)) with ESMTPSA id
	<0LA10082AO17II40@asmtp028.mac.com>
	for openembedded-devel@lists.openembedded.org; Sat,
	09 Oct 2010 15:34:23 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@mac.com>
Date: Sun, 10 Oct 2010 02:34:12 +0400
Message-id: <9A9E6124-07E1-473D-8EAE-3162046BF474@mac.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 17.148.16.103
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
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
X-List-Received-Date: Sat, 09 Oct 2010 23:35:15 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; CHARSET=US-ASCII

Hi,
      I just updated my overo-oe repo today, and I'm getting some strange errors now. What could be causing this?

NOTE: Running task 702 of 710 (ID: 18, /tool/overo-oe/user.collection/recipes/linux/linux-omap3_2.6.32.bb, do_package)
arm-angstrom-linux-gnueabi-objcopy:/tool/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/linux-omap3-2.6.32-r90/package/kernel/scripts/kallsyms: File format not recognized
arm-angstrom-linux-gnueabi-strip:/tool/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/linux-omap3-2.6.32-r90/package/kernel/scripts/kallsyms: File format not recognized
arm-angstrom-linux-gnueabi-objcopy:/tool/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/linux-omap3-2.6.32-r90/package/kernel/scripts/kallsyms: File format not recognized
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip' --remove-section=.comment --remove-section=.note '/tool/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/linux-omap3-2.6.32-r90/package/kernel/scripts/kallsyms'' strip command failed
arm-angstrom-linux-gnueabi-objcopy:/tool/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/linux-omap3-2.6.32-r90/package/kernel/scripts/bin2c: File format not recognized
arm-angstrom-linux-gnueabi-strip:/tool/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/linux-omap3-2.6.32-r90/package/kernel/scripts/bin2c: File format not recognized
arm-angstrom-linux-gnueabi-objcopy:/tool/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/linux-omap3-2.6.32-r90/package/kernel/scripts/bin2c: File format not recognized
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip' --remove-section=.comment --remove-section=.note '/tool/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/linux-omap3-2.6.32-r90/package/kernel/scripts/bin2c'' strip command failed
arm-angstrom-linux-gnueabi-objcopy:/tool/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/linux-omap3-2.6.32-r90/package/kernel/scripts/conmakehash: File format not recognized
arm-angstrom-linux-gnueabi-strip:/tool/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/linux-omap3-2.6.32-r90/package/kernel/scripts/conmakehash: File format not recognized
arm-angstrom-linux-gnueabi-objcopy:/tool/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/linux-omap3-2.6.32-r90/package/kernel/scripts/conmakehash: File format not recognized

Best regards,

Elvis Dowson



