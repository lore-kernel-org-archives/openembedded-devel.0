Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id C88AA602D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2017 13:28:31 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3A42iDXRa28PxTpZy9B5MXlK//LSx+4OfEezUN459i?=
	=?us-ascii?q?sYplN5qZpsyyZx7h7PlgxGXEQZ/co6odzbGH7+a+CCddud6oizMrSNR0TRgLiM?=
	=?us-ascii?q?EbzUQLIfWuLgnFFsPsdDEwB89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ/iOgVr?=
	=?us-ascii?q?O+/7BpDdj9it1+C15pbffxhEiCCzbL52Ixi6twTcu80ZjYZiNqo61wfErGZPd+?=
	=?us-ascii?q?lK321jOEidnwz75se+/Z5j9zpftvc8/MNeUqv0Yro1Q6VAADspL2466svrtQLe?=
	=?us-ascii?q?TQSU/XsTTn8WkhtTDAfb6hzxQ4r8vTH7tup53ymaINH2QLUpUjms86tnVBnlgz?=
	=?us-ascii?q?ocOjUn7G/YlNB/jKNDoBKguRN/xZLUYJqIP/Z6Z6/RYM8WSXZEUstXSidPAJ6z?=
	=?us-ascii?q?b5EXAuQcI+hYoYnzqVgAoxSwCgajBv/gxDBTi3/q3qA3yfgtHR3I0QEiGd8FrX?=
	=?us-ascii?q?TarM/yNKcXSe27yLPHwinEb/xN3jfy8JTFcgo7rvGDQLJwd9fexlc3GA3flFKQ?=
	=?us-ascii?q?s5LqPjKI3ekKsWiU9fBgWvigi246rQF+vyagy9wtionGnI0VzlHE+j9jzIkpIt?=
	=?us-ascii?q?24TVd2bNi5G5VesCGaMpF5QsIkQ2xwpCk6yqcGuZm+fCgL1ZQnwgTTa/udc4iH?=
	=?us-ascii?q?5B/oSeWfIS9giX9hZb6znQu+/VWix+HmUsS51ExGojdFn9TMrnwByh/e58udRv?=
	=?us-ascii?q?Z+/0qtwzSC2x3J5u1ZPEw5lKzWIIM7zLEqjJocq0HDEzfzmEXxkaCZaF0p+vOt?=
	=?us-ascii?q?6+T7erXmoYKcN5NshgH+LKsunsu/DPw2MgcUWWia+OW81Lv98kHjQbVKgec5kq?=
	=?us-ascii?q?3YsJ/AP8gUuqm5AwpN3oYi7RawESum3cwckHUaNl5JZQ+LgorzN1zKJP30F+qz?=
	=?us-ascii?q?jlSsnTtzwvDJJLzhApHDLnjZl7fheK5w60xGxwop199f6I9UCrccL/3tQULxtd?=
	=?us-ascii?q?PYAQU9Mwy12enrEsly1oQbWW6XGK+WLLvSsUOU5uIoO+SMY5MVtyzjK/gk4P7j?=
	=?us-ascii?q?lng5mUQGfaipxpsXdG63HvF9I0mDfXXshdIBHX0RsQokVObqkkGNUSZPZ3auWK?=
	=?us-ascii?q?Ix/jY7CJq4AofFWI+thaeO0zmmEZJLeG9JF0mAHmr2eIWaRfgMbDmfIstgkjwf?=
	=?us-ascii?q?SbihUJUt1Ra2tADkzbpoMO/U9TYGup3+ydd6+fDcmQs19TxuAMSXy3uNQH1snm?=
	=?us-ascii?q?MUWz8227hyoUxjxVeZz6h3neZUFd5U5/NUSAc1KITTz+18C93pXALOYMqJSFi8?=
	=?us-ascii?q?TtWoGzFiBu42lv8DeVhwU/elkwrP1iusS+sVmqaVCdo29b/G03HwIe57xmvIkq?=
	=?us-ascii?q?c72R1uRdNCM2CjjKNz+wXfQoLEjUidv6KrbrgHminV+WGOyGCDsE1VXEh3S6qW?=
	=?us-ascii?q?c2oYYx70pN/+7ET1ZqWnBqkhPgZ28U+YJ7kCPt/gl1xJWfHvNfzfbGu1mm72Dh?=
	=?us-ascii?q?GNkODfJLH2cnkQiX2OQHMPlBoeqDPfbVAz?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CRCQALM5NY/5tjdVtdGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBFAEBAQEBAQEBAQEBBwEBAQEBgyhhAydfg1ecEpc7Bx8LgkKDNgK?=
	=?us-ascii?q?CS0IVAQEBAQEBAQEBAQFhKIIzGwGCGgEBAQEDASIPAUYMBAsRAQMBAQECAiMDA?=
	=?us-ascii?q?gIoHgMGCAYBDAYCAQGJcQEJrSCCJYsvAQEBAQEBAQEBAQEBAQEBAQEBAQEBHYE?=
	=?us-ascii?q?LhUCCBYJqh1OCXwWJFodmimGGaIYIhReCToduhkaTBzUigUuFSoFJdAEBiQEBA?=
	=?us-ascii?q?QE?=
