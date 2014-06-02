Return-Path: <chmorgan@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id F1C2460017
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jun 2014 13:37:42 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id x19so4505543ier.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jun 2014 06:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=d0Ch5EdsnYUhRkCt524BQ5Mzdwz7hOeNUC24pmwB9JE=;
	b=viTb/xD5Jj6Uptmb8m+S/eItp6oUrntRWIPlqOOz7wEdtZp8fH+Qp8Qa+NUfzH/NkP
	BHs6CK+q6gnsB9Xt6lRqOH5wJLgGUrB+zKvvTgj4oJLS/vhpHobLAAppu/tgR+iRDS1b
	9DAMELz0R4swp3GfJLtbTNsjSB6RnGBbZ2cACaR1/CSoInOUusV3VwYeOqwWuoNrHyVS
	yva4iXEHxB+6HRdqBzljm54qsL6Gy5N1m30sHw1MpEekFoFaS10VuoNYyAm2qWw25ZxF
	nBk4vGoBa01uMH4dD4RPiIB9k2zOyUfszS2K7wYKd2yOQIeB9aW/DvgGxDbvcNRQcuKo
	qCng==
X-Received: by 10.50.153.11 with SMTP id vc11mr18998102igb.24.1401716263560;
	Mon, 02 Jun 2014 06:37:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.228.141 with HTTP; Mon, 2 Jun 2014 06:37:22 -0700 (PDT)
In-Reply-To: <CAP9ODKqH3W5VKVWmriVeCTn1Yw5tZCWSSeLoHQJReDEDW2d=BA@mail.gmail.com>
References: <CAAPegz1J+4vrvOF3F9Rj11_0-Lhd0ybFFci-_UXgLtVBhxreYg@mail.gmail.com>
	<CAP9ODKqH3W5VKVWmriVeCTn1Yw5tZCWSSeLoHQJReDEDW2d=BA@mail.gmail.com>
From: Chris Morgan <chmorgan@gmail.com>
Date: Mon, 2 Jun 2014 09:37:22 -0400
Message-ID: <CAAPegz1EzASRh14ZpY017v+v_G-Eo5RFXk6NXm2mGqqLnyvdnw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] dfu-util 0.7 recipe, remove old 0.1 recipe
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
X-List-Received-Date: Mon, 02 Jun 2014 13:37:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 2, 2014 at 9:28 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Sun, Jun 1, 2014 at 2:42 PM, Chris Morgan <chmorgan@gmail.com> wrote:
>> dfu-util 0.7 is the latest release of dfu-util
>>
>> Remove old dfu-util 0.1 recipe
>>
>> Signed-off-by: Chris Morgan <chmorgan@gmail.com>
>
> From the previous discussion it seems there is not reason to keep 0.4
> around. So maybe it'd be good to remove it as well here?
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


If it has to happen to get this change in then I can look at doing
that today. If not then I'd prefer this went in and then I'd be back
in sync with meta-oe and could remove 0.4 in the next patch. I'm
always weary of stacking up too many changes together or having too
many pending at once since I'm really new to the project.

Chris

