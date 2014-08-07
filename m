Return-Path: <eduardo@monkey.io>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id E70D560809
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 15:06:43 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id y20so4886761ier.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Aug 2014 08:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=RjDD2qRyM1iLwb/OgFsdP3q9VhvOY0ktURs9W1nuJ/M=;
	b=hDUgWqrVmsp000FMVG1QDFnQ6IHV9stI+WmX24n0f5IBCI/aOd26Sy+Q6iiuHkBmF0
	8s3+DP4AGxEFgGsLGU6k9xpjM6bMKzmwuYcD8PB8xb8L0bdCmqW2P8phAtboNli/Lx5A
	N3ilbr3nicnBbSVORIkm0lrs4pGNePOcfu/q/KFe0EnxBEV4GIo+h8Vk0QCF2qX6ldGp
	7lWvgKTIPGQvQklQgmunSDIjEtZ0djkEh/LU3s64qc5ch5pTP93iTdqfFIKw2CgDJidA
	4E6/fSIm5+9imwzV2v1vb97U2pUefJZZF/VVpwgT2dm4slNRhpkfL+5hb5zaS+rkTCr4
	t0LA==
X-Gm-Message-State: ALoCoQnekSVBSpNDqGj5zgNm4xqqCSlTrH7UZ7MdKLLprWUCuzyqWE2P4n3WsWNHGcZ5Yr3hA5mO
MIME-Version: 1.0
X-Received: by 10.43.63.134 with SMTP id xe6mr4117801icb.97.1407424003388;
	Thu, 07 Aug 2014 08:06:43 -0700 (PDT)
Received: by 10.107.133.199 with HTTP; Thu, 7 Aug 2014 08:06:43 -0700 (PDT)
In-Reply-To: <20140807074935.GT14848@jama>
References: <1407386976-24889-1-git-send-email-eduardo@monkey.io>
	<20140807074935.GT14848@jama>
Date: Thu, 7 Aug 2014 09:06:43 -0600
Message-ID: <CAEaCVQh_V-XuobximDhnC1o9Z8NsevySSTDJ6Z6XY68LOP5d2g@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-webserver][PATCH] monkey: new v1.5.2 release.
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
X-List-Received-Date: Thu, 07 Aug 2014 15:06:45 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 7, 2014 at 1:49 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Wed, Aug 06, 2014 at 10:49:36PM -0600, Eduardo Silva wrote:
> > This patch add the new Monkey HTTP Server v1.5.2. The new Bitbake file
> > contains the modifications suggested over the patch set for v1.5.1. It
> > specify each configuration file for CONFFILES_${PN}.
> >
> > For more details about software changes please visit:
> >
> >   http://monkey-project.com/Announcements/v1.5.2
>
> Can you please resend with -M?
>

I did it, i will send a new one as Patch v2.

