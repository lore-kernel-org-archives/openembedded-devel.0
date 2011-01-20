Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1Pg3VE-0003VU-4J
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 00:01:16 +0100
Received: by wwi17 with SMTP id 17so1154134wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 15:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Qotk9fj0ermwcE+HAIVekvrSNA/pQT4PIgZaWO6RsQU=;
	b=QCaNwNdalLgt01KOfKXFK+dg7x7ZF/+8MKfq4Ve+oloFrHgxal23oNYh4nBjguZ5zT
	KCuvlXqANYcbIcSeLuvn0ioD50NuKkagxkzSuO7v7c19s/uMCC/swPyTDiiKy3lYPdrQ
	Vo5cLQa01lKRVYaDDwHsLHnkKc8/iaFgrBtvw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=aqYRluMKTrADAR3eM2DwwU5n3+wt7hMSrl7j/nF6CFMfKcfvdLWobywtligCjoCqbh
	FTdQQKPaKkshdJVYyTEz69qOSIPahWkW4A1XU9UN6DfN9NDh41b1aXaEosmXQ+JSHYld
	hiRfV5DfxG/skIqThJA9SrsWMKA8Y1dQLSHrc=
MIME-Version: 1.0
Received: by 10.216.169.71 with SMTP id m49mr2632332wel.4.1295564434625; Thu,
	20 Jan 2011 15:00:34 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Thu, 20 Jan 2011 15:00:34 -0800 (PST)
In-Reply-To: <AANLkTinhZBY4ODjB9h3y+Ep-hXBu6O85cB95h4_KFxmP@mail.gmail.com>
References: <AANLkTinhZBY4ODjB9h3y+Ep-hXBu6O85cB95h4_KFxmP@mail.gmail.com>
Date: Thu, 20 Jan 2011 18:00:34 -0500
Message-ID: <AANLkTim0+yJ+oKSteOQ-22_PCPFB_KQ0NRw73VDyq478@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: testing branch 2011-01-20
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
X-List-Received-Date: Thu, 20 Jan 2011 23:01:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

60+ combinations tested last week!!!

http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=tested_2011-01-13

For more information on the testing effort, please see:

http://www.openembedded.org/index.php/Testing

Tom has enough combinations in testing now, it may be time to think
about a little more automation for this.

Thanks,
Cliff

On Thu, Jan 20, 2011 at 5:54 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> master has been merged to testing-next and is ready for clean builds.
> Looks like we had a fair number of successful builds last week :-)
>
> I'll compile results shortly.
>
> Thanks,
> Cliff
>
> --
> =================
> http://bec-systems.com
>



-- 
=================
http://bec-systems.com


