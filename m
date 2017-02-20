Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 496B36011F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 16:03:38 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AYR2tiBOrosbAmeCOtRsl6mtUPXoX/o7sNwtQ0KIM?=
	=?us-ascii?q?zox0I/TzrarrMEGX3/hxlliBBdydsKMZzbOM+P+xEUU7or+5+EgYd5JNUxJXwe?=
	=?us-ascii?q?43pCcHRPC/NEvgMfTxZDY7FskRHHVs/nW8LFQHUJ2mPw6arXK99yMdFQviPgRp?=
	=?us-ascii?q?OOv1BpTSj8Oq3Oyu5pHfeQtFiT69bL9oMRm6swrdu8sSjIB/Nqs/1xzFr2dSde?=
	=?us-ascii?q?9L321oP1WTnxj95se04pFu9jlbtuwi+cBdT6j0Zrw0QrNEAjsoNWA1/9DrugLY?=
	=?us-ascii?q?TQST/HscU34ZnQRODgPY8Rz1RJbxsi/9tupgxCmXOND9QL4oVTi+6apgVQTlgz?=
	=?us-ascii?q?kbOTEn7G7Xi9RwjKNFrxKnuxx/2JPfbIWMOPZjYq/RYdYWSGxcVchTSiNBGJux?=
	=?us-ascii?q?YZYRAeoPPehWrIfzqFUBohS8GQaiC/jiyiNLi3LswaE2z+osHAPA0Qc9H9wOqn?=
	=?us-ascii?q?PUrNDtOakWS++60K7Iwi7Eb/xOxTr98pLHch88ofGKQL1/b9Lex1M1EAPfkFqR?=
	=?us-ascii?q?qJHuMjSX1usXqWiU9eVgVf+pi2E6tQ58uTmvxsg2hYnNh4Ia0ErI+jl+wIYwPN?=
	=?us-ascii?q?C1TlNwb9CjEJtVrS6aNo12T9s+TGFooiY6zbgGuZ+mfCgP0pgnwATfa/Off4iP?=
	=?us-ascii?q?+hLsSuCRLil9hH1+Zr2wmgu9/la9xeHmUcm0yllKoyxYmdfPrnAAzxje5tWdRv?=
	=?us-ascii?q?dg40us2yyD2gTX5+1ePEw5larWJpg8ybAqjJUTq17MHirulUXzi6+Za1sr9/Cz?=
	=?us-ascii?q?6+TifrXmvpicN5Joig3mMqQhhMi/AeMgPwgARWeb/+W91Lzl/ULnWrlKj/I2nb?=
	=?us-ascii?q?PdsJDbP8sXvLK2AwhQ0oo76ha/CSmp0MgAkHQDMV5JYg+Lg5XrNl3UJP31Ce2z?=
	=?us-ascii?q?j0msnTpr3/zGO6fuApTJLnjNirfherN95lZeyAUp19BQ/Z1UCqwHIP3uRED8r9?=
	=?us-ascii?q?3YDhAjPAywwuboEs9x2Z8ZWWKKGqOZKr/dsUeU5uIzJOmBfIgVuCrnJPg75v7u?=
	=?us-ascii?q?imQ0mVgGfamy3ZoXc2y4EepjI0WCe3bjntABEWIQsgUlVuzgkEeCXiJLZ3auQ6?=
	=?us-ascii?q?I84Sk2CIW+DYjdQICinrmB0zylEZJLe29JFE2DHW71eIqaRfcDdiaSL9RlkjwF?=
	=?us-ascii?q?TrihV5Qh2QuptA/i1bVnKPTb+igDup39ydd6+vPcmgwo+TxzFcSd3DLFc2YhmX?=
	=?us-ascii?q?sFQTIz1q1zrUFxj1uOz6V8q/hZDsBIofRRXwE3MJTRw+B3B5b1QA2SUM2OTQOE?=
	=?us-ascii?q?S96hCzYGZ8g4zMIIb0tKI1S4gwKLiyijGbYairqHCbQ1/avY3nG3LMF4nSWVnJ?=
	=?us-ascii?q?I9hkUrF5McfVatgbRyok2KX9bE?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AaBAAoEqtY/5tjdVteGgEBAQECAQEBA?=
	=?us-ascii?q?QgBAQEBFQEBAQMBAQEJAQEBgydhKl+DW4oIcpEilTQoGYFEBx8NgkCCbEoCgkg?=
	=?us-ascii?q?/GAEBAQEBAQEBAQEBYSiCMyIBghoBAQEBAgEBASEPATsLBQcECxEBAwEBAQICI?=
	=?us-ascii?q?wMCAicBHgMGCBMGAgEBiWMMAQmtfoImi08BAQEBAQEBAQEBAQEBAQEBAQEBAR6?=
	=?us-ascii?q?BC4VBggWCaocgOoJfBYkfh3GKdIZ0hgyFHYF7U4REiXiTIh84gQBTU4UAgUk/N?=
	=?us-ascii?q?QEBiw8BAQE?=
