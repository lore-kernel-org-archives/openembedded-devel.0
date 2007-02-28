Received: from [62.169.194.60] (helo=cp3a.criticalpath.priv)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <skoroneos@digital-opsis.com>) id 1HMKT9-0000Rx-4n
	for openembedded-devel@openembedded.org; Wed, 28 Feb 2007 09:47:27 +0100
Received: from dias (62.169.211.226) by cp3a.criticalpath.priv (7.3.118.3)
	id 45DF0D5500039C1B for openembedded-devel@openembedded.org;
	Wed, 28 Feb 2007 10:46:37 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Wed, 28 Feb 2007 10:47:25 +0200
Message-ID: <HOECLKEKOHLAMMGDLLBHAECLKEAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
In-Reply-To: <d46153c40702270854k14f92b56x1c31eafdbea7b6e2@mail.gmail.com>
Importance: Normal
Subject: Add soft-float support for powerpc targets without fpu
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
X-List-Received-Date: Wed, 28 Feb 2007 08:47:27 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I have posted 2 patches on the bugtracker that provide soft-float support
for powerpc targets
http://bugs.openembedded.org/show_bug.cgi?id=1918

I have been testing the patches for a couple of weeks now, both on powerpc
targets and others (x86 variants mainly) without problems,but as these can
be
considered "system wide changes" (although the patches will be only applied
to
powerpc targets) i decided to post them to the bug tracker first for peer
review.

Please do test if they effect your distro/build in any way and post any
comments findings on the bugtracker.
If there are no major problems i plan to push them into OE during the next
"bug hunting weekend"

Stelios




