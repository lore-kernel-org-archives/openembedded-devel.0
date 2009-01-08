Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LL3wu-00018y-0P
	for openembedded-devel@openembedded.org; Fri, 09 Jan 2009 00:06:06 +0100
Received: by qw-out-1920.google.com with SMTP id 5so4367506qwc.6
	for <openembedded-devel@openembedded.org>;
	Thu, 08 Jan 2009 14:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=9W/ibUuFbPY4r/VVHpM57vQrfSC89KEzSTcG1xTcU1Q=;
	b=NlnVw++XF/KKijZaX63nKfy/2OiC1+zJoDkMwkwYsDXpxhPfdLhpzYgzWE033oBndf
	sREU/6VsfFFgbMcUmcNd0cZg04kJTX5plDsQ9iyjVdRSiTCFcqPQfYxrr4rlQZOqnfBo
	rNQiGKxcl4URcKdcVFa126pL0frdawAYcm6XU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=krFYylrQKE01u6Aqj08MPdH+VXwGcV5sfBjOsraLKb2hkfFyJboyOg5Z9q8KM8FkP6
	b7gRg/0fmUaAQnKp5HGV0If5JAMIzRqI6fnRZEoFmNibuMt2COl1aXfg+LOsTMygm2xH
	ock71+61K1IO479mppHIjf+q/LwcjXFhvsw54=
Received: by 10.214.150.12 with SMTP id x12mr22107563qad.95.1231455589403;
	Thu, 08 Jan 2009 14:59:49 -0800 (PST)
Received: by 10.215.66.18 with HTTP; Thu, 8 Jan 2009 14:59:49 -0800 (PST)
Message-ID: <c384c5ea0901081459h64fd1bdeidbf074bd4df88ac5@mail.gmail.com>
Date: Thu, 8 Jan 2009 23:59:49 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1231287266.5330.113.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
	<1230858713.10424.4.camel@dax.rpnet.com>
	<20090102043755.GC400@smtp.west.cox.net>
	<d2b9ea600901050631h5eda6de5yee190bf0841e5b15@mail.gmail.com>
	<gjtg1m$rsd$1@ger.gmane.org>
	<d2b9ea600901061251n67c641a4ie03b8a552f3c4990@mail.gmail.com>
	<1231287266.5330.113.camel@dax.rpnet.com>
Cc: openembedded-devel@openembedded.org
Subject: Re: Native/Cross/SDK rethink (Was: Re: RFC: "Virtual" native and sdk recipes)
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
X-List-Received-Date: Thu, 08 Jan 2009 23:06:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Richard,

On Wed, Jan 7, 2009 at 1:14 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Tue, 2009-01-06 at 21:51 +0100, Esben Haabendal wrote:
>> On Mon, Jan 5, 2009 at 6:29 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>>
> Also, for the record I've played a large part in developing the sdk and
> meta-toolchain stuff so I'm at least partially responsible for the
> current mess. I do now think I got that wrong though.
>
The words of a true perfectionist, always learning from daring steps
in the past :-)

The core toolchain and SDK stuff bits you have contributed are very
much appreciated, so you are kindly invited to "mess it up" again.

Regards,
-- 
Leon


