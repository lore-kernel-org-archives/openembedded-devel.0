Return-Path: <cliff.brake@gmail.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 99C7165F1E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 01:45:24 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id v10so147894qac.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 18:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=h2qnd+sE3ZxrGB25HSLe9WRumh2bSpdr0cuTDqWk8Ow=;
	b=OOASZltIhD+xgbDU3EmTUKgQpionnB1s8CRfvFH24iWF2+v4K26Ak9sKr3XwBmpHcC
	rSHMTibJw3kK7LN+PYBIcDdlNGyBdgzaGk00ctdTDX3DdmID6bOPZOkKi9HT0hAb/41x
	HJIQOmOGM3N0MozYFa3DWRQpT5jyYNaCYAvV8sD5ZTvmDibfprHJRy5iEj/WAeOiKzSD
	0z9TMVuXe2y0sC/A2IPy3DEajOwodYS3aKKYGVpXFMH75moMFz4djBLEYnX8FgNmjkeS
	Mdcm8pCRJ/Mg5N4u/nANd3ZpvHlZTCv98uvvvAs09+X96m5+ESNztjmC22GZrPXy55VC
	xK+w==
MIME-Version: 1.0
X-Received: by 10.224.114.69 with SMTP id d5mr9141510qaq.96.1403055924806;
	Tue, 17 Jun 2014 18:45:24 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.140.31.73 with HTTP; Tue, 17 Jun 2014 18:45:24 -0700 (PDT)
In-Reply-To: <CAOd_LFzTMonJL_17KyR6e-g8U_ByPRakj26n41qEY2-psOevsw@mail.gmail.com>
References: <20140430143741.GL2486@jama>
	<CAFeBWL5HuWex48xB_JZX_C7RMhzgfH93=AVJAkO7Qk7DUToFxg@mail.gmail.com>
	<20140505164514.GM2486@jama> <536A7C42.6030502@balister.org>
	<20140511145337.GE22774@jama> <20140616134850.GP2428@jama>
	<CAP9ODKr8=FnXhWranpckyRrPrHzpfCW-fYLxF4S1o_7sYRMFVA@mail.gmail.com>
	<CAOd_LFzTMonJL_17KyR6e-g8U_ByPRakj26n41qEY2-psOevsw@mail.gmail.com>
Date: Tue, 17 Jun 2014 21:45:24 -0400
X-Google-Sender-Auth: sNbgkefwjHJHUbg5_gwqZjOBBkM
Message-ID: <CAOd_LFyPoDmaxA4PZ6H4r9gOUwN=psaAhtiL7NzsW3xNt+AmjQ@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: daisy branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Wed, 18 Jun 2014 01:45:30 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 17, 2014 at 9:32 PM, Cliff Brake <cbrake@bec-systems.com> wrote:


> I'm willing to help as well.  I started a branch to merge:
>
> https://github.com/cbrake/meta-openembedded/commits/daisy-to-merge
>
> Let me know if anyone else has ideas for README, etc.  Otavio, perhaps
> you can add your email to the README's as well (assuming this is what
> Martin had in mind).  Thanks.

Following Armin's lead, I changed the branch in the upstream layers
from master to daisy and pushed to the above.

Thanks,
Cliff

