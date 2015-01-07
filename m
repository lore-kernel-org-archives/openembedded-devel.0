Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4CCE47201A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 17:01:01 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id rd18so4692828iec.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2015 09:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rWBXiZ72Xz2w0xz+WvP5J8lE/EJOnMfunEjYYU0zbns=;
	b=v9OmF+go4lyDVwR7cYoaMjB766MtIvmKux4P6kzg9oGcKZdRZMq0CBMehbaSC630At
	J9U5Hy0OH8NeGjSTaGlxnBRzCeLYIn/wdVmQeZF5tyF23MzIQ+VDIAGgIgJsrjaUDNbi
	b3GN0exzOG37PaYa5eEC03rQSDamHLVrQr2TXDG0XxiM1/tAmvlSdNR++f5Hc3KifOyI
	t7jEcnrEliTyTJydFxQScNb7v4pFqSYJXwJwhdyJ6zCFYg8IIO2ESCIv0dr9vR7xnrBR
	pOXkb9uxIzS7wJaljC0z3v+v2I+umFX8URZECooE8wyFWWv0QZnRmTDk7XNP4AoISs0K
	MJ0A==
X-Received: by 10.42.229.132 with SMTP id ji4mr3892738icb.86.1420650061823;
	Wed, 07 Jan 2015 09:01:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Wed, 7 Jan 2015 09:00:31 -0800 (PST)
In-Reply-To: <2220709.jFTZT0BvCv@peggleto-mobl5.ger.corp.intel.com>
References: <54A97D15.4080801@gmail.com>
	<B851B2EA-9E81-40E6-A1E9-B8C30DD9E194@gmail.com>
	<2220709.jFTZT0BvCv@peggleto-mobl5.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Jan 2015 09:00:31 -0800
Message-ID: <CAMKF1so4_twi6X-df5xCbXjd5d1kSg8HdwxP74VNF3hboJhU8Q@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: recent addition of libgxim depends issue
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
X-List-Received-Date: Wed, 07 Jan 2015 17:01:07 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 7, 2015 at 1:27 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> If it's not specifically a ruby-related piece of software (which it doesn't
> seem to be, at a glance) then that wouldn't seem right. Can the ruby
> dependency be disabled by default using PACKAGECONFIG perhaps?

thats another option yes

