Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 38C9765D00
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2017 12:30:18 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3Ae6ggYBTAhwbDkbMP/EZ9fLQtBtpsv+yvbD5Q0YIu?=
	=?us-ascii?q?jvd0So/mwa67ZBCFt8tkgFKBZ4jH8fUM07OQ6PG8HzJRqs3R+Fk5M7V0Hycfjs?=
	=?us-ascii?q?sXmwFySOWkMmbcaMDQUiohAc5ZX0Vk9XzoeWJcGcL5ekGA6ibqtW1aFRrwLxd6?=
	=?us-ascii?q?KfroEYDOkcu3y/qy+5rOaAlUmTaxe71/IRG5oAnLt8QbhYRuJ6gyxxDUvnZGZu?=
	=?us-ascii?q?NayH9yK1mOhRj8/MCw/JBi8yRUpf0s8tNLXLv5caolU7FWFSwqPG8p6sLlsxnD?=
	=?us-ascii?q?VhaP6WAHUmoKiBpIAhPK4w/8U5zsryb1rOt92C2dPc3rUbA5XCmp4ql3RBP0ji?=
	=?us-ascii?q?oMKiU0+3/LhMNukK1boQqhpx1hzI7SfIGVL+d1cqfEcd8HWWZNQsNdWipcCY2+?=
	=?us-ascii?q?coQPFfIMM/tGoYnzp1UArhWwCgejC+zt1jBGiWT73bE53uk7DQ3KwAItEtAIvX?=
	=?us-ascii?q?/JrNv1LqASUeWtwafM1zrMc/RW1iz66IfQbh0hu+uDXb1tccrX1EYgCRvKgE+K?=
	=?us-ascii?q?roz/ITyU1/kGvm+Z7+V6T+KgkWEnqxx3ojey2MghkYjJho0PxVDA9CV22pw5Ks?=
	=?us-ascii?q?G/SE5+eNOpFoZbuS+dN4tzWMwiQmdotT4mxb0Go567ey0KyJU6xx7acfCHdJKI?=
	=?us-ascii?q?4h3lWe2MIjl4nGpodbaiixqo7ESs1+/xWtOw3VtOtCZJj9nBu3AV2xDO6cWKSe?=
	=?us-ascii?q?Fx80Sg1DqV1Q3f9/tILV0pmafaLZMq36Q+mYAJsUvZGy/7gED2jKiLeUo64uWo?=
	=?us-ascii?q?8OHnYqn+pp+bKo90lhnyMqQwlcy7BuQ1KgYOUHKd+eW91b3j+1P2TK9Ljv05iK?=
	=?us-ascii?q?bZtJHaKt4BqqGlBA9V154v6xe5Dzi4zNQVhX0KIE9fdB6akoTkOUvCLfT8APul?=
	=?us-ascii?q?nlihkDdmy+jDPrL7A5XNKnbDkK3mfbZ480NcyhA8zcpF6JJbF7EBJu/8VVHqud?=
	=?us-ascii?q?zZAR82KQi0w+f9B9lnyoweXmePDreDMKzOqV+I+v4vI+6UaY8Vpjn9MeYl6OD0?=
	=?us-ascii?q?gX87nl8dYLOp0oYNZ3C5GPRrOEOZbmTxgtcPC2sKsBA+RvTwiFKeST5Te2qyX6?=
	=?us-ascii?q?Uk6zE8FIKpF5nDRoGqgLGa2ye7BYZWZ2BdClCQD3jocp6EV+0QZyKVJ89tiCcL?=
	=?us-ascii?q?VaK5QY87yR6urBP6y6ZgLufM/S0YrYzs1N5r6O3Wjh496yF7ANmD3G6QVm17g3?=
	=?us-ascii?q?0HRyEo06B7ukF9zlaD0bNkg/xDD9BT4OtJXRk8NZHCyux1EM79VR/ccdiXVVmq?=
	=?us-ascii?q?WNKmASs+ToF5/9hbZF5wHdinhB3P0yemRrMYibGPLJg16b7HmX/pKsBwznzL2K?=
	=?us-ascii?q?Usgx8hWMQcG3ehg/td/gPUDYn+ul+QmLuseakr5K/X+XXLmWiHpkhXTQh8XI3E?=
	=?us-ascii?q?UnkbZ0KQptP8sBCRB4SyAKgqZ1MSgfWJLbFHP5iw1Q1L?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CFFAD6JJNY/5tjdVtdGgEBAQECAQEBA?=
	=?us-ascii?q?QgBAQEBFgEBAQMBAQEJAQEBgyhhAydfg1ebcx+TJoQcKoJCgzYCgkpCFQEBAQE?=
	=?us-ascii?q?BAQEBAQEBYSiCMxsBghoBAQEBAyMPAUYQCxIDAgECAiYCAkkGCBMGAgEBiXEBC?=
	=?us-ascii?q?a0TgiWLLwEBAQEBAQEDAQEBAQEBAQEggQuFQIIFCIJihxk6gl8FiRaHZophhmi?=
	=?us-ascii?q?LH4JOh26GRpMHNSKBS4VKgUl0AQGJAQEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2CFFAD6JJNY/5tjdVtdGgEBAQECAQEBAQgBAQEBFgEBAQM?=
	=?us-ascii?q?BAQEJAQEBgyhhAydfg1ebcx+TJoQcKoJCgzYCgkpCFQEBAQEBAQEBAQEBYSiCM?=
	=?us-ascii?q?xsBghoBAQEBAyMPAUYQCxIDAgECAiYCAkkGCBMGAgEBiXEBCa0TgiWLLwEBAQE?=
	=?us-ascii?q?BAQEDAQEBAQEBAQEggQuFQIIFCIJihxk6gl8FiRaHZophhmiLH4JOh26GRpMHN?=
	=?us-ascii?q?SKBS4VKgUl0AQGJAQEBAQ?=
