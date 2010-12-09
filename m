Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PQkvQ-0002ZB-Dd
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 19:09:05 +0100
Received: by gxk21 with SMTP id 21so1601128gxk.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Dec 2010 10:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=ns//qkV4ZqZmHTpAABwUTDQbYCtKpUJjbBMmScV89iE=;
	b=QtWPpL+sJe7QUZ5y0VcTeuKToidJbjaHTr+WA/GtxrUCy69/o4+j77etZ5mSaiJvH/
	npm/r3uWttF2m6Muwy14gm0IuZ2pK6tgq1o/OWw2wODfYk7YdZApLJrrKoHwAWRrQ8ha
	fTcV8jf3FSn6s2sPgwcLsHF0+X+0XrPx1dJh0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=E6hyL6hs1fNoTi/3UWRlAhmM7G41L9zpsX5HVmbm6tDE8FvYqOH/uKoKgx6x6XKlJ1
	VyrE991WXIJWFr2jQK9uREkg8RBwQSLDEHGinz2AHtcY7S43pk02/MqaEPAOI1S1hH64
	2ALeY2X/RcA0Nnv/cgKMFUWXW1sDNTcZy2Tc0=
Received: by 10.91.163.27 with SMTP id q27mr13720382ago.139.1291918052156;
	Thu, 09 Dec 2010 10:07:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Thu, 9 Dec 2010 10:07:11 -0800 (PST)
In-Reply-To: <4D011A13.5000202@balister.org>
References: <4D011A13.5000202@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Dec 2010 10:07:11 -0800
Message-ID: <AANLkTikOd+EoS+Xx0kngmfCMBeWy4f5qfK7PtuP47FGn@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.179
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Revert commit 8da17586c547f365ae667eb2608ba89a1c375afc
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
X-List-Received-Date: Thu, 09 Dec 2010 18:09:05 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 9, 2010 at 10:04 AM, Philip Balister <philip@balister.org> wrote:
> I am going to revert commit 8da17586c547f365ae667eb2608ba89a1c375afc. I have
> talked with Tom and he agrees this is the best course of action for now.
>
> The commit breaks autoconf running on the target.

Thanks for notifying to the ml. Please go ahead.

>
> Philip
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


