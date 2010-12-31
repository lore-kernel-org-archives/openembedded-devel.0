Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PYfeg-0000vc-Qi
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 15:08:30 +0100
Received: by wyb40 with SMTP id 40so12077252wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Dec 2010 06:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=mj3qRGNz3Zn0OX/4W88mbtG4xu0lak0P/lUe3vS7kT8=;
	b=X5682CvyHRYy4GazAoh5oqS2Dm61cQq6nogsjfZjy5CVK9U+uBx/28hPWxsjshHO8P
	zQDspqSxvwQo19nGZEpy5LWzca1afSv+VUN43md4Rx0YRPAric78K16J47iCOuppdDmv
	gB+a+sTQETgrDy3EsTyKpm1EDDEJxvLDWGTYw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=sBJUwQRTl+hW3T7uJu5NUdOlGLiczPunK3vpYU50QfTh9ApUQeoZXjmZAjisgzddCI
	P+kj+QFrO6rZ8sHbnNQx2AgxQqFCs0ANoX2hjvxkL+FuiBS36Dl8ZEnOZUMYSRWvr/Xr
	Whopvjpaa3tyzYm1yfxBn3rE14WzQwzxYMBVY=
Received: by 10.216.150.134 with SMTP id z6mr18456094wej.27.1293804491985;
	Fri, 31 Dec 2010 06:08:11 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Fri, 31 Dec 2010 06:07:51 -0800 (PST)
In-Reply-To: <ifkj8g$hfl$2@dough.gmane.org>
References: <ifkj8g$hfl$2@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 31 Dec 2010 07:07:51 -0700
X-Google-Sender-Auth: 045zeL1SxYxetXeTI-mrBwvMPXc
Message-ID: <AANLkTimASzBxuO4UdoHPY8JQbyHJGQEs_kighy0AE1UK@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake 1.10.2 tarball, where is it?
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
X-List-Received-Date: Fri, 31 Dec 2010 14:08:30 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 31, 2010 at 5:45 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> I would like to bump the requirement for bitbake in OE to 1.10.2, but
> the tarball for that still hasn't materialized.
> So what's the way forward for requiring 1.10.x in OE?

It should be on berlios now.  It's been available on the git server /
via cgit, but I hadn't gotten it uploaded to berlios.  Thanks for the
reminder.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


