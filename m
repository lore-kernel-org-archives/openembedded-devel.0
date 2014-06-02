Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1E2986059A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jun 2014 14:11:04 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id 29so3846321yhl.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jun 2014 07:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=tUuG6TcG6cUz+y35hkUmM0/2z6mAwyE4eez371UCkEA=;
	b=NKz5HO4N4DmoZpt7QTHP0bfz0ran2vglpj1GstfLgzYpq5cTuoOIySyG4zFKj1skBx
	dVB8I27y/2Ek7ok+Fdq2DHTg/uWAnGzfkANu17lywdj3WxX6BvYejuoZsqBGZHAfwglR
	mdYqhFXRNx3UgslL1JwIjZwRhKf8gOXLNCWNQnImhEMuw5OTwCdzkwBfwBGqX/j+Oi+u
	K6FBlAGxh/+EGqsVxZi7ATTxvKi/E/nStCnAo4L2g8n9Ltu9X5IDADA/xLU3xwf5p+pa
	luH6aWCcerBRT+sg+Op64SVfLOmsqSPZFeil5miC0C/0CDWNdfJQVKNf3Ba76ZUcJdwh
	mbsg==
MIME-Version: 1.0
X-Received: by 10.236.74.33 with SMTP id w21mr51448837yhd.87.1401718264531;
	Mon, 02 Jun 2014 07:11:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Mon, 2 Jun 2014 07:11:04 -0700 (PDT)
In-Reply-To: <CAAPegz1EzASRh14ZpY017v+v_G-Eo5RFXk6NXm2mGqqLnyvdnw@mail.gmail.com>
References: <CAAPegz1J+4vrvOF3F9Rj11_0-Lhd0ybFFci-_UXgLtVBhxreYg@mail.gmail.com>
	<CAP9ODKqH3W5VKVWmriVeCTn1Yw5tZCWSSeLoHQJReDEDW2d=BA@mail.gmail.com>
	<CAAPegz1EzASRh14ZpY017v+v_G-Eo5RFXk6NXm2mGqqLnyvdnw@mail.gmail.com>
Date: Mon, 2 Jun 2014 11:11:04 -0300
X-Google-Sender-Auth: DGgRjL8mCuuPKAT8GWUDyT6Zo-k
Message-ID: <CAP9ODKo5SPZ29J-Ory1TpjCa6b8WKie6orekG2G1TqJkEazPFw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 02 Jun 2014 14:11:12 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 2, 2014 at 10:37 AM, Chris Morgan <chmorgan@gmail.com> wrote:
> On Mon, Jun 2, 2014 at 9:28 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> On Sun, Jun 1, 2014 at 2:42 PM, Chris Morgan <chmorgan@gmail.com> wrote:
>>> dfu-util 0.7 is the latest release of dfu-util
>>>
>>> Remove old dfu-util 0.1 recipe
>>>
>>> Signed-off-by: Chris Morgan <chmorgan@gmail.com>
>>
>> From the previous discussion it seems there is not reason to keep 0.4
>> around. So maybe it'd be good to remove it as well here?
>
> If it has to happen to get this change in then I can look at doing
> that today. If not then I'd prefer this went in and then I'd be back
> in sync with meta-oe and could remove 0.4 in the next patch. I'm
> always weary of stacking up too many changes together or having too
> many pending at once since I'm really new to the project.

Great.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

