Received: from 173-11-172-146-houston.txt.hfc.comcastbusiness.net
	([173.11.172.146] helo=mail.breakawaysystems.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dave@lambsys.com>) id 1PFSNj-0000A0-QD
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 15:07:49 +0100
Received: by mail.breakawaysystems.com (Postfix, from userid 1007)
	id 037A51484C6; Mon,  8 Nov 2010 08:06:35 -0600 (CST)
Received: from [192.168.1.100]
	(173-11.172.145-houston.txt.hfc.comcastbusiness.net [173.11.172.145])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: dlambert)
	by mail.breakawaysystems.com (Postfix) with ESMTPSA id 6891E1480C4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Nov 2010 08:06:33 -0600 (CST)
Message-ID: <4CD803E8.8080805@lambsys.com>
Date: Mon, 08 Nov 2010 08:06:32 -0600
From: David Lambert <dave@lambsys.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 173.11.172.146
X-SA-Exim-Mail-From: dave@lambsys.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Stable branch/tag?
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
X-List-Received-Date: Mon, 08 Nov 2010 14:07:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am new to git and openembedded so please excuse another couple of 
naive questions.


1) What is a recommended stable branch/tag, and what command(s) are 
needed to obtain this?
2) Is there a document somwhere that explains the relevance of the use 
of branches and tags in this project?

Thanks in advance for help,

Dave.

Listing git tags shows:

git tag -l

SlugOS5.3-beta
mv-packages-to-recipes-post
mv-packages-to-recipes-pre
pre-nov2009-core-updates
shr/testing2009-1rc1
tested_2010-10-14
tested_2010-10-25
tested_2010-10-29
testing_2010-08-23
testing_2010-08-30
testing_2010-09-07
testing_2010-09-13
testing_2010-09-20
testing_2010-09-27
testing_2010-10-08


and git branch -a
* master
   remotes/origin/HEAD -> origin/master
   remotes/origin/bluelightning/opie-git
   remotes/origin/cbrake/qt-4.7.0
   remotes/origin/darwin
   remotes/origin/fso/milestone5
   remotes/origin/fso/milestone5.5
   remotes/origin/holger/hash-style
   remotes/origin/holger/openmoko-merges
   remotes/origin/holger/qt4-4.7
   remotes/origin/holger/qt4-sdk
   remotes/origin/holger/random-fixes
   remotes/origin/holger/staging-branch
   remotes/origin/ieee80215
   remotes/origin/jan/master
   remotes/origin/john_lee/fastboot-devel
   remotes/origin/john_lee/openmoko-toolchain
   remotes/origin/kergoth/alternatives
   remotes/origin/kergoth/autotools
   remotes/origin/kergoth/bluez
   remotes/origin/kergoth/hostap-madwifi
   remotes/origin/kergoth/master
   remotes/origin/khem/import-linaro-gcc-4.5
   remotes/origin/koen/darwin-host-fixes
   remotes/origin/koen/static-libs-rework
   remotes/origin/laibsch/scim
   remotes/origin/laibsch/wip
   remotes/origin/likewise/nios2
   remotes/origin/master
   remotes/origin/morphis/for-upstream
   remotes/origin/nios2
   remotes/origin/org.openembedded.angstrom-2007.12-stable
   remotes/origin/org.openembedded.dev
   remotes/origin/org.openembedded.documentation
   remotes/origin/org.openembedded.dreambox
   remotes/origin/org.openembedded.dreambox.release_25
   remotes/origin/org.openembedded.oetest
   remotes/origin/org.openembedded.oz354fam083
   remotes/origin/org.openembedded.oz354x
   remotes/origin/org.openembedded.packaged-staging
   remotes/origin/org.openembedded.slugos.5.3-beta
   remotes/origin/org.openembedded.stable
   remotes/origin/pb/toolchain-desuck
   remotes/origin/push/oe
   remotes/origin/raster
   remotes/origin/rik/amd64
   remotes/origin/rik/qemu-0.12
   remotes/origin/robertschuster/amd64-target
   remotes/origin/rpurdie/for-testing
   remotes/origin/rpurdie/work-in-progress
   remotes/origin/shared/blackfin
   remotes/origin/shared/xorg-7.4-update
   remotes/origin/shr/import
   remotes/origin/shr/merge
   remotes/origin/shr/stable2009
   remotes/origin/shr/testing2009
   remotes/origin/shr/testing2010
   remotes/origin/shr/unstable
   remotes/origin/stable/2009
   remotes/origin/stefan/eten-support
   remotes/origin/testing
   remotes/origin/testing-next
   remotes/origin/thesing/arm4-eabi-angstrom
   remotes/origin/ulf/linux-2.6.30
   remotes/origin/ulf/linux-2.6.30-2010-10-16
   remotes/origin/ulf/linux-2.6.30-20100317
   remotes/origin/ulf/linux-2.6.30-20100930
   remotes/origin/ulf/linux-2.6.30-at91sam9g45_m10
   remotes/origin/ulf/linux-2.6.30.2
   remotes/origin/woglinde/gettext
   remotes/origin/xora/angstrom-sqeeezy
   remotes/origin/xora/angstrom-srcpv



