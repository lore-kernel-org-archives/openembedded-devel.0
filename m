Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id CC7B56D159
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2013 12:58:25 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id w5so1648538vbf.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2013 04:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=TpW/caOskWxK/BJ0psuSaKd9rSnmcPhpV7dyqfci2y4=;
	b=SS51wk88FRoUFfuae9dN+kBS5fInBXEDKOKhDWX4iQZr2e9/5PTVIgijgXpTIbOBZV
	bK8LTZLptD86/Nt6JqEWYe4udvBdYSlla4kzCqthirsMOmVOKH7wTOyAjBnrAab2oVZ+
	IyZRpwyDkathcSdDuNG6En/noA1aAgiFFu17HQYOqtbbRZ1nrmuxxhfHc2ZMarzBnU/J
	yxNT93ndTM0GmEhm/njxAYVHECS4wttPjqS7Ild0Q5+/JkgEV5JK13aQMEP9mRP2wlE7
	FIpUW3bjMYQHnMTk07gtKU2OhyRcKe9/IGGdNUzgYMBg0LgHyl7O+TvSsjZBZJexDn21
	nbtg==
MIME-Version: 1.0
X-Received: by 10.58.133.77 with SMTP id pa13mr616951veb.21.1384433907058;
	Thu, 14 Nov 2013 04:58:27 -0800 (PST)
Received: by 10.52.106.202 with HTTP; Thu, 14 Nov 2013 04:58:26 -0800 (PST)
In-Reply-To: <11078227.Ap2jLt1X9L@helios>
References: <CAFeBWL4xeq+4cL9gvnCDSU1Va8edf+1zT+G7BfYto7Yvp8HXXQ@mail.gmail.com>
	<CAFeBWL4R46JrAhCfe8GZXTipHAp_i+Fcu_BTTTuopfdfKf9r5g@mail.gmail.com>
	<11078227.Ap2jLt1X9L@helios>
Date: Thu, 14 Nov 2013 13:58:26 +0100
Message-ID: <CALbNGRSiUdEzPLoP5Le58QDV1cqKcLRRyWxxTGyG4dKu7tqB3Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: libmpd-11.8.17 gets 404 Not Found
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Nov 2013 12:58:27 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 14, 2013 at 12:57 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tuesday 12 November 2013 19:14:22 Adam Lee wrote:
>> Sorry, I shouldn't have mentioned anything about updating to Dora from
>> Dylan.
>> This 404 is happening in Dylan build.
>>
>> On Tue, Nov 12, 2013 at 7:07 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
>> > Hello everyone, my first post here. Not sure if I am posting at the right
>> > place.
>> > I am updating my meta layer to Dora from Dylan. At the moment,
>> > libmpd-11.8.17 is getting 404 Not Found. It is here -
>> > http://downloads.sourceforge.net/musicpd/libmpd/11.8.17/libmpd-11.8.17.tar
>> > .gz .
>> >
>> > Not sure if it's a temporary issue. Anyone else ran into this?
>
> Looks like it's vanished upstream... :/ I'm not familiar with this particular
> project and I can't tell what's going on with this particular component, but I
> did find an alternative download location:
>
> http://download.sarine.nl/Programs/gmpc/11.8/libmpd-11.8.17.tar.gz
>
> Until we figure out what's happened upstream we can add this to the OE source
> mirror. Tom, could you please take care of that?
>
> Cheers,
> Paul
>
I included (lib)mpd and am using it from time to time with XFCE environment.

Somehow libmpd turned obsolete and libmpd's homepage is linked to mpd.
Since I don't have time for it at the moment:

Could somebody please fix download location?

As soon as I have some spare cycles I will take care how to fix properly.

Andreas

