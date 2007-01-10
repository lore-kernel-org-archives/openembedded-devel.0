Received: from [64.233.182.187] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H4esR-0005Sk-Mk
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jan 2007 15:56:31 +0100
Received: by nf-out-0910.google.com with SMTP id l24so499653nfc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2007 06:54:41 -0800 (PST)
Received: by 10.48.240.10 with SMTP id n10mr1257340nfh.1168440881018;
	Wed, 10 Jan 2007 06:54:41 -0800 (PST)
Received: from CUBE ( [82.193.96.238])
	by mx.google.com with ESMTP id g1sm4107185nfe.2007.01.10.06.54.40;
	Wed, 10 Jan 2007 06:54:40 -0800 (PST)
Date: Wed, 10 Jan 2007 16:54:55 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1127600830.20070110165455@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	<angstrom-distro-devel@linuxtogo.org>
In-Reply-To: <45A4FA79.7040706@dominion.kabel.utwente.nl>
References: <200701081618.46665.openembedded@hrw.one.pl>
	<200701091430.38026.openembedded@hrw.one.pl>
	<eo13rb$pkn$1@sea.gmane.org>
	<200701092322.34825.openembedded@hrw.one.pl>
	<1132961128.20070110160638@gmail.com>
	<45A4FA79.7040706@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: [Angstrom-devel] Status of ARM machines in OE
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
X-List-Received-Date: Wed, 10 Jan 2007 14:56:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Wednesday, January 10, 2007, 4:38:49 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Paul Sokolovsky schreef:

> <snip>

>> So, what's really required is someone to physically test
>> boot on a machine, and that's enough. Not boot means upstream (hh.org)
>> kernel problem, otherwise, it works (bugs are either common or due to
>> specific kernel bug also).

> That's not true. Yesterday my h5550 didn't boot, but I got it booting by using the a
> different /boot/params and fixing the fstab.

  Yes, I know, that what I wrote to the large part is wishful thinking
at this time, but if people indeed change point of view to such
discrepancies from "we're stuck at that" to "temporary evil", it would
quickly become reality.

  As for h5000 hardships, recent bootloader talk was exactly about
that - if all or none of pocketpc's used /boot/params, there woild be much
less probability for such issues, and they would reoccur much rarely
and be fixed much quicker.

  fstab is of course more hard case - while it's very tempting to
reduce to a single standard MTD layout, it's less practical that
having single generic bootloader support (+ any number of adhoc
model-specific ones, of course).

> regards,

> Koen


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



