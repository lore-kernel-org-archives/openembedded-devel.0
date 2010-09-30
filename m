Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P1Q98-0003gf-Gh
	for openembedded-devel@openembedded.org; Thu, 30 Sep 2010 22:54:35 +0200
Received: by iwn2 with SMTP id 2so2943589iwn.6
	for <openembedded-devel@openembedded.org>;
	Thu, 30 Sep 2010 13:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=zyDFbnSlPoM3Pf0ivbZ+f7HuBdB/W3PgDfgh70qo9MM=;
	b=lVaq1LQTbnid0PjYz2ZGkNFIDURhbS+LOZEhdeJGSmhffO6UEHCpj2pm1XrbcrWk4L
	uLCWjiWS9NzsP1LeF1i5U2YAknTJPkz9IDq7CLbN93VBbCVd7KKir4npddHnrPqm953v
	RCPx2Jk0jS9GgQh7xtMxaY1XrPVRX1ZO+xvRs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=rRXGEEhj4YrH+J1VlMgfDctXENbkZQjulZfXldvtGvzPgmSX05ly/A67ZLdRiG8kz5
	wrsV2+ZkVjBdiVbmV2b6HJ/PUxCxucaISxtY2ceVedmw36cfIHt2WINvBfYsgOZ0KBX9
	F7VqzbxRaQrIuw4CBgPnAGwjZCEwcdDz4dY7U=
MIME-Version: 1.0
Received: by 10.231.14.140 with SMTP id g12mr4272117iba.84.1285880057171; Thu,
	30 Sep 2010 13:54:17 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 30 Sep 2010 13:54:16 -0700 (PDT)
In-Reply-To: <AANLkTin7JTEHEx728sX9-qZwswamNEVW8WdbxgQ9rLOM@mail.gmail.com>
References: <AANLkTin7JTEHEx728sX9-qZwswamNEVW8WdbxgQ9rLOM@mail.gmail.com>
Date: Thu, 30 Sep 2010 22:54:16 +0200
Message-ID: <AANLkTi=TKUr0mZaTcXBHywhDM2TaPvsN5ofy2MHsuc=2@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc 4.5: unpackaged files
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
X-List-Received-Date: Thu, 30 Sep 2010 20:54:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Oops, wrote too early. thre seems to be a lot more:

NOTE:   /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv5te/libexec/gcc/arm-oe-linux-gnueabi/4.5.2/lto1
NOTE:   /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv5te/libexec/gcc/arm-oe-linux-gnueabi/4.5.2/cc1plus
NOTE:   /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv5te/libexec/gcc/arm-oe-linux-gnueabi/4.5.2/cc1obj
NOTE:   /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv5te/libexec/gcc/arm-oe-linux-gnueabi/4.5.2/collect2
NOTE:   /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv5te/libexec/gcc/arm-oe-linux-gnueabi/4.5.2/cc1
NOTE:   /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv5te/libexec/gcc/arm-oe-linux-gnueabi/4.5.2/lto-wrapper
NOTE:   /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv5te/libexec/gcc/arm-oe-linux-gnueabi/4.5.2/install-tools/fixinc.sh
NOTE:   /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv5te/libexec/gcc/arm-oe-linux-gnueabi/4.5.2/install-tools/mkheaders
NOTE:   /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv5te/libexec/gcc/arm-oe-linux-gnueabi/4.5.2/install-tools/fixincl
NOTE:   /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv5te/libexec/gcc/arm-oe-linux-gnueabi/4.5.2/install-tools/mkinstalldirs
NOTE:   /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv5te/arm-oe-linux-gnueabi/include/c++/4.5.2/sstream
NOTE:   /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv5te/arm-oe-linux-gnueabi/include/c++/4.5.2/exception_defines.h
NOTE:   /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv5te/arm-oe-linux-gnueabi/include/c++/4.5.2/cerrno
NOTE:   /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv5te/arm-oe-linux-gnueabi/include/c++/4.5.2/cstddef
NOTE:   /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv5te/arm-oe-linux-gnueabi/include/c++/4.5.2/stdexcept
NOTE:   /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv5te/arm-oe-linux-gnueabi/include/c++/4.5.2/algorithm
....

and much more c++ files.

Frans


