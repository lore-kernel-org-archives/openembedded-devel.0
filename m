Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1OpiuX-0006ee-BT
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 16:31:05 +0200
Received: by wyg36 with SMTP id 36so5242822wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 07:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=d53V1OZn8u/D1WlEGDzDXwu/BmmkWXRBpA9RKMlCvDU=;
	b=LIFQBblglj44mvI+evDbONlXVbpaiL4Px5LYNztHyjnz00ppe6QMOmPX0974dHbvgV
	4f+MlT/T2oe1wn7OmgPNKmQqz83ZpDYiju0edPW/qm2YKhaD9fPB4vanm347RyXxkyF0
	SOIhLNCHYld12O/FG1xrcJNk2cYHMaVFUOvG8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=poxwb1/27ESV+lx03PJZgOR8+wXgnHXWsX38Lm3qRuW5SzzJ3f6jbBl/tMw4JKNQq7
	o5UJ1gMq6hTgrxHo94ZpGGEewtXMcoGM00KdeXMoWYNjNoj7vhvnNz44pNsvtpFzXw16
	/9wQ6wxb3U5EFxF0MfAzTjqCCC48QAiZI2gds=
MIME-Version: 1.0
Received: by 10.227.141.138 with SMTP id m10mr3558629wbu.20.1283092234331;
	Sun, 29 Aug 2010 07:30:34 -0700 (PDT)
Received: by 10.227.142.79 with HTTP; Sun, 29 Aug 2010 07:30:34 -0700 (PDT)
In-Reply-To: <AANLkTimH2YnW3CnLFxa6NyNCeC0-jNqy0dhDXS_ddWX_@mail.gmail.com>
References: <AANLkTinvhMiZhHC4GrR8Muf-7oPa-j3zBeDWCZrkTd-z@mail.gmail.com>
	<AANLkTimH2YnW3CnLFxa6NyNCeC0-jNqy0dhDXS_ddWX_@mail.gmail.com>
Date: Sun, 29 Aug 2010 16:30:34 +0200
Message-ID: <AANLkTinJ7rUj8jq=PYeVXk7yZiLB6AtxQm9JKDcXZswR@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Simple srctree example seems not depend on toolchain
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
X-List-Received-Date: Sun, 29 Aug 2010 14:31:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Sun, Aug 29, 2010 at 12:27 AM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> On Sat, Aug 28, 2010 at 10:46 PM, Leon Woestenberg
> <leon.woestenberg@gmail.com> wrote:
>> in an attempt to learn how to use srctree I am hitting either 1) an
>> oversight on my behalf or 2) a bug in srctree.bbclass 3) something
>> else
>>
> After further debugging I am more sure I'm seeing wrong behaviour from
> srctree.bbclass.
>

This was a bogus report. I thought I was working against latest OE
GIT, but in fact, it seems the GIT service is unreliable currently and
I have probably hit an aborted pull.
Download speed from GIT is ~20 kB/s.

I'm interested in adding this helloworld2 as helloworld-srctree as an
srctree example.

Regards,
-- 
Leon


