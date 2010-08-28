Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OpMoz-0002jj-Bl
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 16:55:53 +0200
Received: by wyg36 with SMTP id 36so4370604wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 07:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=xy7IbibceSp5LubMXTZb7HUjidSD7a5LmK1+SffuYQA=;
	b=vJ4wF0+Mq9EGAKYtfFKgie++kxALm+Hhlcp55fuTITVhMwDcmHHYzUBbhmvvJoIoVR
	kFFYoFmg2CVhZSy6NmV3fV6U7p8N8gBYNk+OdNqAdgokvfGvyf6ifAapxpwtDnK7R+bz
	BnjT8r3AApzeuCwhl3Cs/6FMp4QASg9Qk+Rnc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Rd/rS2PS2ChQNIpCDkx49YinhneP8LpRfvhv0ZUk8vhIDjzu9pXOw/2tfU9dyMJL74
	KFOpFWuWoRlvT1tbBem3IiwVHw6U+4l1ujDxuyW58Cs1PKBaW9rQd3q/JLZmytvj5shh
	ufdaJFhZUmjCjKSXFKBeX6BHmOFv71V1bTywY=
Received: by 10.216.4.19 with SMTP id 19mr2389904wei.110.1283007323219; Sat,
	28 Aug 2010 07:55:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Sat, 28 Aug 2010 07:55:03 -0700 (PDT)
In-Reply-To: <i5b7mm$iso$1@dough.gmane.org>
References: <AANLkTinFXpPdAkd79h94z70m_8MbamLd48pzR4sLQs34@mail.gmail.com>
	<i5b7mm$iso$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 28 Aug 2010 07:55:03 -0700
X-Google-Sender-Auth: T4zNoBkI1VH6t5gI87RvvlMUcIQ
Message-ID: <AANLkTimui4vCRmhufXA9MGyjWWstr7C=O9tAErBsa-uv@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFD] increased dependency checking
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
X-List-Received-Date: Sat, 28 Aug 2010 14:55:53 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 28, 2010 at 7:49 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> As usual you're completely ignoring the impact of this when using
> package management, which is probably why you still are clueless why
> your openssl fiasco is so much work to fix for distro maintainers.


If someone is missing something, then explain it to them.  Whining and
calling people clueless does absolutely nothing for the project but alienate
developers.  If you need to take out your frustration, buy a punching bag,
don't do it on the mailing list, please.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

