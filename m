Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philippedeswert@gmail.com>) id 1QkEkh-0007Gi-0p
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jul 2011 14:22:47 +0200
Received: by qwh5 with SMTP id 5so1193355qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2011 05:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1ND7KBs9trcLdPAFWhE31iP9m+k5qJAIxQOh7tcnYXc=;
	b=qDg1bLVt/pw3oLeXneEnccnaFwbWXEmQl57ChzklK5c3F0ZwWYSnfjGYGXNRSVf4zy
	5C8zqWxNDrrg+Uda9ByJXSzXj19urv8PQL/Fsc3qD/lRoJ34w8NuWgj81/9xZybEVx0B
	lV6P3WPX18eKxKU0vhpNXVEvRvowpyN1wE2c0=
MIME-Version: 1.0
Received: by 10.224.195.201 with SMTP id ed9mr1108782qab.128.1311337117932;
	Fri, 22 Jul 2011 05:18:37 -0700 (PDT)
Received: by 10.229.190.82 with HTTP; Fri, 22 Jul 2011 05:18:37 -0700 (PDT)
In-Reply-To: <1311288853.7847.6.camel@mattotaupa>
References: <1311287464-13001-1-git-send-email-philippedeswert@gmail.com>
	<1311288853.7847.6.camel@mattotaupa>
Date: Fri, 22 Jul 2011 15:18:37 +0300
Message-ID: <CAPsFW+QbVj089SmBAWtMU3xX2yPxghQmpsF=qAUZhpcnVLvKdA@mail.gmail.com>
From: Philippe De Swert <philippedeswert@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gpe-mini-browser2_svn : remove fixes SRCREV
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
X-List-Received-Date: Fri, 22 Jul 2011 12:22:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Paul,

On 22/07/2011, Paul Menzel <paulepanter@users.sourceforge.net> wrote:
> thank you for your patch.

Thank you for the review.

> Please do not remove the `SRCREV` but replace it by a valid and working
> revision. Otherwise the builds would not be reproducible.
>

I already wondered who added one (as I originally added the svn
recipe). Anyway I thought the whole idea of _svn etc were to have
bleeding edge builds. If we wanted stable there would be a versioned
recipe.

Of course I can add a new SRCREV but it defeats the whole purpose of
the recipe...

Cheers,

Philippe


