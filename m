Received: from mailrelay04.sunrise.ch ([194.158.229.47]
	helo=smtp-be-02.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dv@vollmann.ch>) id 1NdO4E-0007C4-BX
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Feb 2010 14:17:53 +0100
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-02.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	o15CQki1027397; Fri, 5 Feb 2010 13:26:48 +0100
Message-ID: <4B6C0F0D.8030308@vollmann.ch>
Date: Fri, 05 Feb 2010 13:29:01 +0100
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1497161523.3479291265205781088.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
In-Reply-To: <1497161523.3479291265205781088.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
X-SA-Exim-Connect-IP: 194.158.229.47
X-SA-Exim-Mail-From: dv@vollmann.ch
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: EABI pain and frustration!
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
X-List-Received-Date: Fri, 05 Feb 2010 13:17:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/10 15:03, pspreadborough@comcast.net wrote:
> My 2.6.29 kernel is built with the CodeSourcery arm-2009q3-67-arm-none-linux-gnueabi 
> compiler and has the EABI and OABI_COMPAT config options enabled. Using this kernel 
> I can boot my SA1110 iPaq into a OABI ramfs with no problems, however if I build a 
> "HelloWorld" executable with the same compiler and try and run it I get an "Illegal Instruction" 
> error. I build the test program using static linking, select the correct machine type and tune 
> options but to no avail, I always get the illegal instruction. 
Just checking: are you sure this is an EABI/OABI problem and not a
Thumb code problem?

   Detlef



