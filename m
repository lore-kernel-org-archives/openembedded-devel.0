Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7C8CF6D59C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2013 18:40:29 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id wn1so10588281obc.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Nov 2013 10:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=k81olTkGXAx2mX4l2S9Hcjhu8UM8TOgbYHzRCec+QBo=;
	b=PUFbumUNdkSu59ryQB2g00VyQFKF/oOzHAfN3PTiYvhXTDkBS3ROasKCQkkCLBBDcp
	qRDlIWImxw9loK/imSJTcPm4mS38EBeR3oP7l+358P/MxffgQ6NupWVcja1sSAa9U42/
	Az6ywLvi9ETUJA4xYycy1/mY534FHTDsS99nUEg5JuPA1FCSXhteL/dpaPrzSH5q41YK
	e1wXpd1FKyBCFb/TyjNVCxWUbwrODJz1tJGNg9SEQ/EbO43LEzY6Qdhd1feex6Ur/z7F
	cn39tZz8pNMschMEUMK883G9wUIhuSw3G5clD+ydTZF9rViA7dSVa7yuaTcFfvi2g4s5
	JPvA==
MIME-Version: 1.0
X-Received: by 10.182.84.132 with SMTP id z4mr3756205oby.49.1383763231106;
	Wed, 06 Nov 2013 10:40:31 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 6 Nov 2013 10:40:30 -0800 (PST)
In-Reply-To: <527A8C4C.3030007@balister.org>
References: <52797DE3.8070203@balister.org>
	<527A8C4C.3030007@balister.org>
Date: Wed, 6 Nov 2013 16:40:30 -0200
X-Google-Sender-Auth: g6CtOFvt400Tbl9PQEB98Va4MA4
Message-ID: <CAP9ODKoms8GknEzLgBHb+NOKuNFdp9JvE3-XzNfX7Draqc9FkA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Create meta-sdr
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
X-List-Received-Date: Wed, 06 Nov 2013 18:40:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 6, 2013 at 4:37 PM, Philip Balister <philip@balister.org> wrote:
> On 11/05/2013 03:23 PM, Philip Balister wrote:
>> Based on earlier discussion, we'd like to go ahead and create meta-ssdr
>> based on this branch:
>>
>> https://github.com/balister/meta-oe/commits/meta-sdr
>>
>> Can someone give me a hand getting this setup in git?
>
> Or should I take this silence to suggest I should just host this on github?

Personally I like github; I can host it in our code.ossystems.com.br
if you want as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

