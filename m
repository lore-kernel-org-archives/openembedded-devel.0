Received: from [209.85.132.251] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <leon.woestenberg@gmail.com>) id 1J82ZK-0008QV-Um
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Dec 2007 00:55:19 +0100
Received: by an-out-0708.google.com with SMTP id b33so550642ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Dec 2007 15:49:28 -0800 (PST)
Received: by 10.100.7.1 with SMTP id 1mr17703552ang.73.1198799368253;
	Thu, 27 Dec 2007 15:49:28 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Thu, 27 Dec 2007 15:49:28 -0800 (PST)
Message-ID: <c384c5ea0712271549t5e7c07c5m48f04a2eaee25e5@mail.gmail.com>
Date: Fri, 28 Dec 2007 00:49:28 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC] linux 2.6.23 recipe now patches in .12, CFS and squashfs-lzma
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
X-List-Received-Date: Thu, 27 Dec 2007 23:55:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I just added three patches to the linux_2.6.23.bb recipe. As this
recipe has (AFAIK) multiple users and maintainers unknown to me, this
email is a heads-up.

The first is a 2.6.23.12 patch, the other two are the CFS-v24.1 fair
task scheduler, now mainlined, and squashfs-lzma, a highly compressed
read-only filesystem, well suited for embedded devices to reduce
FlashROM footprint.

Regards,
-- 
Leon


