Received: from [209.85.218.221] (helo=mail-bw0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MYOGa-0000iU-1M
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Aug 2009 19:57:44 +0200
Received: by bwz21 with SMTP id 21so3110716bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Aug 2009 10:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=UAtgxT5IEJYzm+A6SCGzR/HHqYZhzKhN96pO6XsnYf4=;
	b=YRCYci9UWObOsnRr877hDxZdsg2Tpj/OTrwhnHqzigzDyAQyB+NqRznhfq++cQ2ker
	6KhEPDimSFfk8KVGGH0hDMUfb9UG6fz+8X3VvN8lCCENir1K4irtxEx2aXzsFWXqyuNQ
	mKeKFOTgwPUGUPTaI6KT5fD2ys+NDjSvurA48=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qHh9VKa38ek6wDFhXt28MKG7uf5cMbPekyxFEDKp2I295RGZhq3u5CoYGJ+BXQoaAO
	FUUpxwRBSyrvw35H7xCe1vVcUDnlK0eTNfuBf1GzyRxn4W+8LHGfLmPj2mYO+ypk7SfC
	zWjweJlGcDSkovYM/8DCbM3qIS1Pj7PSCkgdc=
MIME-Version: 1.0
Received: by 10.239.160.84 with SMTP id b20mr687776hbd.149.1249407724044; Tue, 
	04 Aug 2009 10:42:04 -0700 (PDT)
In-Reply-To: <4A784400.7010200@cbnco.com>
References: <4A784400.7010200@cbnco.com>
Date: Tue, 4 Aug 2009 19:42:04 +0200
Message-ID: <c384c5ea0908041042q1c4e3fe8i2f553c3746ddb978@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Kernel staging on x86
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
X-List-Received-Date: Tue, 04 Aug 2009 17:57:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Tue, Aug 4, 2009 at 4:21 PM, Michael Smith<msmith@cbnco.com> wrote:
> There have been a couple of patches to fix asm-x86 header staging:
>
> http://patchwork.openembedded.org/patch/455/
>
> http://patchwork.openembedded.org/patch/746/
>
> Could someone please apply one of them?
>
> I've been using the first patch to fix builds of nvidia-display and madwifi.
>
Sure, I would like to test it first, I was looking into updating
nvidia-display a while back, but got distracted with non-x86 work
again.

What MACHINE/DISTRO/IMAGE combo did you test on? i686/angstrom/minimal?


Regards,
-- 
Leon


