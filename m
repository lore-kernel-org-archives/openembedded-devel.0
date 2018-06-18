Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0FF751FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 18:55:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5IItwpu008967
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Jun 2018 11:55:58 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 18 Jun 2018 11:55:57 -0700
To: Khem Raj <raj.khem@gmail.com>, Mark Asselstine
	<mark.asselstine@windriver.com>
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
	<1883916.pZAjriCjz1@yow-masselst-lx1>
	<CAPuovELwUxFTuowgPwN_oBJGMNxxY6XK9QNmgYygyJ6yKdQQgg@mail.gmail.com>
	<CAPuovE+dZu=VX3n_rU6zRQjXnu=XnPpZpQOwPHu6qb7BhWDKJw@mail.gmail.com>
	<CAMKF1srMCX6u3TC2Ybi_aj4w7WLDW-AuVVhKptF+kzJz=P=6JQ@mail.gmail.com>
	<c41dc3e4-7ded-f47c-5120-321dd66e9334@windriver.com>
	<CAMKF1soijupp06kVYOurZv428nNmEYo8WpkuP04m_oxV2CnGow@mail.gmail.com>
	<CAPuovEJx-ghUsXH0NFR8Vc1DJL8AyHXJAbL38oqkrtqbQiAOTw@mail.gmail.com>
	<CAMKF1spbkMcboLaBfw0bv_bf_v5_d=qDHB3ag7pCEL1E5Ni3sA@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.hatle@windriver.com; prefer-encrypt=mutual; keydata=
	xsBNBFYKxFgBCACt/pzutBp6p/xVKTFJjHbM3KpQKCblyot/YP+bpTr51Hrc5xDXBQhoG7TC
	aIRvRIvbhEevEQK9y04gW3JK/5lobq5ORebolcsHlYBUvpNeIPjupLQwGvz/TPtrLRNGLqDC
	rvsM6OA2XbQ2bwzxWaSQS3ImE2O2iXOZn9HhThMGeDB4Nff3fgUvXOTDIrgWOn9K2DgLL7Yc
	zkUIlFdj+Nraksd/7BSk8oH6tjeBVhFqSFvKta9QxWgdr58oPaTYaW/xNqUjlLrbJuMw/MSe
	xzuYfdfDfm6J8kRjMOnwQ0n8svJElzqAk+d83ow38gpGQ+LkjGgnf8ZFJ4rUJFADroX3ABEB
	AAHNJU1hcmsgSGF0bGUgPG1hcmsuaGF0bGVAd2luZHJpdmVyLmNvbT7CwHcEEwEIACEFAlYK
	xFgCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQfv796/r0vvlvZAf9Gs+eN320yhRW
	V/fZCsngKhmOK4v3HrTwFrkSmoD9QHQiE/5IPdNacHwIPwZx07tNBohB8xOeNqCPRYRBwGhA
	AnxKOPyd0nnm6ZhPzbA57v4x3IGRQr4QzvcBTASJq91l3Ew4lpAslyx5w1DPPqRD7G8ycDKg
	peKyDwmdkvCunVisSAQI3XIMq2y230biTO98tDPEezg+lg+yTsz9ZT33F5KNuWrpf8VL5fG/
	mt+kAv7wtsx/KTRbqhH3iFXF6eBSwMjAfTXFlkLfbM9riJGXrWEl9n2S2R3cDHNHug0lb8f4
	whK370KEO4OwRKIYW/VUBmzk5XZUE9DTlDSV8ycsrs7ATQRWCsRYAQgAwK3FuHCE+HW3YWdH
	PUjeSn5p//xJ57u8g2rng8zm9zNjmYgpPv5UxozaD9i2jf4mlQLHGGOezhHae8K4Nj70oVcv
	8AmwcrJa9i9WL1oy/9R3fHMWf/Ctt9VXTO0qlCuq6PDzaUfvsXR61aJIjTKNQTOjCLjY1vXm
	VSewUgARysmA8WrjTfwGBihMBxAX0+kIjx8nOlam0WvekMBXZ0AbS56oTLRxYao6DI3GeB/N
	oWPy/5DfuTKaSdM0Pf8al20x9RuNN5/HLMlyDH/k8bIa1xd9aAqW+Feiw5gC107V2E6ULyIy
	q6em2UrsmIRxrvpHqbNgQKqvTehJ+V/i4g/uOwARAQABwsBfBBgBCAAJBQJWCsRYAhsMAAoJ
	EH7+/ev69L755XAH/3ZcNhooqd9OBhFkvXm1iWZ8EoC7motWqVn2oEyxoonsg8AD9kFXiN+T
	dYp7dH99EZu9q4ptj56AXm4uHzOgywL/5/V2TY6twCGAjUGzDjAB5gzoi+JLIBlDiyOip0eL
	QswIhRk473xy3j8DA4oVamnSPWgyNJ+qsdt37YWDzoDFFvtDoRU7Eb+znfIMDKzlny0XU/8L
	cW1bNHJlpv/78GPdfP4tjysEd8MuA5jf5o5w4XqcwTqalffEJtQ/s3pbkstEi7qm5uPui5Kt
	gq6YYLSqcSNe0GWAF9/T+qwyo7burSTxUWCWtMmlXdAQLW9SynLhB3Jbch0nFAh0fCKi6yY=
