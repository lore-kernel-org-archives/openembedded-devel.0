Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KQXLA-0006Cb-Ov
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Aug 2008 02:57:24 +0200
Received: by rv-out-0708.google.com with SMTP id f25so3307764rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Aug 2008 17:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=vDJlSrlc7zb6WbhOe5Y7NBLmU9qoZxUkKjAK7dKzbxc=;
	b=CgKUzCWVI2GRAaO4s3w6W+IyVbDxjUgE8KdNvcRFHDlhppf6oM9wOD0rhpKvRtDbMb
	0ClLUU+rlSEFeugDCZdE0L0NbCbN07jUp2DCl0foMczs2HBYDZV6hnjO3LXPm9EkqBTc
	ndVvPWqnbf0+WCQHd1R79eI/XvDJxfi36ACJ8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=MVFskvqgmbmOupeOTbmu/+r1Y0gIXc6NUsczR9PvZFTTXpsW23kde+lQ91NahxKi/e
	r01/53oYtA+gkMsJsQmz30LTplMqbIbnps5NrJ+9A+HYEaPfaIjXJyANwAw6eIKg+Vx5
	c6lRqTQ6Ue0MHLiNiq2RASr8qiVYzCO69GQpI=
Received: by 10.114.147.1 with SMTP id u1mr259181wad.208.1217984240930;
	Tue, 05 Aug 2008 17:57:20 -0700 (PDT)
Received: by 10.114.149.20 with HTTP; Tue, 5 Aug 2008 17:57:20 -0700 (PDT)
Message-ID: <19c1b8a90808051757s7127b5eo5d289a667d732f69@mail.gmail.com>
Date: Tue, 5 Aug 2008 17:57:20 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g79gss$vrd$1@ger.gmane.org>
MIME-Version: 1.0
References: <1217924342.25732.163.camel@lenovo.internal.reciva.com>
	<g79ade$amq$1@ger.gmane.org>
	<1217938413.24777.148.camel@mill.internal.reciva.com>
	<g79gss$vrd$1@ger.gmane.org>
Subject: Re: openmp in gcc-cross
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
X-List-Received-Date: Wed, 06 Aug 2008 00:57:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I also saw the error long back on arm I dont remember the error
anymore. This was with gcc 4.2.1 or some such. You can enable it may
be it builds now its been long. Open MP on an embedded system might be
overkill. What is the error you are getting ? Can gettext build
without libgomp. How will it compile with older compilers ?

Thanks

-Khem

On Tue, Aug 5, 2008 at 5:26 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Phil Blundell wrote:
>>
>> On Tue, 2008-08-05 at 12:35 +0200, Koen Kooi wrote:
>>>
>>> It broke builds for some people (but not all).
>>
>> What was the breakage?  It seems like it would be a better idea to fix
>> that than just to disable it.
>
> I wasn't one of the people seeing the breakage, so I'll leave it to the
> people that reported to respond.
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


