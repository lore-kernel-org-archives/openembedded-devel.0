Received: from [160.45.40.10] (helo=math.fu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1HOwlY-0008FL-Nx
	for openembedded-devel@openembedded.org; Wed, 07 Mar 2007 15:05:16 +0100
Received: (qmail 10294 invoked from network); 7 Mar 2007 15:05:16 +0100
Received: from lusin.mi.fu-berlin.de (HELO mi.fu-berlin.de) (160.45.117.141)
	by leibniz.math.fu-berlin.de with SMTP; 7 Mar 2007 15:05:16 +0100
Received: (qmail 6576 invoked by uid 9804); 7 Mar 2007 15:05:16 +0100
Received: from localhost (HELO mi.fu-berlin.de) (127.0.0.1)
	by localhost with SMTP; 7 Mar 2007 15:05:15 +0100
Received: (qmail 6551 invoked by uid 9804); 7 Mar 2007 15:05:15 +0100
Received: from leibniz.math.fu-berlin.de (HELO math.fu-berlin.de)
	(160.45.40.10)
	by lusin.mi.fu-berlin.de with SMTP; 7 Mar 2007 15:05:15 +0100
Received: (qmail 10287 invoked from network); 7 Mar 2007 15:05:15 +0100
Received: from leningrad.mi.fu-berlin.de (160.45.45.206)
	by leibniz.math.fu-berlin.de with SMTP; 7 Mar 2007 14:05:15 -0000
Received: from heinold by leningrad.mi.fu-berlin.de with local (Exim 3.36 #1
	(Debian)) id 1HOwlW-00062Q-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2007 15:05:14 +0100
Date: Wed, 7 Mar 2007 15:05:14 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070307140514.GA23198@mi.fu-berlin.de>
References: <1173131731.5842.140.camel@localhost.localdomain>
	<20070306041502.GA542@thegnar.org>
	<1173259243.5826.0.camel@localhost.localdomain>
X-Envelope-Sender: heinold@inf.fu-berlin.de
X-Virus-Scanned: by AMaViS
	0.3.12pre7-L39+ClamAV[6554](NAI-uvscan@mi.fu-berlin.de)
X-Remote-IP: 160.45.45.206
Mime-Version: 1.0
In-Reply-To: <1173259243.5826.0.camel@localhost.localdomain>
User-Agent: Mutt/1.5.9i
From: Henning Heinold <heinold@inf.fu-berlin.de>
Subject: Re: Bitbake Request for Testing of bitbake 1.8
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
X-List-Received-Date: Wed, 07 Mar 2007 14:05:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I tested 1.8 with a simpad-setup. Only Problem was with
multiple threads and quilt. Quilt must build first without interrupted,
but I consider this problem on openembedded.

Bye Henning


