Return-Path: <otavio.salvador@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6A987605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 18:29:40 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id bs8so7164305wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 10:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=W8x91aUtqqxkB9YEAOVal+sAfig9ZGV7x6j9dWM7ACE=;
	b=URa0W+WFGkAnMGKBCPY9AsPWYGuEOvNAB1JJNXnbLgSigsURHqmVdtUD1nM6yEtZSV
	TgI9QtZgqpFAMTEdhj3Js0C/KRJG2rE0/1ClNc7y4FeWk2L30E0eyQdhY4VOvkPo7lYD
	H+/9H97mcucAWNAVsVM28M5P9Hy1Ja2y+v1jaSQ9U42TsUnlPk2EF/InwQzlbpGZNH4V
	KGrQD7dnUEV4jKJP3FLQkL7hPWlpQ8tcvguRb41ALEP/cPvKJcBF2VLBR9RyLW7uITJe
	HdKUw76Qmg+/vrLykimaNlSmRcW2qBcO0IMQQQkBT2m4qSuW2Uwg7bRlvvQosVPgRd+b
	5qow==
MIME-Version: 1.0
X-Received: by 10.180.8.10 with SMTP id n10mr8686720wia.79.1424888981490; Wed,
	25 Feb 2015 10:29:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.27.11.18 with HTTP; Wed, 25 Feb 2015 10:29:41 -0800 (PST)
In-Reply-To: <54ED1B78.4040101@balister.org>
References: <54ED1B78.4040101@balister.org>
Date: Wed, 25 Feb 2015 15:29:41 -0300
X-Google-Sender-Auth: FSqkfBWFfFXKf5k3cFAwgKhn2g8
Message-ID: <CAP9ODKp6xYoi4tfiSv2Pvfc2q7DAKg7zDdLj2-WYcTz9+4Jw8w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>
Subject: Re: [meta-oe][dizzy]Update PyQt and related recipes
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
X-List-Received-Date: Wed, 25 Feb 2015 18:29:41 -0000
Content-Type: text/plain; charset=UTF-8

Hello Philip,

On Tue, Feb 24, 2015 at 9:46 PM, Philip Balister <philip@balister.org> wrote:
> Please pull these three patches into meta-oe/dizzy.
>
> https://github.com/openembedded/meta-oe/pull/19
>
> These lead to a working PyQt4, which will reduce the number of questions
> I get about gnuradio-companion not working on dizzy.
>
> 1) I apologize for using the meta-oe repo instead of meta-openembedded.
> 2) If this is annoying, I can send via email like a sane person.

I think this can be included in the upcoming pull request. Armin, do
you have a branch for me to pick and do it all at same time? This ease
the Martin's life for pulling once.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

