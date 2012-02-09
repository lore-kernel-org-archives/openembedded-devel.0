Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RvJEb-0001Dv-J7
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 02:55:41 +0100
Received: by lbol12 with SMTP id l12so610603lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 17:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=yZa0iPB/e+tzGwih0hmtcpOpMo1ogYn2qX6jmDqgPus=;
	b=QZksKXiKZ3q70oJ0JHLPMzlbOBOVH2ZAtVaiAM1cOmgKiJwhLjCV4JGXAa6dLNwMnW
	MyWteZCFarBoau+5INSTnQv8wmkt9DdYVHonaH0wUo5RpHzHUAllpzcv6ASAu9h2ODt7
	2lKX7Fp3xjP6E4ZwAfnvkSadA7BZtDUhYrAK0=
Received: by 10.112.86.67 with SMTP id n3mr8592997lbz.29.1328752057313; Wed,
	08 Feb 2012 17:47:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 8 Feb 2012 17:47:07 -0800 (PST)
In-Reply-To: <4F33048E.8030109@palm.com>
References: <4F33048E.8030109@palm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Feb 2012 17:47:07 -0800
Message-ID: <CAMKF1so61ndkzii_qK-sLiX6czvHXvaMFvBsxzm78z87zRTQkA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake versions
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
X-List-Received-Date: Thu, 09 Feb 2012 01:55:41 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 8, 2012 at 3:26 PM, Rich Pixley <rich.pixley@palm.com> wrote:
> I'm having trouble even parsing using bitbake > 1.12.
>
> Am I right in thinking that the openembedded tree isn't ready to be built
> with bitbake > 1.12?

I have used 1.10.x successfully with old oe classic but that was sometime ago
if you want to use oe classic please use the
2011.03-maintenance branch you stand a better chance with that branch


>
> If so, then the getting started document should probably include this info.

yes getting started should reflect how to get started with layered oe.

>
> --rich
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


