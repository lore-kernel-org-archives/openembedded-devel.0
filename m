Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1T3QTY-0002FK-0d
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 13:48:56 +0200
Received: by lagv3 with SMTP id v3so2953413lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 04:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TWFjhQwdjj/Xi8sGnaG+jRtPYc34NML+TSdCnUMTe18=;
	b=UpkM8dBIU/W3GdWIEBHbKT+q1ghtqEy1W1sFgD2Dyvp9dOhFUjvHH60aMBhsdkd5vn
	drkMseo6jSd+utDEXbA1HhnBYsJv/rXy4dhOYCkKjf2Zn9sFTwm+O6hlPwX7ivQPOTl0
	VCYWGZ8uC3AsUtKNdY6KS1kgxCAXuxgCBHV1DkaSl38i8g2qx5qS4CKhlrEirGS5pEdn
	nwHFx2VzvrN2SdVsyMlwNtmxFMFfMhLViWwEkn23kCjLiodeuVTR8Yzfdjj6FxqrSj0n
	dC88wdADTkg8f/ml9IKXKmZFkk6X+0maHPL+Kw13HtSO58J0PDrtRgnccqYGWiVNpf+1
	0RuQ==
MIME-Version: 1.0
Received: by 10.112.88.73 with SMTP id be9mr6205389lbb.72.1345462613531; Mon,
	20 Aug 2012 04:36:53 -0700 (PDT)
Received: by 10.112.85.196 with HTTP; Mon, 20 Aug 2012 04:36:53 -0700 (PDT)
In-Reply-To: <16213085.OYMN3cpiun@helios>
References: <1345460745657.3fc83336@Nodemailer>
	<16213085.OYMN3cpiun@helios>
Date: Mon, 20 Aug 2012 07:36:53 -0400
Message-ID: <CAOd_LFyqWeiOi15Uitw2obWNTbfJJtgEOFCZ3KPnZ9nunwKvhQ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: OE Changelog since 2012-08-12 until 2012-08-19
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
X-List-Received-Date: Mon, 20 Aug 2012 11:48:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 20, 2012 at 7:14 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Monday 20 August 2012 11:05:45 cliff.brake@gmail.com wrote:
> > Changelog since 2012-08-12 until 2012-08-19.  Projects included in this
> > report:
> >
> >...
> > meta-yocto: git://git.yoctoproject.org/poky
>
> FYI meta-yocto is now its own layer - this should cut down the duplicates
> in
> the report if nothing else:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/
> git://git.yoctoproject.org/meta-yocto
>
>
Thanks, I've made the change and re-run the report.  I also removed
meta-eldk -- it seems this is mostly a copy of poky and not really a true
meta layer.

Cliff

-- 
=================
http://bec-systems.com

