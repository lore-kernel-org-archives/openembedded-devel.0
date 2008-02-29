Received: from [64.233.178.248] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JVDqn-0005wF-TJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Feb 2008 23:37:17 +0100
Received: by hs-out-0708.google.com with SMTP id 23so1288459hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Feb 2008 14:36:15 -0800 (PST)
Received: by 10.100.216.3 with SMTP id o3mr11881322ang.22.1204324575264;
	Fri, 29 Feb 2008 14:36:15 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Fri, 29 Feb 2008 14:36:15 -0800 (PST)
Message-ID: <c384c5ea0802291436n13d57bc3w3d9141f23e73e37e@mail.gmail.com>
Date: Fri, 29 Feb 2008 23:36:15 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.233.178.248
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: mtd-utils-1.1.0 will be enabled 15-3-2008
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
X-List-Received-Date: Fri, 29 Feb 2008 22:37:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I have added mtd-utils-1.1.0 but as it is quite a critical package for
mkfs, flashing etc, I have defaulted it with preference -1 for now.

I'll make it default 15-3-2008, please test for your device.

Regards,
-- 
Leon


