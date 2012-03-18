Received: from mx194.callplus.net.nz ([202.180.66.194]
	helo=mxi2.callplus.net.nz) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roystonvasey@slingshot.co.nz>) id 1S9Orj-0002Xe-R0
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 23:46:20 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ai0KALFiZk/LYgoS/2dsb2JhbABCgk+ybAOCFIIQCAIjWQUGB1soFwEEHgWHeZ1rhkGRFBOLE4I0gyIEphCCfA
X-IronPort-AV: E=Sophos;i="4.73,608,1325415600"; 
	d="scan'208,217";a="250875190"
Received: from smtp.connexionz.co.nz (HELO mikepad) ([203.98.10.18])
	by ismtp2.tranzpeer.net with ESMTP; 19 Mar 2012 11:36:25 +1300
From: "R U Local" <roystonvasey@slingshot.co.nz>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 19 Mar 2012 11:36:22 +1300
Message-ID: <018b01cd0557$8bbd8740$a33895c0$@slingshot.co.nz>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac0FUrUVKjCMg1rgQoq85ebphL1EZA==
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: BSP advice
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
X-List-Received-Date: Sun, 18 Mar 2012 22:46:20 -0000
Content-Language: en-nz
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear List,

Is it possible to build an Angstrom rootfs without building x-load, u-boot
and kernel image?

We have a new development that uses an AM3517 based unit.

The SDK comes with pre-patched source code for x-load, u-boot and kernel.
There are also compiled binary images.

To get things working quickly I'd like to build a rootfs with our software
and dependent packages and use the supplied binaries during installation.

 

Would setting ASSUME_PROVIDED in the machine BSP achieve this? 

 

Cheers Mike.

 

 


