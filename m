Received: from [62.179.121.46] (helo=viefep26-int.chello.at)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mailinglist@miromico.ch>) id 1JKDgW-000662-Nv
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2008 15:13:04 +0100
Received: from [192.168.1.192] (really [77.57.15.173])
	by viefep24-int.chello.at
	(InterMail vM.7.08.02.00 201-2186-121-20061213) with ESMTP
	id <20080130123421.FLLZ21279.viefep24-int.chello.at@[192.168.1.192]>
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2008 13:34:21 +0100
Message-ID: <47A06E07.7070807@miromico.ch>
Date: Wed, 30 Jan 2008 13:31:03 +0100
From: Alex <mailinglist@miromico.ch>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Kernel link problem in OE for AVR32
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
X-List-Received-Date: Wed, 30 Jan 2008 14:13:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all

I run into problems when trying to build target "bootstrap-image" for AVR32.

Google helped me to found a release note about this. Kernel linking is
failling with the OE built toolchain, which is
a known issue.

As a workaround it was mentioned to use the linker from atmel's toolchain.

I tried a few things but could not get the kernel to link. How can I
proceed? How to exchange the linker with the one from atmel?

Thanks

Alex


