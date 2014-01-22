Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 12F646002A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 17:26:26 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id uy5so769972obc.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 09:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=iHwFDwfGhRF6NKW5p6y4lVaIDLPcdH5yepF65hrDJMM=;
	b=viaTuDRmLZE/gFdQ3z0HZRh7ciV6JmANbx2+6jJ+xwWcG6gnjaS1zmzvU+coz8GRS7
	oKm6GGXlAxDHwkqWoWvyZ4MTqE0yqeI0qJDLNApyaaQ97FFKkqTHEfT/kVlhOrm4/vC+
	ExxE0OJjusc4M2zTUMGbSbtMiyY99er/+9fFCcxvVYZSgUtBUkNSds9EnSQiIcD1N6QC
	AYC3BeyGiA0ahjg+cBSk3T62VzBHvgAmissh2OfsLbILuI4FvVsZcrHoLCbV6G0u6BVU
	ZGEyNyeru0QW6sUzq9sEAQT5ogjhTOu6f34Sk6DtRNiRtq6UliyscTmqmTd6Bfo/5v1N
	NwVw==
MIME-Version: 1.0
X-Received: by 10.182.194.5 with SMTP id hs5mr2321790obc.19.1390411586886;
	Wed, 22 Jan 2014 09:26:26 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 09:26:26 -0800 (PST)
In-Reply-To: <CAMKF1sru7FBY7o5guup7zvHD6BxJzkvav+DRqSzoe9t+KTnyJA@mail.gmail.com>
References: <1390302526-3333-1-git-send-email-koen@dominion.thruhere.net>
	<1688777.CYGoEHJ1ll@leo>
	<CAP9ODKrEm_WCLnx2quebWu8rrpnGbvjXKp9Vn5_8c_J1unhMwg@mail.gmail.com>
	<CAMKF1sru7FBY7o5guup7zvHD6BxJzkvav+DRqSzoe9t+KTnyJA@mail.gmail.com>
Date: Wed, 22 Jan 2014 15:26:26 -0200
X-Google-Sender-Auth: _8n3gHxflqPkPWdHq2K5G_VakmQ
Message-ID: <CAP9ODKpY8vTBn1uvs6umJsnfvf85hYHSF_UFG1KcR_p=ahXFqg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-initramfs][PATCHv2] dracut: add git version
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
X-List-Received-Date: Wed, 22 Jan 2014 17:26:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 22, 2014 at 3:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Jan 22, 2014 at 6:35 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> I am not sure this is 'core'; maybe 'recipes-support'?
>
>
> well we are in initramfs layer and dracut could be a core recipe for
> initramfs layer

Ok; agreed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

