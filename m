Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PpRrm-0003z9-EH
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 21:51:22 +0100
Received: by wwi17 with SMTP id 17so589654wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 12:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=RHa03b8dTh/5nR0nH9GaWvKxgHRDnifjOL8geSFWUb8=;
	b=erVo2e9DKlbTMFbNKn9vKBxoj2ijaYnHLgcrzAlapFHXqkEVdx9kXBBiOwgTL4c0bF
	YlPppMId6ITiyD9E6uRXJQJNrZIVc8CVzdkWZEGMDwiGLx59kDvOskuImhVr9j5tHRj9
	WIcaDTz6REOmgAp4H/F4r5Ew75Rgp3JBTFVJM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=jYR0DAMIa4KuOJVpbdHcbTJpeyGmTaDmR4X5S/ikOUgvxDTh8RWSAtJzVrnA22O20+
	wbZrAXsPhAwuXo0T+Rp4lmz7kK/DdyDkZNm4zROVo3upe3pXu+384YBy4wRgVTouCs1t
	kOZGYF4I/bKgUdXkKQbCPUdbewPGWTwkO/jzk=
MIME-Version: 1.0
Received: by 10.216.3.200 with SMTP id 50mr1182723weh.34.1297803011385; Tue,
	15 Feb 2011 12:50:11 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Tue, 15 Feb 2011 12:50:10 -0800 (PST)
In-Reply-To: <4D5953C5.3080605@mentor.com>
References: <4D51566B.9060603@mentor.com> <4D516F8B.4090703@gmail.com>
	<4D5953C5.3080605@mentor.com>
Date: Tue, 15 Feb 2011 15:50:10 -0500
Message-ID: <AANLkTik8Wpc9ejLHmYoe4q6QD0K9Wot9REeGXW=g2eOS@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Tue, 15 Feb 2011 20:51:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 14, 2011 at 11:09 AM, Tom Rini <tom_rini@mentor.com> wrote:
> qt4e-demo-image fails in both cases due to the image not being happy with
> qt4-4.6.x and only 4.7.x (see my emails to the list the other week).

qt 4.7.1 demo images built fine for me on the release branch.  Does
angstrom want to consider using 4.7.1 for the release?  Does anyone
still require 4.6.x?

Thanks,
Cliff

-- 
=================
http://bec-systems.com


