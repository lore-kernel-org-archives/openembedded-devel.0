Received: from [205.178.146.53] (helo=omr3.networksolutionsemail.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <chatchai@allit.info>) id 1GhiyE-0007QP-GN
	for openembedded-devel@openembedded.org; Wed, 08 Nov 2006 09:39:42 +0100
Received: from mail.networksolutionsemail.com (ns-omr3.mgt.netsolmail.com
	[10.49.6.66])
	by omr3.networksolutionsemail.com (8.13.6/8.13.6) with SMTP id
	kA88cEMi002444 for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Nov 2006 03:38:14 -0500
Received: (qmail 31658 invoked by uid 78); 8 Nov 2006 08:38:14 -0000
Received: from unknown (HELO webmail21) (205.178.146.50)
	by ns-omr3.lb.hosting.dc2.netsol.com with SMTP;
	8 Nov 2006 08:38:14 -0000
Received: from 61.7.137.176 (chatchai@allit.info [61.7.137.176])
	by webmail21 (EdgeDesk 4.04) with WEBMAIL id 2441;
	Wed, 08 Nov 2006 08:38:13 +0000
From: chatchai@allit.info
To: openembedded-devel@openembedded.org
Importance: Normal
Sensitivity: Normal
Message-ID: <W74093306724411162975093@webmail21>
X-Mailer: Mintersoft EdgeDesk, Build 4.03.0105
X-Originating-IP: [61.7.137.176]
X-Forwarded-For: [192.168.2.202, 61.7.137.176]
Date: Wed, 08 Nov 2006 08:38:13 +0000
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: openomap
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
X-List-Received-Date: Wed, 08 Nov 2006 08:39:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi list

I have built both linux-omap-2.6.18-omap1.bb and linux-omap-2.8.28+git.bb. Both of them build successfully, but when I start a kernel, it said 
Uncompressing Kernel Image ... Error: inflate() returned -3
GUNZIP ERROR - must RESET board to recover
So, I compiled a kernel from source using available in source directory (of openembedded), and using toolcain from openembedded, compile 
is successd,build image using git version of uboot, and booting is also work.

Another ploblem is, dorpbear isn't work. I start dropbear (/etc/init.d/dropbear start) and check it using ps, nothing about dropbear. I connect to 
omap (osk) using putty, it said connection refused.

Anybody experienced these kind of ploblem please tell me what is the ploblem.

Tanks and regard

Chatchai
All Infomation Technologies, Thailand