X-IPAS-Result: =?us-ascii?q?A2AaBAAoEqtY/5tjdVteGgEBAQECAQEBAQgBAQEBFQEBAQM?=
	=?us-ascii?q?BAQEJAQEBgydhKl+DW4oIcpEilTQoGYFEBx8NgkCCbEoCgkg/GAEBAQEBAQEBA?=
	=?us-ascii?q?QEBYSiCMyIBghoBAQEBAgEBASEPATsLBQcECxEBAwEBAQICIwMCAicBHgMGCBM?=
	=?us-ascii?q?GAgEBiWMMAQmtfoImi08BAQEBAQEBAQEBAQEBAQEBAQEBAR6BC4VBggWCaocgO?=
	=?us-ascii?q?oJfBYkfh3GKdIZ0hgyFHYF7U4REiXiTIh84gQBTU4UAgUk/NQEBiw8BAQE?=
X-IronPort-AV: E=Sophos;i="5.35,186,1484002800"; d="scan'208";a="242154135"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 20 Feb 2017 17:03:37 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cfqR7-0001cy-Dv; Mon, 20 Feb 2017 17:03:37 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cfqR4-0007xc-EV; Mon, 20 Feb 2017 17:03:34 +0100
To: openembedded-devel@lists.openembedded.org
References: <1486037824-303-1-git-send-email-jaragunde@igalia.com>
	<417f4579-bbbf-2996-ed75-9a9b3fc71a35@igalia.com>
	<021701d27d52$70efce00$52cf6a00$@neuf.fr>
	<8a8cfdfa-a4bd-186d-cf2f-3c4b85e97444@igalia.com>
	<6D9FE7AD-421A-4989-AB98-68A80D401138@neuf.fr>
	<d8323c70-d699-8cea-9962-4becc79ead74@igalia.com>
	<CA+chaQdiXjSFu0VAv9RSQtuonbOv-sOb9HyWsucpLHR4YkN6rg@mail.gmail.com>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <3d15245a-8fb1-f9a7-b924-a08ac37cb0bb@igalia.com>
Date: Mon, 20 Feb 2017 17:03:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdiXjSFu0VAv9RSQtuonbOv-sOb9HyWsucpLHR4YkN6rg@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH] chromium-wayland: fix compilation problem on non-X11 builds
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
X-List-Received-Date: Mon, 20 Feb 2017 16:03:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Martin,

On 15/02/17 19:39, Martin Jansa wrote:
> It still fails for qemux86 as reported in:
> http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/111221.html
> 
> can someone please look into it?

Let me take a look along this week. Thanks for the heads-up.

Best,
-- 
Jacobo Aragunde
Software Engineer at Igalia


