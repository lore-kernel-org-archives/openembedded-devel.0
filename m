Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PE6Uh-0006EY-SM
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 21:33:13 +0100
Received: by gxk26 with SMTP id 26so1860446gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 13:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=4vNObL40tHKozpXF7sPCT8MYdUEXWWTEoOnXCWis0pQ=;
	b=VFpLie2yqoRnHX0YLG/LrZ2Ba1AP9P8figXHnqDJZKUwEJLeXkQmZTk2zsxJAQxEyB
	hFaoN06LtNl09dKDx85s5RCRlC3u5mO4Acsz0HyodUSR0C5ATVs0oZHrqhdipJCG9seb
	7zbPmTyfK6XWVwaBAU/rmnyPgG/z+/R9kDElk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=oSsYagA72xgH9sXEaylF+2OrMbA1stzs8irs1uQr8m3IhXYhgEF1J5e0Gtqcw98vzJ
	NDUBAFCf6ozHdO4EZrj59qK5icdj88WTfksJdLOrgd/Kq4sHl2P6hoejrfrwAPB0Akpt
	3kFUjMQGVPciuKZpXgpO38iIbFTOYr7tZ3QPg=
Received: by 10.91.44.12 with SMTP id w12mr206235agj.64.1288902739093; Thu, 04
	Nov 2010 13:32:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Thu, 4 Nov 2010 13:31:58 -0700 (PDT)
In-Reply-To: <AANLkTikEvXr_vz+_uy871SM1B5SS=e6kb62sPyt-4GaD@mail.gmail.com>
References: <AANLkTikEvXr_vz+_uy871SM1B5SS=e6kb62sPyt-4GaD@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Nov 2010 13:31:58 -0700
Message-ID: <AANLkTimhoEU9f0wMkGrZTF7t0B_HacGH9dOfKgrNchMS@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenEmbedded Release 2010.12 --- needs your help!
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
X-List-Received-Date: Thu, 04 Nov 2010 20:33:13 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 4, 2010 at 1:04 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Hello all,
>
> at OEDEM we discussed the need for OpenEmbedded releases.
>
> - OpenEmbedded releases are planned in certain months, so that we can
> plan stabilization efforts in the future.
> - Each release is a point release in time.
> - A release is a candidate branch point for a stable branch (which can
> be maintained by those who use it).
> - The next release is planned 2010.12, more specifically December 1st.
> That's only four weeks from now.
> - The 2010.12 release is hand-picked from a recent testing branch.
>
Thanks Leon for the notice.

> Now that our testing team has the process in place to gather test
> results, please consider to build your
> favorite set of distro/machine targets using tinderbox, and report your results.

All testers please update the Testing page on wiki with the information.
http://wiki.openembedded.org/index.php/Testing

>
> One requirement is to use bitbake 1.10, as the minimal requirement
> will soon be 1.10 for the OpenEmbedded metadata.
>
>
> Regards,
> --
> Leon
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


