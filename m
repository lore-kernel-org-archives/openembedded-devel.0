Received: from [131.111.8.137] (helo=ppsw-7.csi.cam.ac.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>) id 1N6210-0002fT-Ja
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 14:04:41 +0100
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:45318)
	by ppsw-7.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-AES256-SHA:256)
	id 1N61eP-0002ol-Mo (Exim 4.70) for
	openembedded-devel@lists.openembedded.org
	(return-path <jic23@cam.ac.uk>); Thu, 05 Nov 2009 12:41:17 +0000
Message-ID: <4AF2C807.9070600@cam.ac.uk>
Date: Thu, 05 Nov 2009 12:41:43 +0000
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Thunderbird 2.0.0.23 (X11/20091029)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AF1DD1A.80005@cam.ac.uk>
	<200911042110.58315.marcin@juszkiewicz.com.pl>
In-Reply-To: <200911042110.58315.marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 0.96.0
X-SA-Exim-Connect-IP: 131.111.8.137
X-SA-Exim-Mail-From: jic23@cam.ac.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] IMote2 machine config
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
X-List-Received-Date: Thu, 05 Nov 2009 13:04:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Marcin Juszkiewicz wrote:
> Dnia środa, 4 listopada 2009 o 20:59:22 Jonathan Cameron napisał(a):
> 
>> +MACHINE_EXTRA_RRECOMMENDS = "kernel-modules"
> 
> You install all kernel modules into rootfs  so it looks like you do not need 
> to specify all of selected ones in imote2-image recipe.
Hmm.. something odd is going on then, because they aren't all turning up in the
image.  Will look into it later.

> Please also add some description of device and URL to vendor page.
Will do.

Thanks

Jonathan


