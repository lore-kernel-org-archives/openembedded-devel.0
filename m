Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OvwDl-0000tl-Sj
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 19:56:38 +0200
Received: by wye20 with SMTP id 20so484317wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 10:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=PZQjcdMzfsQrIWnTKvV4KvsTTfEnClignwACR/TYqvM=;
	b=QmpDkbyVgbr+m9b0ZHNGcdR5imvyRjzqcCkeNBc+17BHnEgeJ8P+3i5kB4By0xPdHB
	kMcKPPN5Ex7LY10aMY+7vhNa8l+DXy3IELfc0mEAkLA/IhuigBHWTFsdWK4PrDc/OBTE
	OQcojxIDu7ufSIOaZoT2o7zSNcxj4ymfQx65Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=kRiAzRCl9/7gExRGywkRi0vB3/C16IZvj/HyTwx62Ne1mSlI6iARiQY6TZJ+f7HZlE
	5x0U9nzizPtFw3RrIwDoZHrUbVD8q+wZYAlUkxBD42QpWUzEkx32MlF0mBCRUcgKI9hO
	crQrrrohkH3EVt9rVI4xi94ftTPC1K57xywU8=
MIME-Version: 1.0
Received: by 10.216.30.10 with SMTP id j10mr5585215wea.8.1284573348487; Wed,
	15 Sep 2010 10:55:48 -0700 (PDT)
Received: by 10.216.72.212 with HTTP; Wed, 15 Sep 2010 10:55:48 -0700 (PDT)
In-Reply-To: <1284570332-6484-1-git-send-email-coolaj86@gmail.com>
References: <1284570332-6484-1-git-send-email-coolaj86@gmail.com>
Date: Wed, 15 Sep 2010 13:55:48 -0400
Message-ID: <AANLkTimiUfDtop++PS6YhwtYh3b_e7pMpEN7GuE2LLYc@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: AJ ONeal <coolaj86+fastr@gmail.com>
Subject: Re: [PATCH] nodejs: replaced v0.2.0 with v0.2.1
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
X-List-Received-Date: Wed, 15 Sep 2010 17:56:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 15, 2010 at 1:05 PM, AJ ONeal <coolaj86@gmail.com> wrote:
> From: AJ ONeal <coolaj86+fastr@gmail.com>
>
> * now includes node-waf and node-repl
> * updated pathname in libev-cross-cc and libev-cross-cc
> * removed patch which is no longer necessary (applied upstream)

Pushed, thanks!

Cliff

-- 
=================
http://bec-systems.com


