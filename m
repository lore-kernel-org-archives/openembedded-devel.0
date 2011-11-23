Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTLMW-0004AM-Gy
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Nov 2011 23:32:16 +0100
Received: by ghy10 with SMTP id 10so1925250ghy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2011 14:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Is4n8hz77faT0rDjFwvqmSWK3ee7Ha6zJXB7q8+QDd4=;
	b=syiCqUsg4z1x3L0FcFNqC7gGR8EHVFY4/NpoOaeSGySTV9t/YP4Zz4o4Y8vLPvHL9S
	7H6T7R/8Zy7m4g3hUuspSe25yHAheeeXsnLPLQJpxUpJLG53ZPqbv6GNguw4/Bjg9ey5
	QCkz+D/DW9bF2HGLxFvqyVXaS2vF/bbJhKAu0=
Received: by 10.152.104.236 with SMTP id gh12mr16065767lab.49.1322087143112;
	Wed, 23 Nov 2011 14:25:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 23 Nov 2011 14:25:12 -0800 (PST)
In-Reply-To: <CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2011 14:25:12 -0800
Message-ID: <CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Wed, 23 Nov 2011 22:32:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2011 at 1:18 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/11/23 Khem Raj <raj.khem@gmail.com>
>
>> On Thu, Oct 27, 2011 at 3:53 AM, Mats K=C3=A4rrman <Mats.Karrman@tritech=
.se>
>> wrote:
>> > Hi,
>> >
>> > Are there any plans for new releases and/or maintenance branches of OE
>> classic?
>> >
>>
>> 2011.03-maintenance is the last release of OE classic. As long as the
>> branch is maintained
>>
>> _
>>
>> Related: I noticed TSC plans to discuss on whether or not to make oe
> classic read only.
>
> I'd like to suggest leaving it open for those of us that are still using
> it.

2011.03-maintenance branch is maintained and that would be place to go.


> For instance I have still products that are based on OE classic. If there
> is a problem that is of a generic nature, I'm more than happy to submit
> patches so others in the same situation can benefit from it.
> (actually I have one pending with a new version of netsnmp; the current
> recipe does not build with uclibc, whereas the latest version of netsnmp
> does; found/fixed this today, but haven't had time to make a commit)
>
> And if there is no interest any more it'll eventually die. But as of now =
I
> do see people working on/with it (see the commit log).

those fixes are intended for 2011.03-maintenance which go into master and t=
hen
get cherry-picked

>
> Frans.
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


