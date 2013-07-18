Return-Path: <net147@gmail.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 97A646B1AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2013 01:39:14 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id db10so2019720veb.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 18:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4HCkvdroQrL7hO/fJ3eJVBDtTAiuB7xZeyB/iikCxEk=;
	b=Rj2llIB6qhToyeUAuPBT01eIl6WC4lshytRJciUtPgvdUiMPyjiuZjfm2nGTSy/CG2
	CClCqSlUEJuTsbbevDH8H2lPoJPIq5rfVw7/NQagOZKhJXp0QFQNEGZCWy6C8Uaf1EnH
	Jlj3wTeSHCHqDCeaOUDmCBbjmNNUUnUbTbhh5fOV4ptjO1laePWCqVMjQY/FR54M64EK
	hHFJ/oKQJF+a2gqxaaGYR8L3RVNI0z7ttGZUR/gIxkpv7w24V+cngsDJ2T2IQ2F41kCC
	5LmYTewcF5U64SHMKsBMERt5VkifXlFhN+zg344YXmOWltHSJZhT4gpUmXUQaAco1OwO
	akmw==
MIME-Version: 1.0
X-Received: by 10.220.88.68 with SMTP id z4mr3171462vcl.10.1374111554355; Wed,
	17 Jul 2013 18:39:14 -0700 (PDT)
Received: by 10.58.68.170 with HTTP; Wed, 17 Jul 2013 18:39:14 -0700 (PDT)
In-Reply-To: <CAP9ODKrCitkefwxGU380-Kv9ySNDo0zYS_N5xhj+453X5RAiwQ@mail.gmail.com>
References: <1373078818-18530-1-git-send-email-net147@gmail.com>
	<CAP9ODKo+jxNqd8K4YqRR78YAKrX3bsibt0_npynHL-g3GO935g@mail.gmail.com>
	<CANwerB0xns9fNpTFvMUSbYwkRn+PaGuv3P7hgeeAEGC5YJhxDQ@mail.gmail.com>
	<CAP9ODKrCitkefwxGU380-Kv9ySNDo0zYS_N5xhj+453X5RAiwQ@mail.gmail.com>
Date: Thu, 18 Jul 2013 11:39:14 +1000
Message-ID: <CANwerB26rVJ7eRb0WBQUn5KJKG58B38Tpu0eh9gWH=gDX2X0Qw@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] qt-creator: add new recipe for version 2.7.2
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
X-List-Received-Date: Thu, 18 Jul 2013 01:39:14 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2013 11:09, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Wed, Jul 17, 2013 at 10:04 PM, Jonathan Liu <net147@gmail.com> wrote:
>> On 7 July 2013 06:10, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>> On Fri, Jul 5, 2013 at 11:46 PM, Jonathan Liu <net147@gmail.com> wrote:
>>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>>
>>> This recipe seems to be usable in target but it'd be great if Qt
>>> Creator could also be build as a toolchain part; did you try it?
>>
>> I haven't tried that.
>
> Is it at your roadmap?

Not at the moment. Feel free to have a go at it if you like.

Regards,
Jonathan

