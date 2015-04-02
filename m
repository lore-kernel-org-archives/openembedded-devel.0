Return-Path: <otavio.salvador@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9108660034
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2015 00:33:33 +0000 (UTC)
Received: by wixo5 with SMTP id o5so66781238wix.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 17:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=qrBJn31I0LGjPVZxZxOAHFoQ29JSKrZyLOqxStMsFDA=;
	b=UyGP0se0SfyQg0GJC4lOl3tUvz/K8Zmk8IuKfG0de6Qz7XBjk08doTba966bAqK6Rj
	Y3PM+muVibDL3DaI1cKYlmfINkahQgXgBpCxHmkUiItJ6IJomJJWL8dM8iuOT48/MniV
	PxoYb51D9XHeTdWCx/vrqXywnxF3sqBcsIcuFf0g41WdYsjobICILBOjCsoyC+1VEqhr
	3TUdmraqVqmvK8h426+5iJnq+3B42puhNKwwUR1H0RLwOWng4JuA9aSen3W/N3x0v6+4
	kOgf9f1RbU5CUyGlx1oiGraTuCSL3XjRpX7ZqYB9k2wfVvd83cA9GYuYUr0hTNzvg35Q
	s0Ng==
MIME-Version: 1.0
X-Received: by 10.180.20.177 with SMTP id o17mr19118122wie.66.1427934815001;
	Wed, 01 Apr 2015 17:33:35 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.27.131.224 with HTTP; Wed, 1 Apr 2015 17:33:34 -0700 (PDT)
In-Reply-To: <CAP9ODKpZOQRq8zPth=Svap7v8GuzOT739aGhSRe4uzJKjkrP6g@mail.gmail.com>
References: <CA+chaQdOQKZRW7QH0qHS-ta8+oZDspRVGguF3iMDgOyrPAxg_Q@mail.gmail.com>
	<1427927005-7808-1-git-send-email-gary.robertson@linaro.org>
	<1427927005-7808-2-git-send-email-gary.robertson@linaro.org>
	<CAP9ODKpZOQRq8zPth=Svap7v8GuzOT739aGhSRe4uzJKjkrP6g@mail.gmail.com>
Date: Wed, 1 Apr 2015 21:33:34 -0300
X-Google-Sender-Auth: 37ZU7DiIgrzkmabaSfImqNsCrpQ
Message-ID: <CAP9ODKpdtB_kq173kcoURafhoNGTmQqU2i-RabmG9fJro6KOOg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] libhugetlbfs: Add i586 to list of compatible host architectures
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
X-List-Received-Date: Thu, 02 Apr 2015 00:33:38 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 1, 2015 at 9:31 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Wed, Apr 1, 2015 at 7:23 PM, Gary S. Robertson
> <gary.robertson@linaro.org> wrote:
>> COMPATIBLE_HOST included support for x86_64 but not for
>> 32-bit x86 architectures - added i586 arch name to cover qemux86, etc.
>>
>> Upstream-Status: Inappropriate - OE recipe change only
>
> This field is used in patch files, not commit log of the Git changes. Drop this.

Also, respect version of patch. I think your next send is v4, isn't it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

