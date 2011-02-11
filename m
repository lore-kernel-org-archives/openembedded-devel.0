Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PnwLK-00059O-N0
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 17:59:38 +0100
Received: by pxi17 with SMTP id 17so437495pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 08:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=XaWkn3tFee1CpUjj0D9jeFJG/gsyZ5MN6vM2eqhx1to=;
	b=rg3dGhvKxuGmUp7ps1bWeHzTJTWuz3occfjp16cZtBq30RhI6ReBeAsTE3Y/Cp3Fu2
	DTXbBpNShR5j8kGKOl5vrD5k1PPqAnV+eHgOksbZA5Oyp/40HKXQ84k0r3bmnuqnHn82
	YFA+Fq4B46EuvVkvLuJ6uJNJY35ASuyU2p8wE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=wMFZuelEZMH34VBaqfUrEnwsQsm6zPUDO9oTCVdQr6BrvXZTBjuEjLd9uVoLZ8HyLt
	hZB2OMFzX4tyZCMuFyqO25vMUKx90soy8SDPqb9xIvdxGzR2wed4AdOa7fgEeAu9EDZ9
	310GfQm8f9HvqkmRGb07G5Zxx/kzo51m5n4pw=
MIME-Version: 1.0
Received: by 10.142.238.19 with SMTP id l19mr534716wfh.316.1297443510214; Fri,
	11 Feb 2011 08:58:30 -0800 (PST)
Received: by 10.142.155.8 with HTTP; Fri, 11 Feb 2011 08:58:30 -0800 (PST)
In-Reply-To: <4D54FAA7.8030604@dresearch.de>
References: <4D53E971.5090109@dresearch.de>
	<AANLkTimEYm1sDsLob7rwkZy8GshO2KxihZAQBm4azB5e@mail.gmail.com>
	<4D53EE67.3020705@dresearch.de>
	<AANLkTikMYFbyza7Ma2d-N_GNpy+U=Gy3gKPx8BRE13eZ@mail.gmail.com>
	<4D54FAA7.8030604@dresearch.de>
Date: Fri, 11 Feb 2011 11:58:30 -0500
Message-ID: <AANLkTik6_nv73Bpf-21pKoDfYkKUSW4x9m-Xuyvg4Vis@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: different access rights for oe branches?
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
X-List-Received-Date: Fri, 11 Feb 2011 16:59:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 11, 2011 at 4:00 AM, Steffen Sledz <sledz@dresearch.de> wrote:

> @admins: Please create a new branch named "hipox" by branching the "testing-release-2011.03" branch.

Done.

> @khem: Please limit the write access to the new branch to me for the moment. May be we'll extend this to a few other developers/maintainers later.

Done, please test if possible (have other accounts try to push), and
let me know if anything is not working correctly.

You have re-wind permissions on this branch so you can back out commits, etc.

Cliff

-- 
=================
http://bec-systems.com