> On Wed, Feb 15, 2017 at 7:17 PM, Jacobo Aragunde Pérez <jaragunde@igalia.com
>> wrote:
> 
>> Hi everyone!
>>
>> The patch in this thread has been recently merged. Thanks for your review!
>>
>> On 02/02/17 16:33, Herve Jourdain wrote:
>>> Hi Jacobo,
>>>
>>> OK, I will send those extra patched to the meta-raspberry list tomorrow
>> then.
>>>
>>
>> Sorry to ping you again on this, Herve O:-) I haven't found your patches
>> around in yocto ML and I would like to try them. May I be following the
>> wrong ML?
>>
>> Thanks in advance,
>> --
>> Jacobo Aragunde
>> Software Engineer at Igalia
>>
>>
>>>> On 2 Feb 2017, at 21:28, Jacobo Aragunde Pérez <jaragunde@igalia.com>
>> wrote:
>>>>
>>>>> On 02/02/17 13:46, Herve Jourdain wrote:
>>>>> Hi Jacobo,
>>>>>
>>>>> I'm using "master", and I do have patches for enabling armv7ve. But
>> since
>>>>> they're needed only for raspberrypi, I planned to submit them only for
>>>>> meta-raspberrypi.
>>>>> If you think it could be useful in meta-browser, though, I can submit
>> them there.
>>>>>
>>>>
>>>> Oh, I think sending them to meta-rpi would be good enough, thank you!
>>>> I'll keep an eye on it.
>>>>
>>>> Best regards,
>>>> --
>>>> Jacobo Aragunde
>>>> Software Engineer at Igalia
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Jacobo Aragunde Pérez [mailto:jaragunde@igalia.com]
>>>>> Sent: jeudi 2 février 2017 13:30
>>>>> To: openembedded-devel@lists.openembedded.org
>>>>> Cc: otavio@ossystems.com.br; Herve Jourdain <herve.jourdain@neuf.fr>
>>>>> Subject: Re: [meta-browser][PATCH] chromium-wayland: fix compilation
>> problem on non-X11 builds
>>>>>
>>>>> Thank you all for your reviews. This should be the last patch, it
>> addresses Herve's problem when building on a Raspberry Pi.
>>>>>
>>>>> Unfortunately, I haven't been able to reproduce his problem myself,
>> but this patch is actually a backport of an upstream patch, so it makes no
>> harm in my opinion.
>>>>>
>>>>> Another question, are you using krogoth in you rpi build? I found
>> problems with the declared architecture in releases newer than jethro, it
>> is called "armv7ve" and chromium doesn't build because it expects "armv7a".
>> We could use a patch if you have worked around this problem :)
>>>>>
>>>>> Thanks again,
>>>>> --
>>>>> Jacobo Aragunde
>>>>> Software Engineer at Igalia
>>>>>
>>>>>
>>>>>> On 02/02/17 13:17, Jacobo Aragunde Pérez wrote:
>>>>>> Certain build configurations enable a code path that includes
>>>>>> keyboard_code_conversion_xkb.cc, but it eventually fails in non-X11
>>>>>> environments because of a missing patch that is present upstream.
>>>>>>
>>>>>> This commit adds the missing patch from
>>>>>> https://codereview.chromium.org/2239833003
>>>>>>
>>>>>> There are two versions of the patch in the code review URL above.
>>>>>> The first version fixes the problem both under the gyp and GN build
>>>>>> systems. That patch was rejected because gyp is considered deprecated
>>>>>> upstream. The second version fixes the problem only on GN and it was
>>>>>> merged upstream. We are picking the first version because our recipes
>>>>>> still use gyp to build.
>>>>>>
>>>>>> Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
>>>>>> ---
>>>>>> .../chromium/chromium-wayland_53.0.2785.143.bb     |  1 +
>>>>>> .../fix-non-x11-build-when-use_xkbcommon-1.patch   | 51
>> ++++++++++++++++++++++
>>>>>> 2 files changed, 52 insertions(+)
>>>>>> create mode 100644 recipes-browser/chromium/
>> chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
>>>>>>
>>>>>> diff --git a/recipes-browser/chromium/chr
>> omium-wayland_53.0.2785.143.bb b/recipes-browser/chromium/chr
>> omium-wayland_53.0.2785.143.bb
>>>>>> index a75918b..ef913a7 100644
>>>>>> --- a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
>>>>>> +++ b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
>>>>>> @@ -13,6 +13,7 @@ SRC_URI += "\
>>>>>>         file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch
>> \
>>>>>>         file://chromium-wayland/remove-Werror.patch \
>>>>>>         file://chromium-wayland/guard-x11_desktop_handler-inclusion.patch
>> \
>>>>>> +        file://chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
>> \
>>>>>>         ${@bb.utils.contains('PACKAGECONFIG', 'component-build',
>> 'file://component-build.gypi', '', d)} \
>>>>>>         ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context',
>> 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '',
>> d)} \
>>>>>> "
>>>>>> diff --git a/recipes-browser/chromium/chromium/chromium-wayland/fix-
>> non-x11-build-when-use_xkbcommon-1.patch b/recipes-browser/chromium/
>> chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
>>>>>> new file mode 100644
>>>>>> index 0000000..976ece9
>>>>>> --- /dev/null
>>>>>> +++ b/recipes-browser/chromium/chromium/chromium-wayland/fix-
>> non-x11-build-when-use_xkbcommon-1.patch
>>>>>> @@ -0,0 +1,51 @@
>>>>>> +From: jbriance <jbriance@cisco.com>
>>>>>> +Subject: keycodes: Fix non-X11 build when use_xkbcommon=1
>>>>>> +
>>>>>> +Since M51, ui/events/keycodes/xkb_keysym.h follows X11 path, even if
>>>>>> +use_xkbcommon=1 is set because USE_XKBCOMMON is not defined, leading
>>>>>> +to the following compilation error in this case:
>>>>>> +
>>>>>> +  In file included from ../../ui/events/keycodes/
>> keyboard_code_conversion_xkb.h:12:0,
>>>>>> +                   from ../../ui/events/keycodes/
>> keyboard_code_conversion_xkb.cc:5:
>>>>>> +  ../../ui/events/keycodes/xkb_keysym.h:19:19: fatal error:
>> X11/X.h: No such file or directory
>>>>>> +
>>>>>> +BUG=none
>>>>>> +
>>>>>> +Review-Url: https://codereview.chromium.org/2239833003
>>>>>> +--
>>>>>> +
>>>>>> +Index: ui/events/keycodes/BUILD.gn
>>>>>> +diff --git a/ui/events/keycodes/BUILD.gn
>> b/ui/events/keycodes/BUILD.gn
>>>>>> +index 4f2d47c2497d321332c79d0dd4e9007b50c319c7..
>> 716c7ed17cc8049ea65b95a5062e7c6e0adc6e48 100644
>>>>>> +--- a/ui/events/keycodes/BUILD.gn
>>>>>> ++++ b/ui/events/keycodes/BUILD.gn
>>>>>> +@@ -17,6 +17,10 @@ source_set("xkb") {
>>>>>> +     "//base",
>>>>>> +     "//ui/events:dom_keycode_converter",
>>>>>> +   ]
>>>>>> ++
>>>>>> ++  if (use_xkbcommon) {
>>>>>> ++    defines = [ "USE_XKBCOMMON" ]
>>>>>> ++  }
>>>>>> + }
>>>>>> +
>>>>>> + if (use_x11 || ozone_platform_x11) {
>>>>>> +Index: ui/events/keycodes/events_keycodes.gyp
>>>>>> +diff --git a/ui/events/keycodes/events_keycodes.gyp
>> b/ui/events/keycodes/events_keycodes.gyp
>>>>>> +index b0796b4e2ead8bffe88fb01ed136814be505d967..
>> 248e961bad2ad3996ca99624b6c489c7835f6241 100644
>>>>>> +--- a/ui/events/keycodes/events_keycodes.gyp
>>>>>> ++++ b/ui/events/keycodes/events_keycodes.gyp
>>>>>> +@@ -21,6 +21,13 @@
>>>>>> +         'scoped_xkb.h',
>>>>>> +         'xkb_keysym.h',
>>>>>> +       ],
>>>>>> ++      'conditions': [
>>>>>> ++        ['use_xkbcommon==1', {
>>>>>> ++          'defines': [
>>>>>> ++            'USE_XKBCOMMON',
>>>>>> ++          ],
>>>>>> ++        }],
>>>>>> ++      ],
>>>>>> +     },
>>>>>> +   ],
>>>>>> +   'conditions': [
>>>>>>
>>>>>
>>>>>
>>>
>>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>



