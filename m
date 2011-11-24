Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RTXKG-000671-Iv
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 12:18:45 +0100
Received: by yenm2 with SMTP id m2so2440869yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 03:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=5U3LpNSAME9k5dNYh+Dhj8kYkKMhLZ+1waN8osYlSBc=;
	b=Or1mqAX0fpPxDivaiEigzW8c80HqxSjCGrM6J/DOPMWoFG2zHsQd6eogz/diuF9VG7
	eyeMsIa6kp47XMebin0i5YPTgBrSDsIYa0yPig61KpJ3rrgtdk/+6qjAjBk/isbZFGA/
	V5GMOc97jMKvCf8ZApjTBRd5ZEOo5GKkFHdHw=
MIME-Version: 1.0
Received: by 10.236.191.5 with SMTP id f5mr40795484yhn.122.1322133131010; Thu,
	24 Nov 2011 03:12:11 -0800 (PST)
Received: by 10.150.229.21 with HTTP; Thu, 24 Nov 2011 03:12:10 -0800 (PST)
In-Reply-To: <1864854.crejHBLR9b@helios>
References: <cover.1321575642.git.andrea.adami@gmail.com>
	<CAAQYJAs=jxLf8moiFwNyg3Rnqxe2EHe4c4ARrZW3ms2VrS=5JQ@mail.gmail.com>
	<CA+chaQeWRbSCXk_vxsB7Nfoarh11fTSAZsteKf62T2DaSt0-xw@mail.gmail.com>
	<1864854.crejHBLR9b@helios>
Date: Thu, 24 Nov 2011 12:12:10 +0100
Message-ID: <CAAQYJAtxpRAOPg62aqFwNkQPgGTeLOU6-FfOiDtsvAgdrRFkVA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH 5/5] linux: remove unused git version
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
X-List-Received-Date: Thu, 24 Nov 2011 11:18:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 24, 2011 at 10:43 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 24 November 2011 10:24:44 Martin Jansa wrote:
>> Are you going to refresh and refactor something or is this patchset
>> fine if Paul applies only first 3? Because your 3.1.2 patch says it
>> should be applied on top of this..
>>
>> If you or Paul want I can send pull request with first 3 from this +
>> 3.1.2 and my changes to linux-kexecboot.inc + 3.2.0-rc3, because I
>> have it all in jansa/spitz anyway.

Patch is now archived in patchwork, marked as rejected.

>
> We discovered last night that we can't move hx4700 to 3.1 because the
> necessary patches don't apply. However as of this morning I do now have
> patches against 3.2.0-rc2 (hopefully they also apply against rc3).
>
> My suggestion would be to produce a new set of patches that only affects the
> Zaurus machines and we can handle the iPAQs separately.

Martin already took care of that ;)


>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


Regards

Andrea


