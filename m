Received: from [66.249.82.230] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <debasreeat@gmail.com>) id 1H7ORf-00056g-5n
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jan 2007 05:00:13 +0100
Received: by wx-out-0506.google.com with SMTP id t14so76161wxc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2007 19:57:35 -0800 (PST)
Received: by 10.90.75.10 with SMTP id x10mr610015aga.1169092655567;
	Wed, 17 Jan 2007 19:57:35 -0800 (PST)
Received: by 10.90.83.12 with HTTP; Wed, 17 Jan 2007 19:57:35 -0800 (PST)
Message-ID: <193b6ba30701171957p24a8519aoea73b2feaa404683@mail.gmail.com>
Date: Thu, 18 Jan 2007 12:57:35 +0900
From: "Debasree Mallick" <debasreeat@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: zaurus kernel porting problem.
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
X-List-Received-Date: Thu, 18 Jan 2007 04:00:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
I make a kernel image from openembadded using command bitbake virtual/kernel
and follow the instruction as mension here
www.openembedded.org/wiki/ZaurusKernels.
I am using a SDK of touch screen..It has similar CPU configuration like
zaurus PDA SL-C1000.
I did test my kernel image at zaurus Sl-C1000 with Uboot and itis working
....
But when i try to use this kernel image at my touch screen SDK , I found its
rebootinng and aging rebooting...rebooting...its seems it could not find the
kernel image....I am trying to boot it from CF...

In my
SDK CPU is Intel Xscale PXA270 416 MHZ..
Memory 64 MB
Boot Derive =Compact Flash Card 128 MB..
 BTD in my sdk , there is a already prepare boot loader so i am not using U
boot form openembedded...

Can anybody tell me ,can i use this zaurus kernel image in some other sdk of
same configuration of zaurus SL-C1000...
Should i do some changes during kernel building process...
If any body knows please reply me...

