Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1K2qHV-0005rh-M4
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Jun 2008 18:19:41 +0200
Received: from [92.227.192.107] (helo=[192.168.1.156])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1K2qnS-0002HJ-QW
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Jun 2008 18:52:42 +0200
Message-ID: <4842CB25.5000305@kernelconcepts.de>
Date: Sun, 01 Jun 2008 18:15:33 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200805271420.02174.loudawgucr@gmail.com>
In-Reply-To: <200805271420.02174.loudawgucr@gmail.com>
X-Enigmail-Version: 0.95.0
Subject: Re: Kernel not booting
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 01 Jun 2008 16:19:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Louie Ilievski wrote:
> When trying to boot this with Haret, the last message I see is "Jumping to 
> kernel" and then it sits there until I reset the device.  I don't know where 
> to go from here to find out what is wrong with the kernel.

I have seen the same effect with the HTC Universal which uses the same kernel
(2.6.21-hh20). So it seems to be broken for other devices as well. Kernel
2.6.20-hh10 works for the Universal.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


