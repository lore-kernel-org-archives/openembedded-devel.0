Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SI3An-0002vO-Ej
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 21:25:45 +0200
Received: by lbky2 with SMTP id y2so935025lbk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 12:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=zcxva2esZ5z4xnShK24ZIaYUPpkXWbuwZdCUg03LshM=;
	b=RWGoyM6Qcb/3PHLJimexpvOBQoEcwcsnVFCx9DoVrmpR9s3RfEM3N/0H+Qor6vh0cM
	BWolUVPXRkHvNuUbdbnpp3Po6z7IeCv920oPGUu6/fWCcIApxNs6HdR+DMr86Jq7VbcN
	aAbJ2K5XDmicChBLTlsA6p0U0InUika1pI+9mAncnYZcFb4mI8vFTnN628913SfnNqS3
	jGaVSMBp4ZpfvXiQH40kJDddxmSAxGhaxNmRkpHeU4i9XEAEAls3JOx7RgMZQq66govS
	u+r3oR4fM+l2vt5GfEBLfxuX3wXRI0ITDsET+8s98Rjvy08wEzWZp32FeEMK1IXQbwzR
	31lA==
Received: by 10.112.103.8 with SMTP id fs8mr3545660lbb.29.1334171786153; Wed,
	11 Apr 2012 12:16:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Wed, 11 Apr 2012 12:15:55 -0700 (PDT)
In-Reply-To: <20120411172427.GB23477@denix.org>
References: <4F80ACD6.8080901@gmail.com> <20120410064131.GA3583@jama.jama.net>
	<CAMKF1sotvfR6o0rU7dkVxwFVPcApWorM8bLsov+Gk8-OPKRU5Q@mail.gmail.com>
	<20120411172427.GB23477@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Apr 2012 12:15:55 -0700
Message-ID: <CAMKF1sp4uJfvceTpFrgvFgheZr=QLK-Sb7QEdBnWkk9-7J33AA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: meta-linaro and toolchain-layer
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
X-List-Received-Date: Wed, 11 Apr 2012 19:25:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 11, 2012 at 10:24 AM, Denys Dmytriyenko <denis@denix.org> wrote:
>
>
> Why? Do we need another fork? Can you upstream your fixes?

its not the intention. infact all changes will be upstreamed to one
place whatever that is
its a placeholder for development since the patch flow process for maintaining
this layer is still nascent.


