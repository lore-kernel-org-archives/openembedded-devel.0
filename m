Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id E1BA66EE0D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 12:03:03 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id i57so248412yha.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 04:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=DHlFXWT1nx/Tsp2e11WD5gfTSStugRMenKX48dPj52E=;
	b=U7qdxgwKiAr/blpr3WvTgSbND5k2y97ncj6giSVxzOCZIl/dzzliAr750AX2WYzYdg
	qnvC5cGHhq/jP0rL9/bMuMJJnH7sEq/D5HoCIR8/s3MVuzFhB8s5TINSQnA1eH0fIUZg
	PH+zkpQj2nb7O5qbfzmmfzFx9syyE+QcO0oEb+J07WtTETgtHltzssTgeD8QnGoLo8Rz
	Vdn6l86VxSRxwilw8p6EDw0VGtDnRN3NDFKUr56epH+iKKNo2w9+KsW0l990ZG70JWSx
	ftpL+5Mfwy7sLZb55sNQ11XXMWJNSPAwxhyfuPivxHG17gjOC4fo1OJMBZVymJeNd8jG
	ZcCQ==
MIME-Version: 1.0
X-Received: by 10.236.84.135 with SMTP id s7mr778653yhe.148.1392811384872;
	Wed, 19 Feb 2014 04:03:04 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Wed, 19 Feb 2014 04:03:04 -0800 (PST)
In-Reply-To: <66319671.qyeNrjsMK8@peggleto-mobl5.ger.corp.intel.com>
References: <1392655039-10538-1-git-send-email-Martin.Jansa@gmail.com>
	<66319671.qyeNrjsMK8@peggleto-mobl5.ger.corp.intel.com>
Date: Wed, 19 Feb 2014 09:03:04 -0300
X-Google-Sender-Auth: 8d5DUTGobP7y9ixwrxHqIzalfYY
Message-ID: <CAP9ODKr_MA0oDk92RjRgQ5F0OAxmXFr6YWrnPYkm_xq17qu4Rg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-browser][PATCH] nspr: Rename .bbappend to match new version from oe-core
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
X-List-Received-Date: Wed, 19 Feb 2014 12:03:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 17, 2014 at 1:41 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 17 February 2014 17:37:19 Martin Jansa wrote:
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  recipes-support/nspr/{nspr_4.10.2.bbappend => nspr_4.10.3.bbappend} | 0
>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>  rename recipes-support/nspr/{nspr_4.10.2.bbappend => nspr_4.10.3.bbappend}
>> (100%)
>>
>> diff --git a/recipes-support/nspr/nspr_4.10.2.bbappend
>> b/recipes-support/nspr/nspr_4.10.3.bbappend similarity index 100%
>> rename from recipes-support/nspr/nspr_4.10.2.bbappend
>> rename to recipes-support/nspr/nspr_4.10.3.bbappend
>
> This bbappend should be merged back into OE-Core - meta-browser shouldn't be
> carrying generic fixes for a core recipe. Could someone please sort that out?

Agreed. Personally I cannot work on this at this moment but I agree
this should be ported.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

