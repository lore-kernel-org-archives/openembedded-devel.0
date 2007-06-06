Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1HvucF-000395-GG
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2007 14:27:55 +0200
Received: by py-out-1112.google.com with SMTP id f47so216575pye
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2007 05:25:34 -0700 (PDT)
Received: by 10.65.211.16 with SMTP id n16mr824018qbq.1181132734349;
	Wed, 06 Jun 2007 05:25:34 -0700 (PDT)
Received: from cube ( [77.122.190.213])
	by mx.google.com with ESMTP id 36sm2749155nzk.2007.06.06.05.25.33;
	Wed, 06 Jun 2007 05:25:34 -0700 (PDT)
Date: Wed, 6 Jun 2007 15:25:32 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <899288206.20070606152532@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <466697F2.6020303@dominion.kabel.utwente.nl>
References: <E1HvlNq-0004pN-I1@linuxtogo.org>
	<1709000488.20070606140338@gmail.com>
	<466697F2.6020303@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev usb-gadget-mode: Add usb-gadget mode: An initscript to load the configured USB gadget module on boot
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
X-List-Received-Date: Wed, 06 Jun 2007 12:27:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Wednesday, June 6, 2007, 2:18:10 PM, you wrote:

[]

> What about using o-hands usbinit[1]?

> regards,

> Koen


> [1] http://svn.o-hand.com/view/poky/trunk/meta/packages/oh/

        Well, it appears to be simple script dealing only with g_ether
(it also fiddles with network interface, even though that rather be
left for proper service).



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