X-IPAS-Result: =?us-ascii?q?A2CRCQALM5NY/5tjdVtdGQEBAQEBAQEBAQEBBwEBAQEBFAE?=
	=?us-ascii?q?BAQEBAQEBAQEBBwEBAQEBgyhhAydfg1ecEpc7Bx8LgkKDNgKCS0IVAQEBAQEBA?=
	=?us-ascii?q?QEBAQFhKIIzGwGCGgEBAQEDASIPAUYMBAsRAQMBAQECAiMDAgIoHgMGCAYBDAY?=
	=?us-ascii?q?CAQGJcQEJrSCCJYsvAQEBAQEBAQEBAQEBAQEBAQEBAQEBHYELhUCCBYJqh1OCX?=
	=?us-ascii?q?wWJFodmimGGaIYIhReCToduhkaTBzUigUuFSoFJdAEBiQEBAQE?=
X-IronPort-AV: E=Sophos;i="5.33,324,1477954800"; d="scan'208";a="156370835"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 02 Feb 2017 14:28:30 +0100
Received: from [188.86.71.116] (helo=[192.168.1.4])
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cZHR8-0005g0-Kv; Thu, 02 Feb 2017 14:28:30 +0100
To: Herve Jourdain <herve.jourdain@neuf.fr>,
	openembedded-devel@lists.openembedded.org
References: <1486037824-303-1-git-send-email-jaragunde@igalia.com>
	<417f4579-bbbf-2996-ed75-9a9b3fc71a35@igalia.com>
	<021701d27d52$70efce00$52cf6a00$@neuf.fr>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <8a8cfdfa-a4bd-186d-cf2f-3c4b85e97444@igalia.com>
Date: Thu, 2 Feb 2017 14:28:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <021701d27d52$70efce00$52cf6a00$@neuf.fr>
Cc: otavio@ossystems.com.br
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
X-List-Received-Date: Thu, 02 Feb 2017 13:28:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 02/02/17 13:46, Herve Jourdain wrote:
> Hi Jacobo,
> 
> I'm using "master", and I do have patches for enabling armv7ve. But since
> they're needed only for raspberrypi, I planned to submit them only for
> meta-raspberrypi.
> If you think it could be useful in meta-browser, though, I can submit them there.
> 

Oh, I think sending them to meta-rpi would be good enough, thank you!
I'll keep an eye on it.

Best regards,
-- 
Jacobo Aragunde
Software Engineer at Igalia


