Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tfr41-0003xZ-Uj
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 12:53:26 +0100
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 04 Dec 2012 03:38:16 -0800
Received: by mail-ia0-f197.google.com with SMTP id x26so6603791iak.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 03:39:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=EgRUrh5ANg0pQmrn9IJvksI8oDdt4XwJ4sHLy8AQD1U=;
	b=Iht5WM0hzHHH034O+kwD+dW3BZn5YUT6hmG00/Bhj72Wa8F5PIrjQYxZBX0EG+73nj
	yHklL+NvNrhIwDmkedNktGLFr4gY2Y1j0jybbCIz8EiYziD3fgG3is2dkaEBQ8lZeuKL
	PGQoub0iuuxQXPXXbtfzhfNiLqQw/N/jVSzDUJkgETuzO7plK+y/pl4NPbN13KfG83IP
	MPzDruAnt9lGNZgk8kpmdERGFI7dUJ9+HgdVl2+FJbv3TbHiCqC+uQJMojKE4se6TLWu
	tMBM4ko1Iux0PdfYmKTl6wZzu6yrRQeeCotAtBulct+XuAxAQfNadhNuu7CMYh+WIZ/r
	J6qA==
Received: by 10.182.164.103 with SMTP id yp7mr7277663obb.74.1354621141526;
	Tue, 04 Dec 2012 03:39:01 -0800 (PST)
Received: by 10.182.164.103 with SMTP id yp7mr7277662obb.74.1354621141388;
	Tue, 04 Dec 2012 03:39:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Tue, 4 Dec 2012 03:38:41 -0800 (PST)
In-Reply-To: <20121204112910.GC14870@jama.jama.net>
References: <1353937823-29509-1-git-send-email-ross.burton@intel.com>
	<20121204101412.GB14870@jama.jama.net>
	<CAJTo0LbFWM01+1T6yB0WO6VA3bL+=GJe+-nypizr3roAzRNJpw@mail.gmail.com>
	<20121204112910.GC14870@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Dec 2012 11:38:41 +0000
Message-ID: <CAJTo0LYBCKCoggC3tnfnyG6TS-1-jRgsUJ-PMGjetrTLDC72Pw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkQYnYt8ekBE9lyY3VdPFlcB9Uc/o2mM15rSFis4cnVCuSZkoU2hSjd2HO3DeYFAjJUY+jKnAN1cFsNYzeDAWmolDzGCu63lTWtX+fgK9oN1Q254FryjvNYE6hR3stlc4elW8cc1o1VsVss/InZA5vd7xciKBkfvT36QimQ0dkqoh1DdhGWRVqP/72QERG/lN/HmOKQ
Subject: Re: [PATCH] meta-oe: remove guile, it's in oe-core now
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
X-List-Received-Date: Tue, 04 Dec 2012 11:53:26 -0000
Content-Type: text/plain; charset=UTF-8

On 4 December 2012 11:29, Martin Jansa <martin.jansa@gmail.com> wrote:
> Why? I guess it was because you replied 'y' to:
> Which 8bit encoding should I declare [UTF-8]?

Ha, whoops. :)

Ross


