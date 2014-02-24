Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 628EC60C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 10:32:27 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id f11so5939038qae.38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 02:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=0gDFfKOQhf8Y4eihQzIcOy4j+Km9lREYahBRRzwFo1E=;
	b=LbbPS/W9Uq3dK6SYz3f9HAw3Y10Y/16rR9GKZqvBFzJ8VdPioQ2wiOkbODe/Hd8qyI
	RtctgeZEbFwXQEvFj+x/sasNdlRFPc7oxZg3cUQ16QhTwT4xj0++R2/sdaTFQOmJw/Jb
	phLi/YBps4eBMxhm+griWYLSpgAqyK70QC8EUcBF4UUBRezPXOIvrIlK6Mu3+Xn1FVnp
	1iiqlMe/fy4XuEvZZb76j2Oru4WiZfUHjFlruPDDeJtp4X2BkUZkMW20pWdoiHd/vwQR
	BFcOKTURMv0bdrPRRv8AIFPJUYdM6izlor5j3/tWNzxOYYVg+sPXf/mXlzDSj6U9HqkL
	aHZg==
X-Received: by 10.140.106.225 with SMTP id e88mr26897514qgf.66.1393237947688; 
	Mon, 24 Feb 2014 02:32:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Mon, 24 Feb 2014 02:32:07 -0800 (PST)
In-Reply-To: <CAMCfZKEPS_2xstq+x_Tpi-PjAGyxChmJ+JnACgBL_euPtQYPSA@mail.gmail.com>
References: <1392731681-6149-1-git-send-email-diego.sueiro@gmail.com>
	<CAJTo0LYn3t67V_u=SA5KT0Ooj616SCHOUH-8qv+=TBONzrCptA@mail.gmail.com>
	<CAMCfZKEPS_2xstq+x_Tpi-PjAGyxChmJ+JnACgBL_euPtQYPSA@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Mon, 24 Feb 2014 07:32:07 -0300
Message-ID: <CAMCfZKEMFAFdO+irSS93euTACH=9YsMkb8w1Ae7u1c==k56Prg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-openembedded][PATCH] libao: Add PACKAGECONFIG for esound support
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
X-List-Received-Date: Mon, 24 Feb 2014 10:32:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 18, 2014 at 11:28 AM, Diego Sueiro <diego.sueiro@gmail.com>wrote:

> Ross,
>
> On Tue, Feb 18, 2014 at 11:10 AM, Burton, Ross <ross.burton@intel.com>wrote:
>
>> > +PACKAGECONFIG ?= ""
>>
>> Shouldn't that be "??=" ?
>>
>
> I've just followed Martin instructions:
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-February/094191.html
>

What is the verdict?

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

