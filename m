Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1RGbTt-0000hk-KJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 21:07:13 +0200
Received: by bkat8 with SMTP id t8so2735713bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2011 12:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=q7GwuQzCEJNp8xNa1BV/RvK1JwvyzxtmPp+7hiRYh+0=;
	b=ce5zavXihjpg+RDQpbjJjHShZ2FekLmm6eSn1hNT4XiveLcEAFOgL6GuvZm7IvEU/U
	hizORbBQiiDmCtlz84drXYZa+Yh0GkJ/8HgDGiUmm0xZZIMsbD5BQ7nCxB9vHwO5vOkb
	+4EpwzMS3GaZgTPHSqrDvDCAJV6Yr6HcbfVJI=
MIME-Version: 1.0
Received: by 10.223.77.71 with SMTP id f7mr12757539fak.33.1319050879102; Wed,
	19 Oct 2011 12:01:19 -0700 (PDT)
Received: by 10.152.21.193 with HTTP; Wed, 19 Oct 2011 12:01:19 -0700 (PDT)
In-Reply-To: <CAMKF1soq10mOoBn_L4VJTAygNn0=hRef5a2Ln-gdS1FFQXQcUA@mail.gmail.com>
References: <CAMKF1soq10mOoBn_L4VJTAygNn0=hRef5a2Ln-gdS1FFQXQcUA@mail.gmail.com>
Date: Wed, 19 Oct 2011 15:01:19 -0400
Message-ID: <CAOd_LFxtb1mmD0o5z29mrDPSJSy4RhBvMkaYz65C8tmYetY88Q@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE bugzilla to be decommissioned
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
X-List-Received-Date: Wed, 19 Oct 2011 19:07:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 19, 2011 at 2:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> For many months OE bugzilla is available as read only instance, Now
> that OE web services have moved to a new server
> I would like to ask if we can decommission it completely. Since
> bringing it over to new server is some work and if there is
> no value in doing that it should be avoided.
> Opinons?

Unless we have someone dedicated to watching over it, assigning bugs,
cleaning things up, it quickly degrades.  I support this decision, and
perhaps we can use the yocto bugzilla if one is needed.

Cliff

-- 
=================
http://bec-systems.com


