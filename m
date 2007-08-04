Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IHD15-0003Al-Jc
	for openembedded-devel@openembedded.org; Sat, 04 Aug 2007 08:21:37 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l746JJ1R008271 for <openembedded-devel@lists.openembedded.org>;
	Sat, 4 Aug 2007 08:19:20 +0200
Message-ID: <46B41A70.8030304@dominion.kabel.utwente.nl>
Date: Sat, 04 Aug 2007 08:19:28 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <19c1b8a90708031735x59bf4341u736aeb19977c34a0@mail.gmail.com>
In-Reply-To: <19c1b8a90708031735x59bf4341u736aeb19977c34a0@mail.gmail.com>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: PATCH: Use uImage make target for linux-omap1
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
X-List-Received-Date: Sat, 04 Aug 2007 06:21:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Khem Raj schreef:
> Hello,
> 
> Current uImage generated for omap1 target did not boot on my target.
> We are using manual method to create uImage.
> This patch uses uImage KERNEL_IMAGETYPE for omap1 targets. I have
> tested this on omap5912osk and the resulting uImage booted just fine.
> 
> If it is OK please consider this patch for applying.

I had some troubles with generating uImages earlier in with avr2, efika and at91 kernels.
I added some foo to packages/linux/linux.inc that works for me(TM).

After I figure out why my ubuntu machine doesn't let me login anymore I have some further
updates for it.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGtBpwMkyGM64RGpERAqPqAJ9ZEI13wWti+upRzgEGNkX5xU16SQCgncm7
gS+hEKU8R2AZEQrintj/Iyk=
=mayM
-----END PGP SIGNATURE-----


