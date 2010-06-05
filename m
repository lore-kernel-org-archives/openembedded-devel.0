Received: from mail-yw0-f175.google.com ([209.85.211.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aspnair@gmail.com>) id 1OKjjN-0000Bq-3U
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 05:07:30 +0200
Received: by ywh5 with SMTP id 5so1831732ywh.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 20:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=6ZfG+d9A+tA3vPqpAHQuQ4CArjxbBDtdAocMaHv3AmE=;
	b=iv5wOtjVDEkMIYDivHE80f2nJCsZJC19GuSYoikFh6O/R+HVnQupiXuC+YWc2I8q3K
	UJEAtzzFA5m3NRtxywFOBFqUPeZYrcycOq3o8Fjy3YBeRMXo5NpwRH7MRKdaCGfMK2vO
	C8sCo7ZzZZpBttPKGaj3uYV4YmLlGBx5obUAY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=bhpVbD6gh9KaXrwv7mcKlGLOHHtsZJpGd7ov3/ghxC7LOMyBb0h5n05QbrUpS8BIuX
	bFrIK6SPcE/0MTW5X8hD4fVof/d/OBKFLMguBRdT76Zgtq2Utc2PHa59E6aXgarbN0I5
	FnZ2zWp0kWVy7UmWbo2rDebAhslhj1Pp2WOdY=
MIME-Version: 1.0
Received: by 10.150.160.12 with SMTP id i12mr9884177ybe.8.1275706991029; Fri, 
	04 Jun 2010 20:03:11 -0700 (PDT)
Received: by 10.150.228.21 with HTTP; Fri, 4 Jun 2010 20:03:10 -0700 (PDT)
In-Reply-To: <AANLkTinzFcGTINenNR72-NtuZUijkAY55BVKYL9r0ea8@mail.gmail.com>
References: <AANLkTinzFcGTINenNR72-NtuZUijkAY55BVKYL9r0ea8@mail.gmail.com>
Date: Sat, 5 Jun 2010 08:33:10 +0530
Message-ID: <AANLkTimBKqYl04nQfZ9NIPK0ThPRQn7YTVdGTGEWnk_s@mail.gmail.com>
From: Anand Sivaram <aspnair@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.175
X-SA-Exim-Mail-From: aspnair@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00, HTML_FONT_FACE_BAD, 
	HTML_MESSAGE,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Questions about openembedded stable branch
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
X-List-Received-Date: Sat, 05 Jun 2010 03:07:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

I asked these questions here because I could not find *any* satisfactory
answer from google.   But if any of these are already discussed before, I
would really appreciate if some one could point out those links to me.


On Fri, Jun 4, 2010 at 13:39, Anand Sivaram <aspnair@gmail.com> wrote:

> As I was going through the stable documentation given at
> http://wiki.openembedded.net/index.php/Stable
> I had a couple of questions.
>
> * Seems like there should have been a release "stable/2010" some time
> around
>   March, but I could not find any mention about that release.
>
> * OE repository contains very few tags.  Also there is no
>   "year.month" tag as given by the stable branch documentation.
>
> * Is there any testing branch (like in Debian) where relatively "stable"
>   packages are moved and they eventually become stable?
>   Or is it like mainline linux kernel where features are frozen, then
>   do RC releases and finally the stable release?  It looks like
>   origin/org.openembedded.dev is a rolling/floating place where
>   packages/features are constantly getting included.
>
> * I would like to know how the stable/2010 branch is created.
>
> * My main objective is to find a branch/tag/version
>   newer than stable/2009 and more stable than the dev main branch.
>
> Thanks and Regards
>
> Anand
>
>
>

