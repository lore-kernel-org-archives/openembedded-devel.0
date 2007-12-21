Received: from [160.45.40.10] (helo=math.fu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1J5gIo-0006cE-KL
	for openembedded-devel@openembedded.org; Fri, 21 Dec 2007 12:44:30 +0100
Received: (qmail 29171 invoked from network); 21 Dec 2007 12:39:18 +0100
Received: from lusin.mi.fu-berlin.de (HELO mi.fu-berlin.de) (160.45.117.141)
	by leibniz.math.fu-berlin.de with SMTP; 21 Dec 2007 12:39:18 +0100
Received: (qmail 28501 invoked by uid 9804); 21 Dec 2007 12:39:18 +0100
Received: from localhost (HELO mi.fu-berlin.de) (127.0.0.1)
	by localhost with SMTP; 21 Dec 2007 12:39:10 +0100
Received: (qmail 27021 invoked by uid 9804); 21 Dec 2007 12:38:18 +0100
Received: from leibniz.math.fu-berlin.de (HELO math.fu-berlin.de)
	(160.45.40.10)
	by lusin.mi.fu-berlin.de with SMTP; 21 Dec 2007 12:38:18 +0100
Received: (qmail 27529 invoked from network); 21 Dec 2007 12:38:18 +0100
Received: from leningrad.mi.fu-berlin.de (160.45.45.206)
	by leibniz.math.fu-berlin.de with (AES256-SHA encrypted) SMTP;
	21 Dec 2007 11:38:18 -0000
Received: from heinold by leningrad.mi.fu-berlin.de with local (Exim 4.63 #1
	(Debian)) id 1J5gCo-0000xf-0N
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2007 12:38:18 +0100
Date: Fri, 21 Dec 2007 12:38:18 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071221113817.GA3636@mi.fu-berlin.de>
References: <476B8D3A.7010703@gmx.net>
X-Envelope-Sender: heinold@mi.fu-berlin.de
X-Virus-Scanned: by AMaViS
	0.3.12pre7-L41+ClamAV[28375](NAI-uvscan@mi.fu-berlin.de)
X-Remote-IP: 160.45.45.206
MIME-Version: 1.0
In-Reply-To: <476B8D3A.7010703@gmx.net>
User-Agent: Mutt/1.5.13 (2006-08-11)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: java recipe policy for OE
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
X-List-Received-Date: Fri, 21 Dec 2007 11:44:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 21, 2007 at 10:54:02AM +0100, Robert Schuster wrote:
> Hi,
> the toolchain stuff has not been committed yet but I still want to start
> a little discussion about the future of java packages in OE.

> b) jni library location
> Another addition from the Debian guys is to put JNI libraries (shared
> libraries which provide some C stuff to the Java side) into
> /usr/lib/jni. Native library lookup is even more strange in Java and it
> was decided to simply patch Java runtimes to add /usr/lib/jni to the
> default native library search path (hard coding).

Hi, 

I am fine with the points, but we should see if the jni-path solution
is really practicable.

Bye Henning


