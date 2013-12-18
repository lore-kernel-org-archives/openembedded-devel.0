Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id BCA5560DCA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 19:57:40 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id q8so51953lbi.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 11:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Gnga/YZnlw3cSf4DAysuhCjooD+Tnu9uj8GKixFu0B0=;
	b=QFm07MudMPMQd5Ej0+EcBGjjjW0fjCoR7qHC0TLdaiJbIRV6M2FfHsLzi2id3vbcFE
	PuOS0WhsNiWYy2ZrtM6R57D3rEsATL0+cktFDgD0y78CMvttm3hNYhBSG+oa6Jo6Rbtz
	SniaRcd73Ltqee71owhvwLg0JY3rbduPAEqVFBV231iNNUfn8E+TVm7DMF+mmgPnOlBc
	cZGpNXBH1hsJWgxCyuM1ONanjb+oXh30VFLT4Oh5J5rYWJUvc9MlbGNy63Ow0F2DAQdA
	2+Li2+cgXxi/YrVGQB7G3A7zEYfwYYbDxNX6ftpx8sq7auu24i7CN4y0kSZIjcBFQFsW
	qYZw==
X-Received: by 10.152.88.8 with SMTP id bc8mr6210807lab.47.1387396660829;
	Wed, 18 Dec 2013 11:57:40 -0800 (PST)
Received: from [192.168.43.232] ([94.234.170.49])
	by mx.google.com with ESMTPSA id z3sm854163lag.10.2013.12.18.11.57.39
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Dec 2013 11:57:39 -0800 (PST)
Message-ID: <52B1FE31.8040109@gmail.com>
Date: Wed, 18 Dec 2013 20:57:37 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1387377264-27790-1-git-send-email-david.nystrom@enea.com>
	<20131218155821.GM3706@jama>
In-Reply-To: <20131218155821.GM3706@jama>
Cc: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.nystrom@enea.com>
Subject: Re: [PATCH] [meta-oe] pcsc-lite: Fixed md5sum for tarball
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
X-List-Received-Date: Wed, 18 Dec 2013 19:57:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On ons 18 dec 2013 16:58:21, Martin Jansa wrote:
> On Wed, Dec 18, 2013 at 03:34:24PM +0100, David Nyström wrote:
>> Signed-off-by: David Nyström <david.nystrom@enea.com>
>
> Can you download old tarball from some mirror and describe content diff
> in commit message?
>
> If you fail to find tarball with old checksum I'll send it to you from
> my world builds.

Hmm, the link seems to be corrupt.
tarball cant be unpacked, may have fired away this patch prematurely.
Will return with V2,

sorry about that.
/David


>> ---
>>   meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)


