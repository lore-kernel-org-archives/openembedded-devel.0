Received: from mail-bw0-f44.google.com ([209.85.214.44])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PSml7-0002uT-PD
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 09:30:50 +0100
Received: by bwz12 with SMTP id 12so1873306bwz.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 00:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=VygPIGNQQ61iAAG6OJ+eFLw1ecwrS5lgS/SCxDd0UM4=;
	b=LJI+AnhVDEz4fqSrwxidB5ReFWsjjCD9quAz/OSXn5B272NZz6NG2S2OXHY+zwqMdI
	BDMaQWQd9nLbXIfLCUcLimw+cXdQFNrQ4rIbDEkHWKXpaQ0obtPRS/ybQ0y4Izt+4Apz
	tdJVFp+vEmmA0ONYYPRqWNJzk+8dZiMJvEmLQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NIT6fdX1veU4TtVklNu7X8S1hlVQZQLcDB2+55+glspdLdI0owO0mMNEyBp40NVGrN
	Y7l5gHH9wRCEnNVnOhtH3NT4Zp81Yvn/XqR0v0/14Mz9sOnuqUKPFv6vN8BWRfXsxIxe
	pwD0FaBuwBdJVrn6RGe4Aumd9if/k5x8TV7Vs=
Received: by 10.204.119.15 with SMTP id x15mr6550248bkq.56.1292401754342;
	Wed, 15 Dec 2010 00:29:14 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a6sm1366856fak.1.2010.12.15.00.29.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Dec 2010 00:29:12 -0800 (PST)
Date: Wed, 15 Dec 2010 09:29:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101215082910.GA3238@jama>
References: <E1PR45K-0000jK-SU@melo.openembedded.org>
	<01EE9A12-BE87-4EF6-9F0B-EAA20A1DBAAE@vanille-media.de>
	<4D077186.2050708@balister.org> <20101214133729.GE6662@jama>
	<ie9tg4$9t0$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ie9tg4$9t0$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.44
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Philip Balister : i2c-tools : Stage i2c-dev.h header as i2c-dev-user.h.
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
X-List-Received-Date: Wed, 15 Dec 2010 08:30:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 15, 2010 at 09:16:04AM +0100, Koen Kooi wrote:
> What are other distributions based on? Pixie dust?

I meant distritubions where end-user normally gets only recipes how to build from source
on his machine instead of installing prebuilt binary packages shipped by distribution.

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


