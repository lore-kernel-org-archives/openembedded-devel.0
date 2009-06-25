Received: from [74.125.78.147] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1MJtGq-0004dF-Br
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Jun 2009 20:02:00 +0200
Received: by ey-out-1920.google.com with SMTP id 3so190627eyh.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2009 10:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=N2zM6VeJC99Vkb4PflYU/yPFoiUtOxRgqG2e28GTRVY=;
	b=P+AILfPridA+xJTVE7BfUei0X2NWBHOU8R5GK6ySvslda+Lp+a86dvbqCpXwbtejdv
	iF0RLE2ARnoR4B0Nv4KtHgjwczdPz2832BPOwjKscM7VlNeA64kUVJ1iDATMpRRqH5/n
	o45ScM/xVS2ym0oU0NbHM/429SXg5at4vGkJs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=cfT5CWZDR6I+IKygajNDDMNh3Lt/BRxdhggMygMxFSeqsj4489f/9zqQqU25wYWgBx
	iiZHqAXpsY+u3yhHMLD4QnbLAhE6rBVNYZILgsm8LuZL9Fq4O7/q/a60UwyHc2t3lt79
	r7OE2RRfm91t+p4VdaLZ6q51X7c6y7+swFaVE=
MIME-Version: 1.0
Received: by 10.210.113.16 with SMTP id l16mr2477519ebc.29.1245952242325; Thu, 
	25 Jun 2009 10:50:42 -0700 (PDT)
Date: Thu, 25 Jun 2009 21:50:41 +0400
Message-ID: <48239d390906251050w5f84947dy6c7490ab51d34983@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: OMAP3530 bring-up (and installation of Angstrom)
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
X-List-Received-Date: Thu, 25 Jun 2009 18:02:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi, all!

I have a new OMAP3530-based board which is totally empty.
omapzoom tools recognize ASIC ID on serial port, so I think it should
be possible
to bring it up this way. Do anybody have some minimal testing program
to flip some GPIO,
or character on serial?
I can't get any output from x-loader on either UART1 or UART3.. How
should I build binary for
it to be recognized by boot loader over serial?
No JTAG is here for this processor, and I have some troubles with
understanding of
Windows tools.

All the best,
S.


