Received: from [208.65.21.12] (helo=cpanel10.myrtlenet.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Iqu0x-0001OG-BC
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Nov 2007 18:21:02 +0100
Received: from 82-171-189-134.dsl.ip.tiscali.nl ([82.171.189.134]:16744
	helo=[192.168.1.24])
	by cpanel10.myrtlenet.com with esmtpa (Exim 4.68)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Iqtlk-000100-BH
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Nov 2007 12:05:16 -0500
Message-ID: <4735E458.1090108@gmail.com>
Date: Sat, 10 Nov 2007 18:03:20 +0100
From: Leon Woestenberg <leon.woestenberg@gmail.com>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.myrtlenet.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - gmail.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: RFC: dropping either pixman or libpixman
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
X-List-Received-Date: Sat, 10 Nov 2007 17:21:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I noticed both

[1] packages/libpixman/libpixman*.bb
[2] packages/xorg-lib/pixman*.bb

while I thought I was introducing libpixman 0.9.6 in [1], Andy had 
already done so in [2].

Since 0.9.6, libpixman can be built stand-alone; I have adopted [2] to 
do so.

I would like to propose to drop either [1] or [2].

Any objections and/or any preferences on which one?

Regards,

Leon.



