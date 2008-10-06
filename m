Received: from [160.45.40.10] (helo=mail.math.fu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1KmlIl-0006CN-Si
	for openembedded-devel@openembedded.org; Mon, 06 Oct 2008 10:18:47 +0200
Received: (qmail 28437 invoked from network); 6 Oct 2008 10:14:19 +0200
Received: from lusin.mi.fu-berlin.de (HELO mi.fu-berlin.de) (160.45.117.141)
	by leibniz.math.fu-berlin.de with SMTP; 6 Oct 2008 10:14:19 +0200
Received: (qmail 26091 invoked by uid 9804); 6 Oct 2008 10:14:19 +0200
Received: from localhost (HELO mi.fu-berlin.de) (127.0.0.1)
	by localhost with SMTP; 6 Oct 2008 10:14:14 +0200
Received: (qmail 26075 invoked by uid 9804); 6 Oct 2008 10:14:14 +0200
Received: from leibniz.math.fu-berlin.de (HELO math.fu-berlin.de)
	(160.45.40.10)
	by lusin.mi.fu-berlin.de with SMTP; 6 Oct 2008 10:14:14 +0200
Received: (qmail 28421 invoked from network); 6 Oct 2008 10:14:14 +0200
Received: from omsk.mi.fu-berlin.de (160.45.45.210)
	by leibniz.math.fu-berlin.de with (AES256-SHA encrypted) SMTP;
	6 Oct 2008 08:14:14 -0000
Received: from heinold by omsk.mi.fu-berlin.de with local (Exim 4.63 #1
	(Debian)) id 1KmlEL-0001gI-Qw
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2008 10:14:13 +0200
Date: Mon, 6 Oct 2008 10:14:13 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081006081413.GA6418@mi.fu-berlin.de>
References: <20081006033249.C770E1880C6@amethyst.openembedded.net>
	<73a60a6a0810052257y5c8ed918n6da3a3aee1d7d62f@mail.gmail.com>
X-Envelope-Sender: heinold@mi.fu-berlin.de
X-Virus-Scanned: by AMaViS
	0.3.12pre7-L41+ClamAV[26078](NAI-uvscan@mi.fu-berlin.de)
X-Remote-IP: 160.45.45.210
MIME-Version: 1.0
In-Reply-To: <73a60a6a0810052257y5c8ed918n6da3a3aee1d7d62f@mail.gmail.com>
User-Agent: Mutt/1.5.13 (2006-08-11)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: [oe-commits] : gcc-configure-cross.inc: create the target of the symlink if necessary;
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
X-List-Received-Date: Mon, 06 Oct 2008 08:18:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 06, 2008 at 11:27:28AM +0530, nishant soin wrote:
> Hi
>         i want to create package for gcc-4.2.0 version. While compiling gcc
> i get the error that sys/types.h not found so it is not able to create
> libiberty.a file.
>         Help me resolve this error. The log file is attached with this
> mail.Plz go through it and help me solve this problem---
> 
> Thanks
> Nishant Soin
> Embedded Engineer
> SQL Star International Ltd.

Hi,

I saw you are using poky, so it might be better to write to the poky
folks and ask there for help, because gcc-4.2 is somehow old and nobdy
form openembedded might look at it.

Bye Henning


