Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <slapinid@gmail.com>) id 1RG6Ly-0006Gr-PQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 11:52:59 +0200
Received: by wyg19 with SMTP id 19so381820wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 02:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=zO5F2z446vNO6JmHlhW3bagI1lTimIlOQnSxiKAQY/c=;
	b=WvHm06KKnrpEehoY6qXvK/SpNrH1El+LCIRjARtkhnFDH9GPiVPvLAC/qUdfmt34Zl
	XZ/+xyBPnYsdhvp24426kZ5yTpy8CThbg+OHdcytgoWo68bZ6/obpQCC3wxIPQ0tEGAq
	5C3BUtN/AXoIxShPZHupgd4SHYjQBSlG1kpc8=
MIME-Version: 1.0
Received: by 10.216.88.212 with SMTP id a62mr632736wef.43.1318931228666; Tue,
	18 Oct 2011 02:47:08 -0700 (PDT)
Received: by 10.216.183.13 with HTTP; Tue, 18 Oct 2011 02:47:08 -0700 (PDT)
In-Reply-To: <j76o9h$504$1@dough.gmane.org>
References: <201109222337.30836.schnitzeltony@gmx.de>
	<201109251506.30431.schnitzeltony@gmx.de>
	<j6ugs9$j5b$1@dough.gmane.org>
	<201110102141.56124.schnitzeltony@gmx.de>
	<j76o9h$504$1@dough.gmane.org>
Date: Tue, 18 Oct 2011 13:47:08 +0400
Message-ID: <CAFZPMoZNRKKtOpX7mqtNWB1mEZC1onz4GjAjH+AYWAETQ53XoQ@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] do_rootfs fails with networkmanager (was network-manager-applet) included
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
X-List-Received-Date: Tue, 18 Oct 2011 09:52:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, all!

Just to let you know, lmbench contains /var/run as a directory, too.

Removing it from list fixes a problem.

S.


