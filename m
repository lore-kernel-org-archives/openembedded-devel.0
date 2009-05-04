Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1M0rDZ-0004P4-Ri
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 May 2009 07:59:57 +0200
Received: by bwz19 with SMTP id 19so4695625bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 May 2009 22:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=yZAJ76cQz5yfAIfUUOqcB0PYtb3uDh/dPcUD/XM7jRQ=;
	b=MHl/nabaBeFwrOjGWwOlB648s7oFh3XeIrBchcQqSLJgV1MUd/uGONUIrnBiJwhiAB
	7G7bCekfZc0rqXfrN/wXmE4t+aV7ETu5ghI/HVHSvHXe4PqjjEmJbxZNpnXkCI0itHiP
	Zu3wB4BkjuRGhB18B3qu8itzO3hgzcGOiBPks=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:message-id;
	b=nGwmcgf2LsjeEWMun7jeooUyuDP6yDbFA1XOzjg+64OFkAQha/n0rX+yfwbiewG/CK
	vmb8JBMcykwMOsT/Vxu+yzbZmxhntufGFJpVaKO+Z4uCbLSGljUljj+u3e4TDRomGmRc
	bZbwyxy1PrkuiUJEWwSbFcxKLK+5txGmD0yGA=
Received: by 10.103.168.5 with SMTP id v5mr3240625muo.77.1241416450119;
	Sun, 03 May 2009 22:54:10 -0700 (PDT)
Received: from is.home (93-81-142-7.broadband.corbina.ru [93.81.142.7])
	by mx.google.com with ESMTPS id e10sm15168183muf.44.2009.05.03.22.54.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 03 May 2009 22:54:09 -0700 (PDT)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 4 May 2009 09:54:04 +0400
User-Agent: KMail/1.9.10
References: <20090503233009.B15601880DC@amethyst.openembedded.net>
	<19c1b8a90905032001x496ed10cp7d132d2ae176572a@mail.gmail.com>
	<20090504032113.GG7973@smtp.west.cox.net>
In-Reply-To: <20090504032113.GG7973@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200905040954.04468.jay4mail@gmail.com>
Subject: Re: [oe-commits] Tom Rini : base.bbclass: check_gcc3 needs to	check for gcc-3.4.6 first.
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
X-List-Received-Date: Mon, 04 May 2009 05:59:58 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!

> And I really wish qemu would get fixed / rewritten to work with some
> sort of modern compiler, yeah :(

Qemu 0.10.0 and higher (current is 0.10.3) require no gcc3.x to build. Look 
here: http://www.nongnu.org/qemu/changelog.html

-- 
Yuri Bushmelev


