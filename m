Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2BA7520F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 17:54:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5IHsV5D005023
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Jun 2018 10:54:31 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 18 Jun 2018 10:54:30 -0700
To: Khem Raj <raj.khem@gmail.com>, Mark Asselstine
	<mark.asselstine@windriver.com>
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
	<1883916.pZAjriCjz1@yow-masselst-lx1>
	<CAPuovELwUxFTuowgPwN_oBJGMNxxY6XK9QNmgYygyJ6yKdQQgg@mail.gmail.com>
	<CAPuovE+dZu=VX3n_rU6zRQjXnu=XnPpZpQOwPHu6qb7BhWDKJw@mail.gmail.com>
	<CAMKF1srMCX6u3TC2Ybi_aj4w7WLDW-AuVVhKptF+kzJz=P=6JQ@mail.gmail.com>
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
Message-ID: <c41dc3e4-7ded-f47c-5120-321dd66e9334@windriver.com>
Date: Mon, 18 Jun 2018 12:54:29 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srMCX6u3TC2Ybi_aj4w7WLDW-AuVVhKptF+kzJz=P=6JQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 18 Jun 2018 17:54:31 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 6/18/18 12:50 PM, Khem Raj wrote:
> Hi Mark
> 
> It seems your distro is not inheriting it globally. Here I have
> INHERIT_DISTRO ?=  "debian devshell sstate license remove-libtool"

So is remove-libtool a recipe or a distro option?

I'm asking because doing this half-way is causing a lot of confusion.

If it's a distro option, then the recipes should work without it being set.  If
it's a recipe option, then the recipes that need it should use it.

Right now it doesn't seem to be working with these recipes because they don't
package the .la files UNLESS it's enabled.  So the fix is either to package them
(by default) or inherit the remove-libtool.

--Mark

> On Mon, Jun 18, 2018 at 10:49 AM Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
>>
>> On Mon, Jun 18, 2018 at 1:15 PM, Mark Asselstine
>> <mark.asselstine@windriver.com> wrote:
>>> On Mon, Jun 18, 2018 at 1:07 PM, Mark Asselstine
>>> <mark.asselstine@windriver.com> wrote:
>>>> On Monday, June 18, 2018 12:51:47 PM EDT Andreas Müller wrote:
>>>>> On Mon, Jun 18, 2018 at 4:45 PM, Mark Asselstine
>>>>>
>>>>> <mark.asselstine@windriver.com> wrote:
>>>>>> Since commit 5f31db601408 [xfce4-panel: upgrade 4.12.2 -> 4.13.3] we
>>>>>>
>>>>>> are getting a QA Warnings/Erros for 'installed-vs-shipped':
>>>>>>     ERROR: xfce4-panel-4.13.3-r0 do_package: QA Issue: xfce4-panel:
>>>>>>
>>>>>>     Files/directories were installed but not shipped in any package:
>>>>>>       /usr/lib64/xfce4/panel/plugins/liblauncher.la
>>>>>>       /usr/lib64/xfce4/panel/plugins/libdirectorymenu.la
>>>>>>       ...
>>>>>>
>>>>>> From various OE documents the .la files should not be packaged in
>>>>>> either the main recipe package or the -dev package unless required. So
>>>>>> inherit 'remove-libtool' to have all the .la files cleaned up as they
>>>>>> don't appear to be necessary.
>>>>>>
>>>>>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>>>>>> ---
>>>>>>
>>>>>> This error is currently only seen on master-next since the xfce4-panel
>>>>>> upgrade commit is yet to make it into master. As such this fix is only
>>>>>> applicable to master-next.
>>>>>
>>>>> I think it was not the upgrade -> 4.13.3 commit but later commit / same
>>>>> series
>>>>>
>>>>
>>>> Sure, I can update the commit log and send a V2 but first let's sort out the
>>>> remainder.
>>>>
>>>>> various classes recipes: Remove FILES entries for dbg/dev packages
>>>>> ...
>>>>> --- a/meta-xfce/classes/xfce.bbclass
>>>>> +++ b/meta-xfce/classes/xfce.bbclass
>>>>> @@ -12,11 +12,3 @@ DEPENDS += "intltool-native"
>>>>>
>>>>>  FILES_${PN} += "${datadir}/icons/* ${datadir}/applications/*
>>>>> ${libdir}/xfce4/modules/*.so*"
>>>>>  FILES_${PN}-doc += "${datadir}/xfce4/doc"
>>>>> -
>>>>> -FILES_${PN}-dev += "${libdir}/xfce4/*/*.la"
>>>>> -FILES_${PN}-dev += "${libdir}/xfce4/*/*/*.la"
>>>>> ...
>>>>>
>>>>> My builds have remove-libtool enabled so I did not see this QA
>>>>> warning/error.
>>>>>
>>>>> Isn't remove-libtool enabled by default since pyro/2.3 - so that this
>>>>> patch is obsolete (and all the other same kind coming later)?
>>>>
>>>> The documentation still indicates:
>>>> ---
>>>> <note>
>>>>             The <filename>remove-libtool</filename> class is not enabled by
>>>>             default.
>>>> </note>
>>>> ---
>>>>
>>>> So as far as I know this still needs to be handled recipe to recipe by
>>>> inheriting the remove-libtool class in the affected recipes. I have done
>>>> builds without manipulating the generated local.conf which seem to confirm
>>>> this but I could be wrong. Add RP who might have some guidance.
>>>>
>>>> MarkA
>>>
>>> Just hit another one
>>> ---
>>> ERROR: gtk-xfce-engine-3.2.0-r0 do_package: QA Issue: gtk-xfce-engine:
>>> Files/directories were installed but not shipped in any package:
>>>  /usr/lib64/gtk-3.0/3.0.0/theming-engines/libxfce.la
>>>  /usr/lib64/gtk-2.0/2.10.0/engines/libxfce.la
>>> Please set FILES such that these items are packaged. Alternatively if
>>> they are unneeded, avoid installing them or delete them within
>>> do_install.
>>> ---
>>> Andreas, seeing as you didn't hit the 'installed-vs-shipped' QA issue
>>> with thunar recipe I suspect the reason you didn't see this is not
>>> related to remove-libtool but rather that you have disabled the
>>> 'installed-vs-shipped' QA check itself.
>>
>> And xfce4-session now too. I found a reference from a few years back
>> related to remove-libtool use on a per recipe basis
>> (http://lists.openembedded.org/pipermail/openembedded-devel/2016-March/106323.html),
>> so definitely some concerns being expressed using this on a per recipe
>> basis. On the other hand this just seems like we are setting traps for
>> ourselves. If we compare to another common class, rm_work, I can
>> pretty much toggle rm_work on or off and recipes are expected to just
>> work in either case. This is definitely not the case with
>> remove-libtool which gives the impression of being optional but if not
>> enabled and I do basic QA checks I will get failures, as is evident in
>> my current build.
>>
>> MarkA
>>
>>>
>>> MarkA
>>>
>>>
>>>>
>>>>>
>>>>> Andreas
>>>>
>>>>
>>>>
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


