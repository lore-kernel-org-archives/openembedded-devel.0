Received: from [209.85.216.196] (helo=mail-px0-f196.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fred.arneto@gmail.com>) id 1MiPyc-00046b-PZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Sep 2009 11:48:34 +0200
Received: by pxi34 with SMTP id 34so527404pxi.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2009 02:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=tH9uf2daJXmhQ2pOwGUlAFELGd79wAog0HM9hepSGKk=;
	b=sX1vBiYARhKif+bRWIhoRuJ/v65Xq5HPZzQnQ9mLotMDluPbKJn5vEglVixrLVR1vt
	Gt9Qrs5jAnh5pxUZBFe7iwZYdKR0e4APrFAf2DU1fvvyhU8UwUg28iwzgQxqptYdeLuo
	PIFHfJJCAgNw8kyKMH7uC3kI/1mUcl949dtlw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=nlwh9hytq7T17jLwwlW/WpM85+rhzclwhe/S/oTzNzCDqz82FE22jx7gHIdJN97S6G
	zan0/eIsPZsKufsw3in7G1Wb3OKmBe7XHEQjhRSzyF6HRVdqFLev02H8wc5Fcsb+c1H0
	rnF04Zaj/m+hPIbjvbv2xZjfyioiWxyKKY+Sc=
MIME-Version: 1.0
Received: by 10.115.134.18 with SMTP id l18mr4186593wan.128.1251797395653; 
	Tue, 01 Sep 2009 02:29:55 -0700 (PDT)
Date: Tue, 1 Sep 2009 05:29:55 -0400
Message-ID: <fe95c5770909010229m62ad22dfse6172b801fc655@mail.gmail.com>
From: Fred Arneto <fred.arneto@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Fennec update
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
X-List-Received-Date: Tue, 01 Sep 2009 09:48:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello OE,

Tinderbox shows Fennec build failing.
http://tinderbox.openembedded.net/packages/fennec/

cd /home/fso/fso-milestone5.5/tmp/work/armv5te-angstrom-linux-gnueabi/fennec-1_0.9+1.0b2pre-r3/mozilla-central;
autoconf2.13

/bin/sh: autoconf2.13: command not found

Just need to fix host to autoconf2.13. Any plans to update also the
tree to latest Fennec?

\Fred


