Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OjfGZ-0002ey-94
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 23:24:48 +0200
Received: by wyb38 with SMTP id 38so1939736wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Aug 2010 14:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=rVy8eUsfwt50MVz3dyxuGuJVOawIrlQNPosE+NlNM40=;
	b=P2FWG0qhBZNBrWuZ23MJO7qev6tOwOK/o8B+kkoM0JsDKYSA76rzkhuXUFJ74JFS88
	bNar+HEfTi0Ev0xkWG0XrKB2uHSXXtlkwH5sA4o7ZjK6XiT7lyMqo4fr1Nkw/SrAz70S
	RNda5InbkIpa/DfPljin6/VDGuVwtXTTorzas=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=mD2i4GHnm6gHznQiMSMtfH7T6ekLJcepf2fFuEoM2UBd95gdk/n7UWYecbgO1XU7qj
	oOMFITEap6NvLfByXkIu29+ysEkmjmfkLzdSsJc3Hw2Oe8CRcn8EeOWZoMw/FzI02aSc
	R9hulk0IYnep7MGaUNIbvG2NSpce25uxk8eSU=
MIME-Version: 1.0
Received: by 10.216.167.72 with SMTP id h50mr411819wel.103.1281648274086; Thu,
	12 Aug 2010 14:24:34 -0700 (PDT)
Received: by 10.216.234.166 with HTTP; Thu, 12 Aug 2010 14:24:33 -0700 (PDT)
In-Reply-To: <AANLkTin4OUg1S1GYa0H8v1qHyvY77mHPVGF06=DkC5s+@mail.gmail.com>
References: <1281571508-3792-1-git-send-email-raj.khem@gmail.com>
	<AANLkTin4OUg1S1GYa0H8v1qHyvY77mHPVGF06=DkC5s+@mail.gmail.com>
Date: Thu, 12 Aug 2010 17:24:33 -0400
Message-ID: <AANLkTimvB1aOwZzpbyoh_kskiLh5ucH1vHJG_bzpM8Gv@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] srctree.bbclass: Also account fot deptask
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
X-List-Received-Date: Thu, 12 Aug 2010 21:24:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 12, 2010 at 4:40 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Wed, Aug 11, 2010 at 5:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> * Use exec_func instead of exec_task
>> * Use a new name for meta task
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>
> Acked-by: Chris Larson <chris_larson@mentor.com>

Acked-by: Cliff Brake <cbrake@bec-systems.com>

-- 
=================
http://bec-systems.com


