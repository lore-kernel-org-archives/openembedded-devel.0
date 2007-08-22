Received: from [64.233.162.229] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1INpEI-0003Yq-WF
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2007 14:22:35 +0200
Received: by nz-out-0506.google.com with SMTP id j2so81734nzf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2007 05:21:29 -0700 (PDT)
Received: by 10.114.202.15 with SMTP id z15mr587373waf.1187785288956;
	Wed, 22 Aug 2007 05:21:28 -0700 (PDT)
Received: by 10.114.191.17 with HTTP; Wed, 22 Aug 2007 05:21:28 -0700 (PDT)
Message-ID: <f96d234e0708220521g4823ee9bs967959d821da691b@mail.gmail.com>
Date: Wed, 22 Aug 2007 08:21:28 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20070822075323.GA6044@rhein.zuhause.netz>
MIME-Version: 1.0
References: <E1INbyh-0006rm-0y@linuxtogo.org>
	<46CB6D5B.40501@dominion.kabel.utwente.nl>
	<f96d234e0708211932n4370bd94j2a91f597edc89adb@mail.gmail.com>
	<20070822075323.GA6044@rhein.zuhause.netz>
Subject: Re: [oe-commits] org.oe.dev compulab-pxa270.conf: fix serial console setup for 2.6.22 kernel,
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
X-List-Received-Date: Wed, 22 Aug 2007 12:22:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 8/22/07, Henning Heinold <heinold@inf.fu-berlin.de> wrote:

> initramfs is not an option for you?

Hello Henning,

Yes, I am building an initramfs (cpio.gz image) to place in NOR flash.
 Specifically, what OE image target are you suggesting?  Offhand, I
don't see any that include mtd-utils.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


