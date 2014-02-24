Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 107C96E89C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 10:52:53 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id e16so1756960qcx.33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 02:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=1YfakEIuENo4VrHOEHxSq2hStdjKDTRh461C0XYk5Gg=;
	b=O9B8uLGS5AwdY3MG/8DIUCpFMUGL1E/joenP3czCAHuQDfNuqf1L1UtcCKvtj3zcPH
	YP0xiFvUkIrpnWoNgmITkZvTWWvBpSm673PpBZ8jAcnviaRBdQ+chYKwcmZy+8adKh0h
	M2h83o2fH64iPP9eHj/Qm+0cjnFvQ/M/p7osWkyGaFUOQHNKs2fqCu51dhy58CNMUY4g
	HWmeoRgf2VFmrpRCYk0K1YJFj8gqUiMANsb0Q1X51JryBC6P/P8IbBzqR864AUG2K65q
	JbXOwxnJ9kBhwWrs31HyMZ+huO53+4kqHH/D3xJCC8Rw5gop4FJ108DllfqxdWkN4xqd
	YHwg==
X-Received: by 10.224.162.200 with SMTP id w8mr28843830qax.1.1393239174266;
	Mon, 24 Feb 2014 02:52:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Mon, 24 Feb 2014 02:52:34 -0800 (PST)
In-Reply-To: <20140224103722.GB26981@jama>
References: <1392731681-6149-1-git-send-email-diego.sueiro@gmail.com>
	<CAJTo0LYn3t67V_u=SA5KT0Ooj616SCHOUH-8qv+=TBONzrCptA@mail.gmail.com>
	<CAMCfZKEPS_2xstq+x_Tpi-PjAGyxChmJ+JnACgBL_euPtQYPSA@mail.gmail.com>
	<CAMCfZKEMFAFdO+irSS93euTACH=9YsMkb8w1Ae7u1c==k56Prg@mail.gmail.com>
	<20140224103722.GB26981@jama>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Mon, 24 Feb 2014 07:52:34 -0300
Message-ID: <CAMCfZKFNKqb2da7TSMN6VmzydLjNMgVOAohNRXtpYAB7AyjnrA@mail.gmail.com>
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
X-List-Received-Date: Mon, 24 Feb 2014 10:52:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 7:37 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> ?= is correct (there was discussion about this on oe-core ML)
>
> It was merged yesterday.
>
> http://git.openembedded.org/meta-openembedded/commit/?id=bc6e6112e6c7082241c69fb3d8277b267dd5620a
>
Thanks Martin,
I didn't saw that it was already merged.


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

