Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id D56D26B1C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2013 01:09:00 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wd20so3068942obb.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 18:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=VlkdWesb3paiUoXO/7CFUDjZ5AaPqOfV2XNKSTyw8f8=;
	b=MoR0z73hTf2wykA3ImFN8a2BTBlr0CZV2rvVhTDL7l/i3XuEEk1PIDHg6EFAXIOdLN
	JTxQ469XtK0yivyPJ/QhBiAYAdMb4beV1gY3eLT3XJQK6aZr3VFnRzEVMMHvinRPFn7F
	ZjF8Ks9c2loU7RDOlLCIoE/7Qp7sfg6hJGPvOBDjUN1XC1VSi8R9DXvEjFsYZ0hZipVL
	znZabTRuFwFjI/OuqjcsrYq/Fyf6eFrIq3yXVnAgmESetoYFsVvT2cnj8Po24f6APAvX
	bGngIeYK8AqJqgYKhOLLlI3NRGNa+sydxVStPK1YbxlCZhsoc0lWhy7/mC+5387hLHaD
	qEDA==
MIME-Version: 1.0
X-Received: by 10.182.165.133 with SMTP id yy5mr5356995obb.89.1374109741180;
	Wed, 17 Jul 2013 18:09:01 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Wed, 17 Jul 2013 18:09:01 -0700 (PDT)
In-Reply-To: <CANwerB0xns9fNpTFvMUSbYwkRn+PaGuv3P7hgeeAEGC5YJhxDQ@mail.gmail.com>
References: <1373078818-18530-1-git-send-email-net147@gmail.com>
	<CAP9ODKo+jxNqd8K4YqRR78YAKrX3bsibt0_npynHL-g3GO935g@mail.gmail.com>
	<CANwerB0xns9fNpTFvMUSbYwkRn+PaGuv3P7hgeeAEGC5YJhxDQ@mail.gmail.com>
Date: Wed, 17 Jul 2013 22:09:01 -0300
X-Google-Sender-Auth: vWvRv-mnQvu3WZFr2GiNlAl_Wtg
Message-ID: <CAP9ODKrCitkefwxGU380-Kv9ySNDo0zYS_N5xhj+453X5RAiwQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Jonathan Liu <net147@gmail.com>
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
X-List-Received-Date: Thu, 18 Jul 2013 01:09:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 17, 2013 at 10:04 PM, Jonathan Liu <net147@gmail.com> wrote:
> On 7 July 2013 06:10, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> On Fri, Jul 5, 2013 at 11:46 PM, Jonathan Liu <net147@gmail.com> wrote:
>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>
>> This recipe seems to be usable in target but it'd be great if Qt
>> Creator could also be build as a toolchain part; did you try it?
>
> I haven't tried that.

Is it at your roadmap?

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

