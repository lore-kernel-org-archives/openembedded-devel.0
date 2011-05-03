Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QHISe-0000GX-6P
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 18:28:33 +0200
Received: by vxd7 with SMTP id 7so236620vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2011 09:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=Q987adZ2RIJ2LVPD0Rcjzr9qaNztTeOcjBlTv7GRZmE=;
	b=NrKY3kzE9WcgW1LNoMe7QXm+Mycp1OMsyTNCxe7ca0NbsQT73kfs1EPf8kF8+JExc7
	ve6WNEZM2kEBzf7Qt0rQPYekPIISJsbP46/pBkcd+8SMvje115wuL7SWRFbd81V7DDbj
	zOp6yHs6vsGaAn8bZyFM/FKrIsBIWaNzBncCQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=RKPpDDcB2g/sVm9mEE1+jIJDbkQ4OUwu8mfD2w4CEm+GI7vsGK7skVQRt+8NL0vRoQ
	JHWq5H4RY3Yw9O3bqTkh0SRmuv3kxdt6Dc6j5mUzsdd0faghCApe0BVpHRDgpqw+5BAq
	vJ0Qd6ZQpK94gb2c/cK0L7TaDZGmnTZtmGtSk=
Received: by 10.52.66.165 with SMTP id g5mr66245vdt.61.1304439954032; Tue, 03
	May 2011 09:25:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.186.170 with HTTP; Tue, 3 May 2011 09:25:34 -0700 (PDT)
In-Reply-To: <4DC0192E.3010808@kernelconcepts.de>
References: <1304434485.13481.79.camel@mattotaupa>
	<4DC0192E.3010808@kernelconcepts.de>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 3 May 2011 09:25:34 -0700
X-Google-Sender-Auth: GGpswAErB6loyNKpvCtM5pk4BTA
Message-ID: <BANLkTimT+YtwqHusRvxhEkVSDDQ8OGfF6g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: error in push of origin/org.openmbedded.dev
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
X-List-Received-Date: Tue, 03 May 2011 16:28:33 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 3, 2011 at 8:03 AM, Florian Boor
<florian.boor@kernelconcepts.de> wrote:
> Am 03.05.2011 16:54, schrieb Paul Menzel:
>> you pushed to org.open*mb*edded.dev and therefore a new branch was
>> created.
>
> Args - sorry my bad, I have a typo in the local branch name. Interesting what
> can happen working on a fresh tree :-)

All the more reason to use master, which is less prone to such typos.
org.openembedded.dev is just a compatibility pointer at master, master
is the real branch.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


