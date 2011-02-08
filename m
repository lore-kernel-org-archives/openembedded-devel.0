Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PmrKN-0000PX-Ix
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 18:26:11 +0100
Received: by wwi17 with SMTP id 17so5875898wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Feb 2011 09:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=wrik57xEzwWT3iWMckucjiLoUwarXylZ2XtmcMEph/I=;
	b=GuGWaJmE+kFxyThy2w1rh9U/2XKxKDgd5eZ65YulboapLqEgMFzf47zYHiH30nOW0N
	9v1KhfHFspkGzHmbIf/TFWnUvPVvuldnsDRnFY65mMfqXfaY94icxkS/TdvV99zCi0Br
	tHFJILT44RrWdN37G7JVK8GG2g8wndzL/NV94=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=Sdeom3RAWNJhJHgUw2Ja5F+JCI4EkoUBf3VFEXEr2jLZ6fV4o/E6JmvRsi5IX5DCA3
	PLq+1zgMBq5+RvZ2wyoGPAJdtLC3hod69Tipyuxn/RlFKzDFoO/fRtW+v5YE20JBnMDt
	ASx5fuSFSF1Kkc2tBulShyhxyodn7FKDfGkTY=
Received: by 10.227.141.85 with SMTP id l21mr4674845wbu.99.1297185909286; Tue,
	08 Feb 2011 09:25:09 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.17.11 with HTTP; Tue, 8 Feb 2011 09:24:49 -0800 (PST)
In-Reply-To: <AANLkTi=zGLRdYGyQTsbhn1j5Din+k6_pz_40i_GTt4re@mail.gmail.com>
References: <1297181802-18948-1-git-send-email-kergoth@gmail.com>
	<1297181802-18948-3-git-send-email-kergoth@gmail.com>
	<AANLkTi=zGLRdYGyQTsbhn1j5Din+k6_pz_40i_GTt4re@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 8 Feb 2011 10:24:49 -0700
X-Google-Sender-Auth: jE93iyDlB-3aNozL2dCSiYu93WQ
Message-ID: <AANLkTim1k5bn0vXZULxKafENqv2aec828hPCnaZYKJ48@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 3/4] autotools: symlink where we can
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
X-List-Received-Date: Tue, 08 Feb 2011 17:26:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 8, 2011 at 10:18 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Feb 8, 2011 at 8:16 AM, Chris Larson <kergoth@gmail.com> wrote:
>> From: Chris Larson <chris_larson@mentor.com>
>>
>> Signed-off-by: Chris Larson <chris_larson@mentor.com>
>
> now that we will have symlinks will it have any impact on source
> package generation ?
> otherwise
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Good point, I'll look into it, thanks.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


