Received: from [160.45.40.10] (helo=mail.math.fu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1Mn67f-0001n6-Ku
	for openembedded-devel@openembedded.org; Mon, 14 Sep 2009 09:37:18 +0200
Received: (qmail 28173 invoked from network); 14 Sep 2009 09:36:46 +0200
Received: from luzin.mi.fu-berlin.de (HELO mi.fu-berlin.de) (160.45.117.148)
	by leibniz.math.fu-berlin.de with SMTP; 14 Sep 2009 09:36:46 +0200
Received: (qmail 19918 invoked by uid 9804); 14 Sep 2009 09:36:46 +0200
Received: from localhost (HELO mi.fu-berlin.de) (127.0.0.1)
	by localhost with SMTP; 14 Sep 2009 09:36:39 +0200
Received: (qmail 19910 invoked by uid 9804); 14 Sep 2009 09:36:39 +0200
Received: from leibniz.math.fu-berlin.de (HELO math.fu-berlin.de)
	(160.45.40.10)
	by luzin.mi.fu-berlin.de with SMTP; 14 Sep 2009 09:36:39 +0200
Received: (qmail 28150 invoked from network); 14 Sep 2009 09:36:39 +0200
Received: from omsk.mi.fu-berlin.de (160.45.45.210)
	by leibniz.math.fu-berlin.de with SMTP; 14 Sep 2009 07:36:39 -0000
Received: from heinold by omsk.mi.fu-berlin.de with local (Exim 4.69 #1
	(Debian)) id 1Mn675-0007fy-6X
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2009 09:36:39 +0200
Date: Mon, 14 Sep 2009 09:36:39 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090914073639.GA29461@mi.fu-berlin.de>
References: <440980.75636.qm@web45606.mail.sp1.yahoo.com>
X-Envelope-Sender: heinold@mi.fu-berlin.de
X-Virus-Scanned: by AMaViS
	0.3.12pre7-L41+ClamAV[19913](NAI-uvscan@mi.fu-berlin.de)
X-Remote-IP: 160.45.45.210
MIME-Version: 1.0
In-Reply-To: <440980.75636.qm@web45606.mail.sp1.yahoo.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-SA-Exim-Connect-IP: 160.45.40.10
X-SA-Exim-Mail-From: heinold@mi.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: x86 support
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
X-List-Received-Date: Mon, 14 Sep 2009 07:37:19 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Sep 13, 2009 at 04:31:30AM -0700, Abdullah YILDIZ wrote:
> Hi,
> 
> I wonder that whether openembedded supports this configuration:
> 
> VIA ESP10K
> VIA CN333 North Bridge 
> VIA VT8237R South Bridge
>  
> Thanks..

Depends only on the kernel. So maybee you need some patches.

Bye Henning


