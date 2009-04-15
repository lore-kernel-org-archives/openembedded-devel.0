Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Lu5K7-0006wB-OL
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 15:38:45 +0200
Received: by bwz19 with SMTP id 19so2886013bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5+lGL8KHcelq8mZ8erOsMkxO6BbRm9SoPhOxg2IMDAk=;
	b=S71PQbpZqSiIOjJ6kzvASLIIdlnWlBUIISJ9Tdx3aTRGuSeCVFUCVSqNx1lyfYrDYS
	VEpDy7wGSZ/VWZvzJhjv4Ctort7NMDBbBWkQS7vBqVC6632qqYCwycQWY0RVaTmoHaPI
	wdZOfg85J2o1MnolKZZoDf39NVqGiM7mb9koQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vJNRbONYyMnUyVlH3hTGfRJi4KXNn0K/sIw8YHFTbiXTCN7fvE2V4UDZuGPbmCJsnU
	IkVsQQdz5/rPNAMUbCIqvKIy3AgOoCqYEngg/CQ/xBYPGg+0ocB9dj2kL9MqH8jjc47O
	cfOLxlcI+ivF83lpWUtBfsV7LGIljgIhua2BM=
MIME-Version: 1.0
Received: by 10.223.127.8 with SMTP id e8mr64776fas.95.1239802494304; Wed, 15 
	Apr 2009 06:34:54 -0700 (PDT)
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF759@hiob.intern.dresearch.de>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF746@hiob.intern.dresearch.de>
	<20090326175845.GA6756@denix.org>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF74B@hiob.intern.dresearch.de>
	<49CCC52F.2000009@balister.org>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF759@hiob.intern.dresearch.de>
Date: Wed, 15 Apr 2009 15:34:54 +0200
Message-ID: <d1b08f940904150634scd9c918oc6812c80d4bfdeaa@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.219
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: u-boot update question
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
X-List-Received-Date: Wed, 15 Apr 2009 13:38:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

IMHO this adds bloat to the already over-populated /u-boot dir...

> This would be better than using the git recipe, since someone
> may change the git tag at a later date.

I don't see any risk...just do like other machines

SRC_URI_xy
SRCREV_xy

My 2 cents


Andrea


