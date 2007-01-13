Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <freyther@gmx.net>) id 1H5sRI-0003Fk-ML
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Jan 2007 00:37:32 +0100
Received: (qmail invoked by alias); 13 Jan 2007 23:35:22 -0000
Received: from unknown (EHLO [192.168.1.100]) [91.64.160.112]
	by mail.gmx.net (mp045) with SMTP; 14 Jan 2007 00:35:22 +0100
X-Authenticated: #1949623
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <200701132239.31919.alban@mycroft1.plus.com>
References: <1888834532.20070112204308@vanille-media.de>
	<1168681959.5868.4.camel@localhost.localdomain>
	<45A905A7.4070300@dominion.kabel.utwente.nl>
	<200701132239.31919.alban@mycroft1.plus.com>
Message-Id: <B194FC84-D017-4B53-8FB3-E30FCE2446A4@gmx.net>
From: Holger Freyther <freyther@gmx.net>
Date: Sun, 14 Jan 2007 00:35:03 +0100
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.752.3)
X-Y-GMX-Trusted: 0
Subject: Re: Angstrom cannot buile portabase
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
X-List-Received-Date: Sat, 13 Jan 2007 23:37:33 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit


Am 13.01.2007 um 23:39 schrieb Alban J Pearce:

> I have installed Angstrom
> bitbake , nano works
>
>  NOTE: build 200701132219: started
>
> OE Build Configuration:
> BB_VERSION     = "1.6.2"
> OE_REVISION    = "28548b0eda864e1b3a44136bcced77ee8c1e9dab"
> TARGET_ARCH    = "arm"
> TARGET_OS      = "linux-gnueabi"
> MACHINE        = "spitz"
> DISTRO         = "angstrom"
> DISTRO_VERSION = "test-20070113"
> TARGET_FPU     = "soft"
>
> But bitbake portsabase fails
>
> NOTE: Applying patch 'kernel-keymap.patch'
> Command Error: exit status: 1  Output:
> Applying patch kernel-keymap.patch
> can't find file to patch at input line 10
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:


Hi,

did you run out of disk space?

h.



