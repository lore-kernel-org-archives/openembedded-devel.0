Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <xjqian@gmail.com>) id 1HfZaA-0004OZ-E5
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Apr 2007 12:46:14 +0200
Received: by py-out-1112.google.com with SMTP id n39so1042266pyh
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Apr 2007 03:46:13 -0700 (PDT)
Received: by 10.35.93.1 with SMTP id v1mr8546546pyl.1177228513058;
	Sun, 22 Apr 2007 00:55:13 -0700 (PDT)
Received: from ?192.168.10.106? ( [24.107.178.232])
	by mx.google.com with ESMTP id m2sm7328652nzf.2007.04.22.00.55.12;
	Sun, 22 Apr 2007 00:55:12 -0700 (PDT)
Message-ID: <462B14AF.50903@gmail.com>
Date: Sun, 22 Apr 2007 02:54:23 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: linux-libc-headers build problem for tosa
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Apr 2007 11:03:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm testing my OE build system after upgrading my host to Debian Lenny 
(testing). host gcc version: gcc (GCC) 4.1.2 20061115 (prerelease) 
(Debian 4.1.1-21),  But I can't pass the stage of building 
linux-libc-headers-2.6.xx in either Angstrom or OZ-3.5.5 distro.

My local.conf is minimally modified with machine=tosa and qemu-native 
assumed.

Angstrom bug report: http://bugs.openembedded.org/show_bug.cgi?id=2128
OZ-3.5.5 bug report: http://bugs.openembedded.org/show_bug.cgi?id=2132

Any idea what's wrong?

Gordon



