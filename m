Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PAAHV-0001rR-Hm
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 01:47:18 +0200
Received: by qyk33 with SMTP id 33so908257qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 16:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=E/jKpVGgi2fZ1PB+ttiLiCygj3EbRccdMksjdzEaLfU=;
	b=Kb0sV4JrHUA0MXVEQJVIexzoB7ApoLc6its2uuE2B7b9HBul3s2hKpwL/TS6Onchg/
	vVjObNOoWfAiKIyMSs7vlvmEkfZTo/rBfvgb9o7nKlCYXM21LgF3FVMzqfgFq9B4Ig0t
	FGupyTUhgCBVBFTzMinIc3W9cb68O7WsI/jdM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ROMfZgW5A/5rGHfBnRWB3LmAd65/7pVxcoQdLXjtL5bknIqWgwPpDJn/voxjA9yZeU
	17uKYBaloAQ7FqHtS4OBMs44kVVdm6aMZOFJN28spWNwZl8YCP7o1hSwNS2oSfOb48IZ
	vtvKhU24BCZMeiECaKKJJ6uXWX5cD1BlYXA+s=
MIME-Version: 1.0
Received: by 10.229.28.149 with SMTP id m21mr593904qcc.102.1287963995234; Sun,
	24 Oct 2010 16:46:35 -0700 (PDT)
Received: by 10.229.18.197 with HTTP; Sun, 24 Oct 2010 16:46:35 -0700 (PDT)
In-Reply-To: <E1P9vMr-0005pa-Vs@melo.openembedded.org>
References: <E1P9vMr-0005pa-Vs@melo.openembedded.org>
Date: Mon, 25 Oct 2010 01:46:35 +0200
Message-ID: <AANLkTik3T-stxaGKKK5Gg1u65qHFDuDWPW8TzpHq9AE6@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Frans Meulenbroeks : bootmenu/bootmenu_0.7.bb: removed unneeded EXTRA_OEMAKE
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
X-List-Received-Date: Sun, 24 Oct 2010 23:47:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

ERROR: '/oe/openembedded/recipes/bootmenu/bootmenu_0.7.bb' failed
ERROR: QA Issue with bootmenu: non debug package contains .debug
directory: bootmenu path
/work/armv4-angstrom-linux-gnueabi/bootmenu-0.7-r0/packages-split/bootmenu/usr/share/bootmenu/.debug/ncurses.so
ERROR: QA Issue with bootmenu: non debug package contains .debug
directory: bootmenu path
/work/armv4-angstrom-linux-gnueabi/bootmenu-0.7-r0/packages-split/bootmenu/usr/share/bootmenu/.debug/basic.so
ERROR: QA run found fatal errors. Please consider fixing them.

Still builds.

Andrea