X-IronPort-AV: E=Sophos;i="5.33,324,1477954800"; d="scan'208";a="156348998"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 02 Feb 2017 13:30:13 +0100
Received: from [188.86.71.116] (helo=[192.168.1.4])
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cZGWj-0004sk-3k; Thu, 02 Feb 2017 13:30:13 +0100
To: openembedded-devel@lists.openembedded.org
References: <1486037824-303-1-git-send-email-jaragunde@igalia.com>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <417f4579-bbbf-2996-ed75-9a9b3fc71a35@igalia.com>
Date: Thu, 2 Feb 2017 13:30:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1486037824-303-1-git-send-email-jaragunde@igalia.com>
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
X-List-Received-Date: Thu, 02 Feb 2017 12:30:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Thank you all for your reviews. This should be the last patch, it
addresses Herve's problem when building on a Raspberry Pi.

Unfortunately, I haven't been able to reproduce his problem myself, but
this patch is actually a backport of an upstream patch, so it makes no
harm in my opinion.

Another question, are you using krogoth in you rpi build? I found
problems with the declared architecture in releases newer than jethro,
it is called "armv7ve" and chromium doesn't build because it expects
"armv7a". We could use a patch if you have worked around this problem :)

Thanks again,
-- 
Jacobo Aragunde
Software Engineer at Igalia


On 02/02/17 13:17, Jacobo Aragunde Pérez wrote:
> Certain build configurations enable a code path that includes
> keyboard_code_conversion_xkb.cc, but it eventually fails in non-X11
> environments because of a missing patch that is present upstream.
> 
> This commit adds the missing patch from
> https://codereview.chromium.org/2239833003
> 
> There are two versions of the patch in the code review URL above.
> The first version fixes the problem both under the gyp and GN build
> systems. That patch was rejected because gyp is considered deprecated
> upstream. The second version fixes the problem only on GN and it was
> merged upstream. We are picking the first version because our recipes
> still use gyp to build.
> 
> Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
> ---
>  .../chromium/chromium-wayland_53.0.2785.143.bb     |  1 +
>  .../fix-non-x11-build-when-use_xkbcommon-1.patch   | 51 ++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
> 
> diff --git a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
> index a75918b..ef913a7 100644
> --- a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
> +++ b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
> @@ -13,6 +13,7 @@ SRC_URI += "\
>          file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
>          file://chromium-wayland/remove-Werror.patch \
>          file://chromium-wayland/guard-x11_desktop_handler-inclusion.patch \
> +        file://chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch \
>          ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
>          ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
>  "
> diff --git a/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch b/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
> new file mode 100644
> index 0000000..976ece9
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
> @@ -0,0 +1,51 @@
> +From: jbriance <jbriance@cisco.com>
> +Subject: keycodes: Fix non-X11 build when use_xkbcommon=1
> +
> +Since M51, ui/events/keycodes/xkb_keysym.h follows X11 path, even if
> +use_xkbcommon=1 is set because USE_XKBCOMMON is not defined, leading
> +to the following compilation error in this case:
> +
> +  In file included from ../../ui/events/keycodes/keyboard_code_conversion_xkb.h:12:0,
> +                   from ../../ui/events/keycodes/keyboard_code_conversion_xkb.cc:5:
> +  ../../ui/events/keycodes/xkb_keysym.h:19:19: fatal error: X11/X.h: No such file or directory
> +
> +BUG=none
> +
> +Review-Url: https://codereview.chromium.org/2239833003
> +--
> +
> +Index: ui/events/keycodes/BUILD.gn
> +diff --git a/ui/events/keycodes/BUILD.gn b/ui/events/keycodes/BUILD.gn
> +index 4f2d47c2497d321332c79d0dd4e9007b50c319c7..716c7ed17cc8049ea65b95a5062e7c6e0adc6e48 100644
> +--- a/ui/events/keycodes/BUILD.gn
> ++++ b/ui/events/keycodes/BUILD.gn
> +@@ -17,6 +17,10 @@ source_set("xkb") {
> +     "//base",
> +     "//ui/events:dom_keycode_converter",
> +   ]
> ++
> ++  if (use_xkbcommon) {
> ++    defines = [ "USE_XKBCOMMON" ]
> ++  }
> + }
> + 
> + if (use_x11 || ozone_platform_x11) {
> +Index: ui/events/keycodes/events_keycodes.gyp
> +diff --git a/ui/events/keycodes/events_keycodes.gyp b/ui/events/keycodes/events_keycodes.gyp
> +index b0796b4e2ead8bffe88fb01ed136814be505d967..248e961bad2ad3996ca99624b6c489c7835f6241 100644
> +--- a/ui/events/keycodes/events_keycodes.gyp
> ++++ b/ui/events/keycodes/events_keycodes.gyp
> +@@ -21,6 +21,13 @@
> +         'scoped_xkb.h',
> +         'xkb_keysym.h',
> +       ],
> ++      'conditions': [
> ++        ['use_xkbcommon==1', {
> ++          'defines': [
> ++            'USE_XKBCOMMON',
> ++          ],
> ++        }],
> ++      ],
> +     },
> +   ],
> +   'conditions': [
> 



