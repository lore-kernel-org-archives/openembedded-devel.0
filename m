Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Shk0j-0004lD-4z
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 18:13:42 +0200
Received: by eaal1 with SMTP id l1so299691eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 09:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=fnGfxrdyxVVehrE+t+AxpBztA5dn1XPD91S+YyaBCRo=;
	b=cduQPN5j3z9jSQpWqofBA+c1FnHZu31zzq/eH57PzengHyWbj4hYSQzMouynKY/Wva
	ljsGVi/QELCtoPs+Oqu+cjp9Z+Gn6oogoaG2jYSG5i1f9TfdyRyyWBMafjmKaMe6SMsi
	BKEQuymPMX5GAl0ayIUUdlS0jL6nP0Uht+D4CEt1nbaDYjwSvZ/ZleP0wt8cg6E/ZOqg
	dVYRWvwbkSwmT0iAThNAqMWz/kI7zW4IAAXU0T8b0uv6OkMxgDQ35ufv4agogN4ByIZ8
	0tR5medLzTpnJeqIJLqMi8Qu8waoSb7ohXfWjTYDLQ8xvI7YNKy+1Ycpz9oTUR4vFmrc
	y7Gg==
Received: by 10.14.37.76 with SMTP id x52mr6305317eea.102.1340294567209; Thu,
	21 Jun 2012 09:02:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Thu, 21 Jun 2012 09:02:16 -0700 (PDT)
In-Reply-To: <CAC+thW0R2ieg-q9mavCGQ2C8DgHmjh-aXVLHy4058Xcz9r9-xw@mail.gmail.com>
References: <CAC+thW0R2ieg-q9mavCGQ2C8DgHmjh-aXVLHy4058Xcz9r9-xw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jun 2012 09:02:16 -0700
Message-ID: <CAMKF1srRXVr0S8s9-gp4PhWQkGLwkn3iV+oX5bB8xQHL-KP7Ew@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: maintainers tool to monitor upstream
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
X-List-Received-Date: Thu, 21 Jun 2012 16:14:17 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 21, 2012 at 3:23 AM, Andrea Galbusera <gizero@gmail.com> wrote:
> Are you experienced recipes' maintainers using any tool to
> automatically monitor upstream projects for new releases?
> I'm not planning to become a full-time maintainer but, since I
> recently submitted a new recipe for meta-oe, I'd like to keep it as
> up-to-date as possible. I asked myself if a suitable convenience tool
> was available. After a quick search I found solutions like cnucnu
> which appear to be used by Fedora for a similar purpose. Must read
> further to see if they could fit.
> Just wanted to throw the question to "real" maintainers first.
>
I personally subscibe to announce mls of packages I am interested so I
get notified
but use no automated tool otherwise.
cnucnu seems to be nice.
seems data used by cnucnu is something that bitbake fetchers are already groking
from recipes. I think may be either generating this raw file that
cnucnu needs using
bitbake or adding the cnucnu like functionality to bitbake could be nice.

I like the fact that it can file bugs too.

> Regards
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


