Received: from [209.85.217.20] (helo=mail-gx0-f20.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Knawc-0000dc-5N
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Oct 2008 17:27:22 +0200
Received: by gxk13 with SMTP id 13so8089973gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Oct 2008 08:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=7TfglhfYIElFcQ25as/QzZ/GK2QSiRVFcXjJU8lTHo8=;
	b=er4w96w8xqoBjxlj4afsUvW3fchnJ09uNK6QYoU6xTsNowV+Z9OJBuq/+2nQ4Y5PL2
	gfss+fKpqVdAXi0oymql/q3bbefF1CQJiF+EKxUppYRFx3WokDFb7LCQZJGFBUZfKYJ8
	GzTfd8hGuxwaWHg3+XC3yV0k3wLTt3YcvYQKE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=tFGler2e/6Cmvg3iDB176hCE4a66wwYmm0VfLCr7cOqsC2G8vEmSPZA4HHC36BvsfX
	tLxlYPVPc3R7zjNQpnLXZm9hqWcVxEGi3Z0P1gy3vjYFe5JWT31DOJrCavPF+6Fx+Vrz
	oJaMJsv9cFdRJWK/qEHoCDf4z8ddXnL+2q5po=
Received: by 10.100.253.5 with SMTP id a5mr1769729ani.74.1223479361259;
	Wed, 08 Oct 2008 08:22:41 -0700 (PDT)
Received: by 10.100.174.18 with HTTP; Wed, 8 Oct 2008 08:22:41 -0700 (PDT)
Message-ID: <c384c5ea0810080822oe486250x482420415e610fc1@mail.gmail.com>
Date: Wed, 8 Oct 2008 17:22:41 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1223476143.10726.8.camel@aquilonia>
MIME-Version: 1.0
References: <c384c5ea0810080646j6156c19ag284702150c5abe9f@mail.gmail.com>
	<48ECC162.4070607@balister.org> <1223476143.10726.8.camel@aquilonia>
Subject: Re: RFC: branch off the last stable branch under monotone?
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
X-List-Received-Date: Wed, 08 Oct 2008 15:27:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Wed, Oct 8, 2008 at 4:29 PM, Graeme Gregory <dp@xora.org.uk> wrote:
> On Wed, 2008-10-08 at 10:19 -0400, Philip Balister wrote:
>> My understanding is that we can make the branch in mtn now, and it will
>> be converted with the rest of the repository when it is converted to
>> git, so the stable branch will also convert to git at that time.
>
> That doesn't make sense to me. So we are creating a new stable branch
> just because a random thing is happening next weds. Is OE even in a fit
> state at the moment for a stable branch? We can just randomly select a
> day.
>
- The argument I gave was the fact that that stable branch would be
maintained under monotone, so with that argument, I would not consider
the transition to GIT a random event.
- 'OE in fit state' is hard to tell given the numerous variables, but
yes, the infrastructure seems stable to me.
- I did not mean read-only, but a maintained stable branch under monotone.

Anyhow, given the responses I think the concensus/answer to my
question is 'no, should not'.

Thanks for the replies,
-- 
Leon


