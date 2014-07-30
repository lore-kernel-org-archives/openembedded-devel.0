Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 793C070943
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 17:20:42 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id 19so846335ykq.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 10:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=3CdnH53Fpv9e1+14TK81phDvUOBP48RvolqOYSuHRVU=;
	b=p3WW7qb61op98YxyZpSa6oR6T5yCKIno6qxnF1ob9AIzKJOdb49bGubx01Tn92KZpU
	+0R3rvk0g4Q8qACs7QvagZh8iJyXzUUiJCq5XrDv+kUAarWJSl2iiWWpFUjmBd4F3kMb
	mfQR8yn5nrNq4SMps7W/pgsilwtDeGvva0wQzl4ysvnf7UMq5lnXeSy6+C5CCg5WnCjv
	B8N0E/kYIWQMOd9HUx8dJ/ih58O54DX+o8m9H4rux/Gben6+IIEu7U+xIu+woj7HiJKj
	6AZ7bhSoNXGEsqv7oKjFPxKzGpFzhO9FM43Yq6Yvr0xTv5qTCbxinasJ1D/w22/shcjD
	7GVA==
MIME-Version: 1.0
X-Received: by 10.236.162.7 with SMTP id x7mr8350947yhk.6.1406740842992; Wed,
	30 Jul 2014 10:20:42 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Wed, 30 Jul 2014 10:20:42 -0700 (PDT)
In-Reply-To: <CAMKF1soqe5woG5DcO9FP0tPVpprtgnHKMY4W8HcThZWTdncioA@mail.gmail.com>
References: <1406629327-29169-1-git-send-email-dv@pseudoterminal.org>
	<CAMKF1sqknbM=rXZCRLjPtcHG_1-D1wV+XtBDtao2kOTG9F81+g@mail.gmail.com>
	<CAP9ODKq=mNeFOf_DMTNiiT4Lj0H=zujFyad97=E1K+KGTrr5OQ@mail.gmail.com>
	<CAMKF1srBNaC9hA8Sq_-jV3qmwn+SM4-nXpmvSBfU3+VftCUEZg@mail.gmail.com>
	<CAP9ODKo8o-bidnDgAUQZD5Yek_9fHg2FWR=m8+xE=-pLS4ttMA@mail.gmail.com>
	<CAMKF1soqe5woG5DcO9FP0tPVpprtgnHKMY4W8HcThZWTdncioA@mail.gmail.com>
Date: Wed, 30 Jul 2014 14:20:42 -0300
X-Google-Sender-Auth: gKsLtYN3fOTYbPhgl3RpYgMTO-g
Message-ID: <CAP9ODKrGvfvLECSEaP0cABCO9+VPK8goP3GKtEaaagms8Uid5A@mail.gmail.com>
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
X-List-Received-Date: Wed, 30 Jul 2014 17:20:55 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 30, 2014 at 2:01 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Jul 30, 2014 at 6:02 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> As I explained, this is the requirement for some projects we've been
>> involved with. The idea here is to share it in a 'reusable' way and
>> avoid this patch to be kept private for no good reason.
>
> than have it in bbappends would solve it.

Yes; it does. But duplicated among all users doing it (in our case 2 already).

>> I think it is fine as is.
>
> For you yes I understand, do you have say of other folks who use this layer ?

No; only you.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