> -----Original Message-----
> From: Jacobo Aragunde Pérez [mailto:jaragunde@igalia.com] 
> Sent: jeudi 2 février 2017 13:30
> To: openembedded-devel@lists.openembedded.org
> Cc: otavio@ossystems.com.br; Herve Jourdain <herve.jourdain@neuf.fr>
> Subject: Re: [meta-browser][PATCH] chromium-wayland: fix compilation problem on non-X11 builds
> 
> Thank you all for your reviews. This should be the last patch, it addresses Herve's problem when building on a Raspberry Pi.
> 
> Unfortunately, I haven't been able to reproduce his problem myself, but this patch is actually a backport of an upstream patch, so it makes no harm in my opinion.
> 
> Another question, are you using krogoth in you rpi build? I found problems with the declared architecture in releases newer than jethro, it is called "armv7ve" and chromium doesn't build because it expects "armv7a". We could use a patch if you have worked around this problem :)
> 
> Thanks again,
> --
> Jacobo Aragunde
> Software Engineer at Igalia
> 
> 
> On 02/02/17 13:17, Jacobo Aragunde Pérez wrote:
>> Certain build configurations enable a code path that includes
>> keyboard_code_conversion_xkb.cc, but it eventually fails in non-X11
>> environments because of a missing patch that is present upstream.
>>
>> This commit adds the missing patch from
>> https://codereview.chromium.org/2239833003
>>
>> There are two versions of the patch in the code review URL above.
>> The first version fixes the problem both under the gyp and GN build
>> systems. That patch was rejected because gyp is considered deprecated
>> upstream. The second version fixes the problem only on GN and it was
>> merged upstream. We are picking the first version because our recipes
>> still use gyp to build.
>>
>> Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
>> ---
>>  .../chromium/chromium-wayland_53.0.2785.143.bb     |  1 +
>>  .../fix-non-x11-build-when-use_xkbcommon-1.patch   | 51 ++++++++++++++++++++++
>>  2 files changed, 52 insertions(+)
>>  create mode 100644 recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
>>
>> diff --git a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
>> index a75918b..ef913a7 100644
>> --- a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
>> +++ b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
>> @@ -13,6 +13,7 @@ SRC_URI += "\
>>          file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
>>          file://chromium-wayland/remove-Werror.patch \
>>          file://chromium-wayland/guard-x11_desktop_handler-inclusion.patch \
>> +        file://chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch \
>>          ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
>>          ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
>>  "
>> diff --git a/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch b/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
>> new file mode 100644
>> index 0000000..976ece9
>> --- /dev/null
>> +++ b/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
>> @@ -0,0 +1,51 @@
>> +From: jbriance <jbriance@cisco.com>
>> +Subject: keycodes: Fix non-X11 build when use_xkbcommon=1
>> +
>> +Since M51, ui/events/keycodes/xkb_keysym.h follows X11 path, even if
>> +use_xkbcommon=1 is set because USE_XKBCOMMON is not defined, leading
>> +to the following compilation error in this case:
>> +
>> +  In file included from ../../ui/events/keycodes/keyboard_code_conversion_xkb.h:12:0,
>> +                   from ../../ui/events/keycodes/keyboard_code_conversion_xkb.cc:5:
>> +  ../../ui/events/keycodes/xkb_keysym.h:19:19: fatal error: X11/X.h: No such file or directory
>> +
>> +BUG=none
>> +
>> +Review-Url: https://codereview.chromium.org/2239833003
>> +--
>> +
>> +Index: ui/events/keycodes/BUILD.gn
>> +diff --git a/ui/events/keycodes/BUILD.gn b/ui/events/keycodes/BUILD.gn
>> +index 4f2d47c2497d321332c79d0dd4e9007b50c319c7..716c7ed17cc8049ea65b95a5062e7c6e0adc6e48 100644
>> +--- a/ui/events/keycodes/BUILD.gn
>> ++++ b/ui/events/keycodes/BUILD.gn
>> +@@ -17,6 +17,10 @@ source_set("xkb") {
>> +     "//base",
>> +     "//ui/events:dom_keycode_converter",
>> +   ]
>> ++
>> ++  if (use_xkbcommon) {
>> ++    defines = [ "USE_XKBCOMMON" ]
>> ++  }
>> + }
>> + 
>> + if (use_x11 || ozone_platform_x11) {
>> +Index: ui/events/keycodes/events_keycodes.gyp
>> +diff --git a/ui/events/keycodes/events_keycodes.gyp b/ui/events/keycodes/events_keycodes.gyp
>> +index b0796b4e2ead8bffe88fb01ed136814be505d967..248e961bad2ad3996ca99624b6c489c7835f6241 100644
>> +--- a/ui/events/keycodes/events_keycodes.gyp
>> ++++ b/ui/events/keycodes/events_keycodes.gyp
>> +@@ -21,6 +21,13 @@
>> +         'scoped_xkb.h',
>> +         'xkb_keysym.h',
>> +       ],
>> ++      'conditions': [
>> ++        ['use_xkbcommon==1', {
>> ++          'defines': [
>> ++            'USE_XKBCOMMON',
>> ++          ],
>> ++        }],
>> ++      ],
>> +     },
>> +   ],
>> +   'conditions': [
>>
> 
> 


