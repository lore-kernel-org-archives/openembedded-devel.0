Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 31CFC708C6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 12:56:09 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id f73so2526438yha.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 05:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=f4KBFY1UlJ2SXzSNeAnk+vL9gLWcGMVSwrUIHumSCRY=;
	b=gEnOsPAlN9CVsF3cg9fhZtmPpvgYk+7RYBfeVDdHbIaz+QnLKG0LoXj27OI8ragzmy
	lVF2J+SxO+kbtkDqjEO9u+8am0vdO9prGv803/7fT9RoPCaHsGleD5rnBjDzSI7oFUsN
	VRGJO6h6jddtLg1fohlfIe48UfChLjk0YREx6UjJcgc31DewFmzbSo+lL8UQrWz4oMwP
	jz54h29F6tIjeNKi0SWUikji9h38kBu4DYV03IAi0Ti7AV3n1SQQ7b5qzcj2jw6molQQ
	S43Cd+zrAsg42gut86uHaHdEu2y86orMxO773RrltNg4i+szCm65Vi3/xH7MXVb1w3Mh
	ONhg==
MIME-Version: 1.0
X-Received: by 10.236.162.7 with SMTP id x7mr7723276yhk.6.1406897770336; Fri,
	01 Aug 2014 05:56:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Fri, 1 Aug 2014 05:56:10 -0700 (PDT)
In-Reply-To: <1406629327-29169-1-git-send-email-dv@pseudoterminal.org>
References: <1406629327-29169-1-git-send-email-dv@pseudoterminal.org>
Date: Fri, 1 Aug 2014 09:56:10 -0300
X-Google-Sender-Auth: 2bHSOv-89-UDshO00zirZWZbMsk
Message-ID: <CAP9ODKr-h+z=+Es8ZMVcuD_ePwET=oR6Q=P=zjXRmv3obmG0VA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 1/2] chromium: Add PACKAGECONFIG for disabling API keys info bar
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Aug 2014 12:56:12 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 29, 2014 at 7:22 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>

Applied.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

