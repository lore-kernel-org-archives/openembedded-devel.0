Received: from [64.233.184.226] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KQlYA-0003kH-Ia
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Aug 2008 18:07:47 +0200
Received: by wr-out-0506.google.com with SMTP id c53so2219141wra.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2008 09:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=00dB2ubu86mVJbn5TU98owMQUbXkrNsGDG1NAvVnUw4=;
	b=KlREeeeiAPgPNqFU7NI+AHzvOmBMCTAUBTgEuB/IUPiPU2yRl73Z7M7al3yVl7stF/
	/5vjcte0jwiP/Sa2WbhWeGMRUE5L6rNvLfOWK2yhAw2eJQWY/jPAgqOu3/dx3QYVmi6F
	Wb23XT1EnzmkV9DZYnTxCDs/22qBSF9VLGJkA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=bOsG6vtyBUfWaQkNT8VMqneOV+WzzE5N/LuR+iKSKMkF5oaf5GO3GStkVCxM8ae7xS
	zjUwZulCprvltG8dMhuIPKXmcsc3XX9bQX85nMbaO3G/iUfyGWVNWoDAgw9dYYeOjhUw
	6o1hYQdvTQ4jpmsyY0jFFqqOry7qEwRbFRzTQ=
Received: by 10.100.153.6 with SMTP id a6mr561286ane.88.1218038860180;
	Wed, 06 Aug 2008 09:07:40 -0700 (PDT)
Received: by 10.100.174.18 with HTTP; Wed, 6 Aug 2008 09:07:39 -0700 (PDT)
Message-ID: <c384c5ea0808060907w143f8527ha37a4f8aeb492b1e@mail.gmail.com>
Date: Wed, 6 Aug 2008 18:07:39 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080806173647.1c51a79c@elara.dyn.totalueberwachung.de>
MIME-Version: 1.0
References: <20080806173647.1c51a79c@elara.dyn.totalueberwachung.de>
Subject: Re: RFC deleting libpixman in favor of pixman
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
X-List-Received-Date: Wed, 06 Aug 2008 16:07:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Daniel,

On Wed, Aug 6, 2008 at 5:36 PM, Daniel Willmann
<daniel@totalueberwachung.de> wrote:
> So I would suggest that we remove libpixman and change the one
> occurence of it in task-sdk-base to pixman instead.
>
> Any objections, something I overlooked?
>

I had the opposite proposal but it doesn't matter to me which goes and
which stays.

However the resulting bitbake needs some changes.

See the April 7 discussion on the openembedded-devel mailing list.

Regards,
-- 
Leon


