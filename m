Received: from [209.85.198.250] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JuOOX-0005JB-NI
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 May 2008 10:56:01 +0200
Received: by rv-out-0708.google.com with SMTP id f25so2549246rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 May 2008 01:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=1xisE+AIW57JhoTvpv9LgpnkL9DIbek2o57kdLz0Isc=;
	b=hg3/kT26TEwtom/tE3cJy8zEZd+bgZ36O5gtHdmcVG9LflwKnLc0XO54c0mXkNhAJds0V0QzIJaRu2rKEqTn4TPbGcRbt+m9ccBvXgMtLAjJVHw8XLMaDdRuBbzzHkqwXOwS8FZ6bTvacYhvEpZ8Xvc7EvtHlsmPMB43QEk7HyE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=QVZKmIFNjbeEDqOyZBrbPka4PQMG/g17AkAFSz5beXd6hPkpAn6NR515l8pT2Xfo4Y6tgwMc33LXD0TVHUrnGcC/0zifC4Hruz3Ku2YFFcJuowFDAxKplBHpHN1pGTOoowNLsI/LYu7xaU+gqB9k/uP/rkiWSvXGPlUAOcOC19U=
Received: by 10.141.171.6 with SMTP id y6mr2047934rvo.143.1210323312958;
	Fri, 09 May 2008 01:55:12 -0700 (PDT)
Received: by 10.140.250.18 with HTTP; Fri, 9 May 2008 01:55:12 -0700 (PDT)
Message-ID: <c384c5ea0805090155t752cc7d1w177ae0ffdb3fe679@mail.gmail.com>
Date: Fri, 9 May 2008 10:55:12 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200805080215.23729.zecke@selfish.org>
MIME-Version: 1.0
References: <200805080215.23729.zecke@selfish.org>
Subject: Re: Creating a pristine environment?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 09 May 2008 08:56:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Thu, May 8, 2008 at 2:15 AM, Holger Freyther <zecke@selfish.org> wrote:
> comments?
>
How about in the insanity checker?

We would like the user to make sure his environment is sane for
OpenEmbedded, and not try to fix it up ourselves.

Regards,
-- 
Leon