Organization: Wind River Systems
Message-ID: <d42b7242-3e89-796d-091a-fa3eb8ddd44d@windriver.com>
Date: Mon, 18 Jun 2018 13:55:56 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spbkMcboLaBfw0bv_bf_v5_d=qDHB3ag7pCEL1E5Ni3sA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-panel: fix QA issue 'installed-vs-shipped'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jun 2018 18:55:58 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/18/18 1:47 PM, Khem Raj wrote:
> On Mon, Jun 18, 2018 at 11:09 AM Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
>>
>> On Mon, Jun 18, 2018 at 1:57 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Mon, Jun 18, 2018 at 10:54 AM Mark Hatle <mark.hatle@windriver.com> wrote:
>>>>
>>>> On 6/18/18 12:50 PM, Khem Raj wrote:
>>>>> Hi Mark
>>>>>
>>>>> It seems your distro is not inheriting it globally. Here I have
>>>>> INHERIT_DISTRO ?=  "debian devshell sstate license remove-libtool"
>>>>
>>>> So is remove-libtool a recipe or a distro option?
>>>>
>>>> I'm asking because doing this half-way is causing a lot of confusion.
>>>>
>>>> If it's a distro option, then the recipes should work without it being set.  If
>>>> it's a recipe option, then the recipes that need it should use it.
>>>>
>>>> Right now it doesn't seem to be working with these recipes because they don't
>>>> package the .la files UNLESS it's enabled.  So the fix is either to package them
>>>> (by default) or inherit the remove-libtool.
>>>>
>>>
>>> since we make it as part of meta/conf/distro/defaultsetup.conf
>>> its a default policy,  its perfectly fine for a distro to disregard that
>>> however, then you fall into a non-default case. I am willing to accept
>>> per recipe patches but I would recommend to consider it as a distro
>>> feature for your distro.
>>>
>>
>> Andreas,
>>
>> Can you revert your "various classes recipes: Remove FILES entries for
>> dbg/dev packages" then? If this is a distro feature then these recipes
>> need to build without the QA issue and without the remove-libtool
>> distro feature being set.
> 
> This is in default features so I would not recommend revert, distros
> not using this feature are in best position to fix it, as I said
> before those patches are acceptable.
> 

I'm confused.  If you say it's a default option, and if you DON'T use it, then
you are responsible for fixing this.  I take that as you want patches to fix the
issue.

The revert will return the original code that packages the .la files (if they
exist) and is the 'patch'.

Right now we have a broken situation where it doesn't work, and a ton of
.bbappends would be needed for a custom distro, and these bbappends would make
it difficult to pass a Yocto Project compliance test.

(I don't really care either way if someone includes or doesn't .la files in a
distribution -- just that since it's even an option -- both sides of the option
should work.  I'm also fine with saying OE only tests one side of the option,
but that means patches should be accepted for the other side.)

--Mark

