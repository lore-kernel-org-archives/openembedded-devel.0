Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T4DXG-0007jK-Dy
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2012 18:12:02 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 22 Aug 2012 08:56:34 -0700
Received: by obceq6 with SMTP id eq6so1350308obc.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2012 08:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=tjeJelVZg3tDru7zsyiYy9741PsrY4RhAfyQ9sr4fbM=;
	b=jakXTau0b4MlOS75d55BI7OVUSZZUEdn0z0sbOBkMCpoQpjOkRgrQm3camCioI1zBT
	R0vGCcmP9zlJOIxOXHjrZI0JlfIRlfS5zlWhdJOq0Pvx0o/R/GUQUMicum9yimnh8wJW
	2RwvtXxThalRpbec2E3UInxrzNiuSD+UnK8ys806ItCm7LsgGUCdGEX8jln/MXxhNnQ8
	XFp1PKjbN/v6kduHIR+kK87oEQXSn+9mmS8YnxkcQJCxBnM3avoO/cr+MryHspNARbvv
	VCFLaeZjiQ5nA0uJP6NILcuq4eevidgKgLlCqutncQFxeSaw79FE5biIy08SSKh4YoP5
	Mr2w==
Received: by 10.182.108.71 with SMTP id hi7mr16605699obb.21.1345650993967;
	Wed, 22 Aug 2012 08:56:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Wed, 22 Aug 2012 08:56:13 -0700 (PDT)
In-Reply-To: <CAJTo0LarhQSinwUHXuruO-OiCBOw4j89ko2n4RvctREApS5NZA@mail.gmail.com>
References: <CAJTo0LZpSd6LB+9W2kUcxfeU4GOVO5VOnLHMbHYT+1W6iVzcBQ@mail.gmail.com>
	<CAJTo0LarhQSinwUHXuruO-OiCBOw4j89ko2n4RvctREApS5NZA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Aug 2012 16:56:13 +0100
Message-ID: <CAJTo0LbJaRyPCexNT8nVhY-qvh19UxH9WSf22==GF8kjWuFaAg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn5EKtXu4q46Cm6Q4d6pcHTq615FSN6eU0DqFoFqI3Xmb1A79E22yTrnwcWaTSugobkz9eT
Subject: Re: RFC: One X Server To Rule Them All
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
X-List-Received-Date: Wed, 22 Aug 2012 16:12:02 -0000
Content-Type: text/plain; charset=UTF-8

On 22 August 2012 16:15, Burton, Ross <ross.burton@intel.com> wrote:
> Some rough numbers: a core-image-sato rootfs for RouterStation Pro
> using kdrive is 25959477 bytes.  Change kdrive to Xorg (Xfbdev and a
> few important modules) and it grows to 26342094 bytes, approximately
> 380kb growth.

Forgot to say - as I'm still working on this, this was the size
difference in the rootfs.tar.bz2 so that's compressed difference.
Expect a breakdown of files and size differences shortly.

Ross


