Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C26C87704E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 15:03:45 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r12so13650927wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 08:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=A6U8owS1AHjfG8fz1lyhmgmUZReiv0MxAzqTr5n2ycM=;
	b=o3ujpMEdBRDScxjTYctWpfLMZPvS54xuLBMNEGMGgbVSteCL4U5PFX1/EoMiXpXIgz
	fnDKtE2wLZe4T+y4FjRt26QTm/XMdwT8LAjmC/bkFEYCYzxV6QwtoFeVJ4prog6gjsLQ
	OEx13TFCUa6cm5uJ8bWXFHnf2uzTVWE3qnZqTSL23OK0aRqKf/i+I6Q1uPmlVUxUBE51
	8KZUOaT2TVLVhZa8bvmxsbxIbvpW4gZzUY/2uilX4lx7n0YN+SRaQEIF2HHysv1Us5mb
	5UN2GoWCNIpo7w6Uwp+0Hb9s267/PCSKRPivsVqgVrgKauZJtclG4h/VzTuRQLrAIQs8
	QK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=A6U8owS1AHjfG8fz1lyhmgmUZReiv0MxAzqTr5n2ycM=;
	b=es7EWaiWaV77kNAFvUJEtjOplJpHsKMjDvqMqRuN3HhLi6mxwGVjOKOTkDKIUl4iTN
	k++7V4UTNIXFltArKnA4jsl1sb9zrV7cov4mgcYCt795n8DaEU1vrcAQgR3UK3dRbbmo
	u5yooE6ZHJxRrX7bLob6OpXL1sbcJhJdCOoCthBxjZNZNge3iQilTZk0AfPmVZVK+kAG
	tW/jE7fGIMssl3OGqyHrtDD3A3pXrRxGD/uWyBEXXAFLpopwlSgy78i+opF70/sw/E2d
	j9Pi8f/AYojj4YB7hQMy7e/Ryqnt6e1EGSoGndJ5uNw2vas5gLZcoW+R7qylpZucEuIj
	FJwQ==
X-Gm-Message-State: AOPr4FXbS1y/rDWXcSC1EDBBUB79KgNKmqEoltsQ959RQ3LYhGUaVxIkSdatIOAcGjVFTg==
X-Received: by 10.195.18.99 with SMTP id gl3mr7809166wjd.162.1463583825917;
	Wed, 18 May 2016 08:03:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id k1sm9141741wjx.22.2016.05.18.08.03.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 May 2016 08:03:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 May 2016 17:04:15 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160518150415.GD2579@jama>
References: <1462710038-20023-1-git-send-email-dv@pseudoterminal.org>
	<1462710038-20023-3-git-send-email-dv@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <1462710038-20023-3-git-send-email-dv@pseudoterminal.org>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [meta-browser][PATCH v2 3/3] chromium: Upgrade to version 48.0.2548.0
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
X-List-Received-Date: Wed, 18 May 2016 15:03:51 -0000
X-Groupsio-MsgNum: 61538
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TybLhxa8M7aNoW+V"
Content-Disposition: inline

--TybLhxa8M7aNoW+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 08, 2016 at 02:20:38PM +0200, Carlos Rafael Giani wrote:
> Not upgrading to M49 or M50 in this commit since this is currently the
> latest version that is supported by ozone-wayland

Thanks for fixing that issue with gold, now there is new issue since
glibc was upgraded in oe-core to 2.24 which deprecated readdir_r

http://errors.yoctoproject.org/Errors/Details/64087/

Anyone willing to patch it to use readdir?

Thanks

> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  ...Add-Linux-to-impl-side-painting-whitelist.patch | 39 -----------
>  .../0003-disable-uninitialized-warning.patch       | 19 ------
>  .../0005-Remove-X-libraries-from-GYP-files.patch   | 77 ----------------=
------
>  .../chromium/chromium-40/0010-systemd-218.patch    | 39 -----------
>  .../fix-build-error-with-GCC-in-Debug-mode.patch   | 32 ---------
>  ...accelerated-Canvas-support-from-blacklist.patch | 20 ++++--
>  ...0001-bignum.cc-disable-warning-from-gcc-5.patch |  4 +-
>  .../0002-Disable-API-keys-info-bar.patch}          |  2 +-
>  ...-image_util.cc-disable-warning-from-gcc-5.patch |  0
>  ...-Remove-hard-coded-values-for-CC-and-CXX.patch} |  8 +--
>  ...y-i18n_process_css_test.html-file-to-avoi.patch | 26 ++++++++
>  ...erride-root-filesystem-access-restriction.patch | 30 +++++++++
>  .../0006-Remove-GBM-support-from-wayland.gyp.patch | 66 ++++++++++++++++=
+++
>  ...for-glib-related-build-error-with-ozone-w.patch | 31 +++++++++
>  .../0008-Fix-GCC-uninitialized-warning.patch       | 26 ++++++++
>  ...9-Fix-build-errors-with-GCC-in-Debug-mode.patch | 46 +++++++++++++
>  ...be-used-uninitialized-in-this-function-wa.patch | 25 +++++++
>  .../add_missing_stat_h_include.patch               |  4 +-
>  recipes-browser/chromium/chromium_40.0.2214.91.bb  | 45 -------------
>  recipes-browser/chromium/chromium_48.0.2548.0.bb   | 43 ++++++++++++
>  20 files changed, 315 insertions(+), 267 deletions(-)
>  delete mode 100644 recipes-browser/chromium/chromium/chromium-40/0002-Ad=
d-Linux-to-impl-side-painting-whitelist.patch
>  delete mode 100644 recipes-browser/chromium/chromium/chromium-40/0003-di=
sable-uninitialized-warning.patch
>  delete mode 100644 recipes-browser/chromium/chromium/chromium-40/0005-Re=
move-X-libraries-from-GYP-files.patch
>  delete mode 100644 recipes-browser/chromium/chromium/chromium-40/0010-sy=
stemd-218.patch
>  delete mode 100644 recipes-browser/chromium/chromium/chromium-40/fix-bui=
ld-error-with-GCC-in-Debug-mode.patch
>  rename recipes-browser/chromium/chromium/{chromium-40 =3D> chromium-48}/=
0001-Remove-accelerated-Canvas-support-from-blacklist.patch (71%)
>  rename recipes-browser/chromium/chromium/{chromium-40 =3D> chromium-48}/=
0001-bignum.cc-disable-warning-from-gcc-5.patch (98%)
>  rename recipes-browser/chromium/chromium/{chromium-40/0003-Disable-API-k=
eys-info-bar.patch =3D> chromium-48/0002-Disable-API-keys-info-bar.patch} (=
95%)
>  rename recipes-browser/chromium/chromium/{chromium-40 =3D> chromium-48}/=
0002-image_util.cc-disable-warning-from-gcc-5.patch (100%)
>  rename recipes-browser/chromium/chromium/{chromium-40/0004-Remove-hard-c=
oded-values-for-CC-and-CXX.patch =3D> chromium-48/0003-Remove-hard-coded-va=
lues-for-CC-and-CXX.patch} (86%)
>  create mode 100644 recipes-browser/chromium/chromium/chromium-48/0004-Cr=
eate-empty-i18n_process_css_test.html-file-to-avoi.patch
>  create mode 100644 recipes-browser/chromium/chromium/chromium-48/0005-Ov=
erride-root-filesystem-access-restriction.patch
>  create mode 100644 recipes-browser/chromium/chromium/chromium-48/0006-Re=
move-GBM-support-from-wayland.gyp.patch
>  create mode 100644 recipes-browser/chromium/chromium/chromium-48/0007-Wo=
rkaround-for-glib-related-build-error-with-ozone-w.patch
>  create mode 100644 recipes-browser/chromium/chromium/chromium-48/0008-Fi=
x-GCC-uninitialized-warning.patch
>  create mode 100644 recipes-browser/chromium/chromium/chromium-48/0009-Fi=
x-build-errors-with-GCC-in-Debug-mode.patch
>  create mode 100644 recipes-browser/chromium/chromium/chromium-48/0010-Fi=
x-rv-may-be-used-uninitialized-in-this-function-wa.patch
>  rename recipes-browser/chromium/chromium/{chromium-40 =3D> chromium-48}/=
add_missing_stat_h_include.patch (90%)
>  delete mode 100644 recipes-browser/chromium/chromium_40.0.2214.91.bb
>  create mode 100644 recipes-browser/chromium/chromium_48.0.2548.0.bb
>=20
> diff --git a/recipes-browser/chromium/chromium/chromium-40/0002-Add-Linux=
-to-impl-side-painting-whitelist.patch b/recipes-browser/chromium/chromium/=
chromium-40/0002-Add-Linux-to-impl-side-painting-whitelist.patch
> deleted file mode 100644
> index b5916ca..0000000
> --- a/recipes-browser/chromium/chromium/chromium-40/0002-Add-Linux-to-imp=
l-side-painting-whitelist.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 61cbd67e88f5e99185d7df1a05f842c58e691495 Mon Sep 17 00:00:00 2001
> -From: Carlos Rafael Giani <dv@pseudoterminal.org>
> -Date: Sun, 21 Dec 2014 01:01:04 +0100
> -Subject: [PATCH] Add Linux to impl side painting whitelist
> -
> -Upstream-Status: Inappropriate [enable feature]
> -
> -Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ----
> - gpu/config/software_rendering_list_json.cc | 7 ++++++-
> - 1 file changed, 6 insertions(+), 1 deletion(-)
> -
> -diff --git a/gpu/config/software_rendering_list_json.cc b/gpu/config/sof=
tware_rendering_list_json.cc
> -index ccf1460..8630d75 100644
> ---- a/gpu/config/software_rendering_list_json.cc
> -+++ b/gpu/config/software_rendering_list_json.cc
> -@@ -1088,13 +1088,18 @@ LONG_STRING_CONST(
> -     },
> -     {
> -       "id": 99,
> --      "description": "GPU rasterization is blacklisted on non-Android",
> -+      "description": "GPU rasterization is blacklisted on non-Android a=
nd non-Linux (Yocto patch)",
> -       "cr_bugs": [362779],
> -       "exceptions": [
> -         {
> -           "os": {
> -             "type": "android"
> -           }
> -+        },
> -+        {
> -+          "os": {
> -+            "type": "linux"
> -+          }
> -         }
> -       ],
> -       "features": [
> ---=20
> -1.9.1
> -
> diff --git a/recipes-browser/chromium/chromium/chromium-40/0003-disable-u=
ninitialized-warning.patch b/recipes-browser/chromium/chromium/chromium-40/=
0003-disable-uninitialized-warning.patch
> deleted file mode 100644
> index 232dbf4..0000000
> --- a/recipes-browser/chromium/chromium/chromium-40/0003-disable-uninitia=
lized-warning.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -../../third_party/WebKit/Source/core/inspector/InspectorTimelineAgent.cp=
p: In static member function 'static void WTF::HashTableBucketInitializer<f=
alse>::initialize(Value&) [with Traits =3D WTF::HashMapValueTraits<WTF::Has=
hTraits<int>, WTF::HashTraits<blink::TimelineThreadState> >; Value =3D WTF:=
:KeyValuePair<int, blink::TimelineThreadState>]':
> -../../third_party/WebKit/Source/core/inspector/InspectorTimelineAgent.cp=
p:234:8: error: '<anonymous>.blink::TimelineThreadState::inKnownLayerTask' =
is used uninitialized in this function [-Werror=3Duninitialized]
> - struct TimelineThreadState {
> -        ^
> -
> ---- a/third_party/WebKit/Source/core/inspector/InspectorTimelineAgent.cp=
p	2016-03-10 08:14:18.771413000 -1000
> -+++ b/third_party/WebKit/Source/core/inspector/InspectorTimelineAgent.cp=
p	2016-03-10 08:15:58.179413000 -1000
> -@@ -231,7 +231,11 @@
> -     Vector<Entry> m_stack;
> - };
> -=20
> -+#pragma GCC diagnostic push
> -+#pragma GCC diagnostic warning "-Wuninitialized"
> - struct TimelineThreadState {
> -+#pragma GCC diagnostic pop
> -+
> -     ALLOW_ONLY_INLINE_ALLOCATION();
> - public:
> -     TimelineThreadState() { }
> diff --git a/recipes-browser/chromium/chromium/chromium-40/0005-Remove-X-=
libraries-from-GYP-files.patch b/recipes-browser/chromium/chromium/chromium=
-40/0005-Remove-X-libraries-from-GYP-files.patch
> deleted file mode 100644
> index 632590a..0000000
> --- a/recipes-browser/chromium/chromium/chromium-40/0005-Remove-X-librari=
es-from-GYP-files.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From 23e33854a1c5cddc56acd9abdbda14757b809c7d Mon Sep 17 00:00:00 2001
> -From: Carlos Rafael Giani <dv@pseudoterminal.org>
> -Date: Sun, 12 Oct 2014 18:08:37 +0200
> -Subject: [PATCH] Remove X libraries from GYP files
> -
> -Some X libraries are linked even when ozone-wayland is used, causing
> -linker errors if no X libraries are around
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ----
> - third_party/libjingle/source/talk/libjingle.gyp                 | 2 --
> - third_party/libjingle/source/talk/libjingle_examples.gyp        | 4 ----
> - third_party/webrtc/base/base.gyp                                | 4 ----
> - third_party/webrtc/modules/desktop_capture/desktop_capture.gypi | 2 +-
> - 4 files changed, 1 insertion(+), 11 deletions(-)
> -
> -diff --git a/third_party/libjingle/source/talk/libjingle.gyp b/third_par=
ty/libjingle/source/talk/libjingle.gyp
> -index 90d1f41..22655dc 100755
> ---- a/third_party/libjingle/source/talk/libjingle.gyp
> -+++ b/third_party/libjingle/source/talk/libjingle.gyp
> -@@ -455,8 +455,6 @@
> -           ],
> -           'libraries': [
> -             '-lrt',
> --            '-lXext',
> --            '-lX11',
> -           ],
> -         }],
> -         ['OS=3D=3D"win"', {
> -diff --git a/third_party/libjingle/source/talk/libjingle_examples.gyp b/=
third_party/libjingle/source/talk/libjingle_examples.gyp
> -index f7ce53b..204bc1e 100755
> ---- a/third_party/libjingle/source/talk/libjingle_examples.gyp
> -+++ b/third_party/libjingle/source/talk/libjingle_examples.gyp
> -@@ -207,10 +207,6 @@
> -                 'libraries': [
> -                   '<!@(pkg-config --libs-only-l glib-2.0 gobject-2.0'
> -                       ' gthread-2.0 gtk+-2.0)',
> --                  '-lX11',
> --                  '-lXcomposite',
> --                  '-lXext',
> --                  '-lXrender',
> -                 ],
> -               },
> -             }],  # OS=3D=3D"linux"
> -diff --git a/third_party/webrtc/base/base.gyp b/third_party/webrtc/base/=
base.gyp
> -index 2fd64ba..ccab4e9 100644
> ---- a/third_party/webrtc/base/base.gyp
> -+++ b/third_party/webrtc/base/base.gyp
> -@@ -593,10 +593,6 @@
> -             'libraries': [
> -               '-ldl',
> -               '-lrt',
> --              '-lXext',
> --              '-lX11',
> --              '-lXcomposite',
> --              '-lXrender',
> -             ],
> -           },
> -         }, {
> -diff --git a/third_party/webrtc/modules/desktop_capture/desktop_capture.=
gypi b/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi
> -index 1b702f2..93ede57 100644
> ---- a/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi
> -+++ b/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi
> -@@ -97,7 +97,7 @@
> -             'desktop_capture_differ_sse2',
> -           ],
> -         }],
> --        ['use_x11 =3D=3D 1', {
> -+        ['use_x11 =3D=3D 1 and <(ozone_platform_wayland) !=3D 1', {
> -           'link_settings': {
> -             'libraries': [
> -               '-lX11',
> ---=20
> -1.9.1
> -
> diff --git a/recipes-browser/chromium/chromium/chromium-40/0010-systemd-2=
18.patch b/recipes-browser/chromium/chromium/chromium-40/0010-systemd-218.p=
atch
> deleted file mode 100644
> index 3aec8d0..0000000
> --- a/recipes-browser/chromium/chromium/chromium-40/0010-systemd-218.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -Remove use of udev_set_log_priority API its gone in systemd >=3D 218
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: chromium-40.0.2214.91/ui/events/ozone/device/udev/device_manager_=
udev.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- chromium-40.0.2214.91.orig/ui/events/ozone/device/udev/device_manage=
r_udev.cc
> -+++ chromium-40.0.2214.91/ui/events/ozone/device/udev/device_manager_ude=
v.cc
> -@@ -33,29 +33,9 @@ enum {
> -   SYS_LOG_DEBUG =3D 7,
> - };
> -=20
> --// Log handler for messages generated from libudev.
> --void UdevLog(struct udev* udev,
> --             int priority,
> --             const char* file,
> --             int line,
> --             const char* fn,
> --             const char* format,
> --             va_list args) {
> --  if (priority <=3D SYS_LOG_ERR)
> --    LOG(ERROR) << "libudev: " << fn << ": " << base::StringPrintV(forma=
t, args);
> --  else if (priority <=3D SYS_LOG_INFO)
> --    VLOG(1) << "libudev: " << fn << ": " << base::StringPrintV(format, =
args);
> --  else  // SYS_LOG_DEBUG
> --    VLOG(2) << "libudev: " << fn << ": " << base::StringPrintV(format, =
args);
> --}
> --
> - // Create libudev context.
> - device::ScopedUdevPtr UdevCreate() {
> -   struct udev* udev =3D udev_new();
> --  if (udev) {
> --    udev_set_log_fn(udev, UdevLog);
> --    udev_set_log_priority(udev, SYS_LOG_DEBUG);
> --  }
> -   return device::ScopedUdevPtr(udev);
> - }
> -=20
> diff --git a/recipes-browser/chromium/chromium/chromium-40/fix-build-erro=
r-with-GCC-in-Debug-mode.patch b/recipes-browser/chromium/chromium/chromium=
-40/fix-build-error-with-GCC-in-Debug-mode.patch
> deleted file mode 100644
> index c05598a..0000000
> --- a/recipes-browser/chromium/chromium/chromium-40/fix-build-error-with-=
GCC-in-Debug-mode.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From bfe80ed5227fccf8ab13df714702fc77e5e3d657 Mon Sep 17 00:00:00 2001
> -From: Carlos Alberto Lopez Perez <clopez@igalia.com>
> -Date: Thu, 27 Aug 2015 09:54:06 +0200
> -Subject: [PATCH] Fix build error with GCC in Debug mode:
> -
> -  http://code.google.com/p/chromium/issues/detail?id=3D525428
> ----
> - components/invalidation/invalidator_storage.cc | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> -diff --git a/components/invalidation/invalidator_storage.cc b/components=
/invalidation/invalidator_storage.cc
> -index 13ba4b1..3d567c1 100644
> ---- a/components/invalidation/invalidator_storage.cc
> -+++ b/components/invalidation/invalidator_storage.cc
> -@@ -2,7 +2,14 @@
> - // Use of this source code is governed by a BSD-style license that can =
be
> - // found in the LICENSE file.
> -=20
> -+#if !defined(NDEBUG)
> -+#pragma GCC diagnostic push
> -+#pragma GCC diagnostic ignored "-Wmaybe-uninitialized"
> -+#endif // !defined(NDEBUG)
> - #include "components/invalidation/invalidator_storage.h"
> -+#if !defined(NDEBUG)
> -+#pragma GCC diagnostic pop
> -+#endif // !defined(NDEBUG)
> -=20
> - #include <string>
> - #include <utility>
> ---=20
> -2.1.4
> -
> diff --git a/recipes-browser/chromium/chromium/chromium-40/0001-Remove-ac=
celerated-Canvas-support-from-blacklist.patch b/recipes-browser/chromium/ch=
romium/chromium-48/0001-Remove-accelerated-Canvas-support-from-blacklist.pa=
tch
> similarity index 71%
> rename from recipes-browser/chromium/chromium/chromium-40/0001-Remove-acc=
elerated-Canvas-support-from-blacklist.patch
> rename to recipes-browser/chromium/chromium/chromium-48/0001-Remove-accel=
erated-Canvas-support-from-blacklist.patch
> index e2c1a5c..2d7bf84 100644
> --- a/recipes-browser/chromium/chromium/chromium-40/0001-Remove-accelerat=
ed-Canvas-support-from-blacklist.patch
> +++ b/recipes-browser/chromium/chromium/chromium-48/0001-Remove-accelerat=
ed-Canvas-support-from-blacklist.patch
> @@ -1,6 +1,6 @@
> -From 821d9fde2302f68f7cb7f0b211f4f78220c97180 Mon Sep 17 00:00:00 2001
> +From be6f1d02f3f784594642929dff289dae33014d56 Mon Sep 17 00:00:00 2001
>  From: Carlos Rafael Giani <dv@pseudoterminal.org>
> -Date: Sun, 12 Oct 2014 17:54:18 +0200
> +Date: Sun, 3 Apr 2016 17:46:59 +0200
>  Subject: [PATCH] Remove accelerated Canvas support from blacklist
> =20
>  Together with the --gpu-no-context-lost command line switch, this patch =
is
> @@ -14,14 +14,14 @@ http://lists.whatwg.org/htdig.cgi/whatwg-whatwg.org/2=
012-September/206450.html
> =20
>  Upstream-Status: Inappropiate [see link above]
>  ---
> - gpu/config/software_rendering_list_json.cc | 10 ----------
> - 1 file changed, 10 deletions(-)
> + gpu/config/software_rendering_list_json.cc | 16 ----------------
> + 1 file changed, 16 deletions(-)
> =20
>  diff --git a/gpu/config/software_rendering_list_json.cc b/gpu/config/sof=
tware_rendering_list_json.cc
> -index b9f5e3a..ccf1460 100644
> +index 484467d..c3b5855 100644
>  --- a/gpu/config/software_rendering_list_json.cc
>  +++ b/gpu/config/software_rendering_list_json.cc
> -@@ -240,16 +240,6 @@ const char kSoftwareRenderingListJson[] =3D LONG_ST=
RING_CONST(
> +@@ -240,22 +240,6 @@ const char kSoftwareRenderingListJson[] =3D LONG_ST=
RING_CONST(
>         ]
>       },
>       {
> @@ -30,6 +30,12 @@ index b9f5e3a..ccf1460 100644
>  -      "os": {
>  -        "type": "linux"
>  -      },
> +-      "exceptions": [
> +-        {
> +-          "gl_vendor": "Vivante Corporation",=20
> +-          "gl_renderer": "Vivante GC1000"
> +-        }
> +-      ],
>  -      "features": [
>  -        "accelerated_2d_canvas"
>  -      ]
> @@ -39,5 +45,5 @@ index b9f5e3a..ccf1460 100644
>         "description": "ATI/AMD cards with older drivers in Linux are cra=
sh-prone",
>         "cr_bugs": [95934, 94973, 136240, 357314],
>  --=20
> -1.9.1
> +2.5.0
> =20
> diff --git a/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc=
-disable-warning-from-gcc-5.patch b/recipes-browser/chromium/chromium/chrom=
ium-48/0001-bignum.cc-disable-warning-from-gcc-5.patch
> similarity index 98%
> rename from recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-=
disable-warning-from-gcc-5.patch
> rename to recipes-browser/chromium/chromium/chromium-48/0001-bignum.cc-di=
sable-warning-from-gcc-5.patch
> index 86691a5..67f9800 100644
> --- a/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disabl=
e-warning-from-gcc-5.patch
> +++ b/recipes-browser/chromium/chromium/chromium-48/0001-bignum.cc-disabl=
e-warning-from-gcc-5.patch
> @@ -34,7 +34,7 @@ index a000b46..6c6d336 100644
>           // 2^64 =3D 18446744073709551616 > 10^19
>           const int kMaxUint64DecimalDigits =3D 19;
>           Zero();
> -@@ -699,7 +699,10 @@
> +@@ -696,7 +696,10 @@
>       }
> =20
> =20
> @@ -45,7 +45,7 @@ index a000b46..6c6d336 100644
>           if (exponent_ > other.exponent_) {
>               // If "X" represents a "hidden" digit (by the exponent) the=
n we are in the
>               // following case (a =3D=3D this, b =3D=3D other):
> -@@ -715,7 +715,10 @@
> +@@ -709,7 +709,10 @@
>               for (int i =3D used_digits_ - 1; i >=3D 0; --i) {
>                   bigits_[i + zero_digits] =3D bigits_[i];
>               }
> diff --git a/recipes-browser/chromium/chromium/chromium-40/0003-Disable-A=
PI-keys-info-bar.patch b/recipes-browser/chromium/chromium/chromium-48/0002=
-Disable-API-keys-info-bar.patch
> similarity index 95%
> rename from recipes-browser/chromium/chromium/chromium-40/0003-Disable-AP=
I-keys-info-bar.patch
> rename to recipes-browser/chromium/chromium/chromium-48/0002-Disable-API-=
keys-info-bar.patch
> index f36fc24..56a5b28 100644
> --- a/recipes-browser/chromium/chromium/chromium-40/0003-Disable-API-keys=
-info-bar.patch
> +++ b/recipes-browser/chromium/chromium/chromium-48/0002-Disable-API-keys=
-info-bar.patch
> @@ -22,7 +22,7 @@ index edea11a..4aef68f 100644
>       return;
>  =20
>  +#if 0
> -   infobar_service->AddInfoBar(ConfirmInfoBarDelegate::CreateInfoBar(
> +   infobar_service->AddInfoBar(infobar_service->CreateConfirmInfoBar(
>         scoped_ptr<ConfirmInfoBarDelegate>(new GoogleApiKeysInfoBarDelega=
te())));
>  +#endif
>   }
> diff --git a/recipes-browser/chromium/chromium/chromium-40/0002-image_uti=
l.cc-disable-warning-from-gcc-5.patch b/recipes-browser/chromium/chromium/c=
hromium-48/0002-image_util.cc-disable-warning-from-gcc-5.patch
> similarity index 100%
> rename from recipes-browser/chromium/chromium/chromium-40/0002-image_util=
=2Ecc-disable-warning-from-gcc-5.patch
> rename to recipes-browser/chromium/chromium/chromium-48/0002-image_util.c=
c-disable-warning-from-gcc-5.patch
> diff --git a/recipes-browser/chromium/chromium/chromium-40/0004-Remove-ha=
rd-coded-values-for-CC-and-CXX.patch b/recipes-browser/chromium/chromium/ch=
romium-48/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
> similarity index 86%
> rename from recipes-browser/chromium/chromium/chromium-40/0004-Remove-har=
d-coded-values-for-CC-and-CXX.patch
> rename to recipes-browser/chromium/chromium/chromium-48/0003-Remove-hard-=
coded-values-for-CC-and-CXX.patch
> index 402a674..7bc8d14 100644
> --- a/recipes-browser/chromium/chromium/chromium-40/0004-Remove-hard-code=
d-values-for-CC-and-CXX.patch
> +++ b/recipes-browser/chromium/chromium/chromium-48/0003-Remove-hard-code=
d-values-for-CC-and-CXX.patch
> @@ -21,13 +21,13 @@ diff --git a/build/common.gypi b/build/common.gypi
>  index 7ec5ae2..11e8d1d 100644
>  --- a/build/common.gypi
>  +++ b/build/common.gypi
> -@@ -5808,16 +5808,6 @@
> +@@ -6047,16 +6047,6 @@
>           ['CXX.host', '<(host_cxx)'],
>         ],
>       }],
>  -    ['OS=3D=3D"linux" and target_arch=3D=3D"arm" and host_arch!=3D"arm"=
 and chromeos=3D=3D0 and clang=3D=3D0', {
> --      # Set default ARM cross compiling on linux.  These can be overrid=
den
> --      # using CC/CXX/etc environment variables.
> +-      # Set default ARM cross tools on linux.  These can be overridden
> +-      # using CC,CXX,CC.host and CXX.host environment variables.
>  -      'make_global_settings': [
>  -        ['CC', '<!(which arm-linux-gnueabihf-gcc)'],
>  -        ['CXX', '<!(which arm-linux-gnueabihf-g++)'],
> @@ -35,9 +35,9 @@ index 7ec5ae2..11e8d1d 100644
>  -        ['CXX.host', '<(host_cxx)'],
>  -      ],
>  -    }],
> -=20
>       # TODO(yyanagisawa): supports GENERATOR=3D=3Dmake
>       #  make generator doesn't support CC_wrapper without CC
> +     #  in make_global_settings yet.
>  --=20
>  1.9.1
> =20
> diff --git a/recipes-browser/chromium/chromium/chromium-48/0004-Create-em=
pty-i18n_process_css_test.html-file-to-avoi.patch b/recipes-browser/chromiu=
m/chromium/chromium-48/0004-Create-empty-i18n_process_css_test.html-file-to=
-avoi.patch
> new file mode 100644
> index 0000000..24bec71
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium/chromium-48/0004-Create-empty-i18=
n_process_css_test.html-file-to-avoi.patch
> @@ -0,0 +1,26 @@
> +From 5158da97132db1a43c95f4c0ad65b4ac2629c4da Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
> +Date: Sat, 23 Apr 2016 14:05:04 +0200
> +Subject: [PATCH] Create empty i18n_process_css_test.html file to avoid b=
uild
> + failure
> +
> +According to https://groups.google.com/a/chromium.org/forum/#!topic/chro=
mium-packagers/9JX1N2nf4PU
> +creating an empty i18n_process_css_test.html is a valid workaround for t=
he
> +following build error:
> +
> +"Exception: Failed to open test/data/webui/i18n_process_css_test.html wh=
ile trying to flatten test/data/webui/i18n_process_css_test.html. (No such =
file or directory)"
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> +---
> + chrome/test/data/webui/i18n_process_css_test.html | 0
> + 1 file changed, 0 insertions(+), 0 deletions(-)
> + create mode 100644 chrome/test/data/webui/i18n_process_css_test.html
> +
> +diff --git a/chrome/test/data/webui/i18n_process_css_test.html b/chrome/=
test/data/webui/i18n_process_css_test.html
> +new file mode 100644
> +index 0000000..e69de29
> +--=20
> +2.5.0
> +
> diff --git a/recipes-browser/chromium/chromium/chromium-48/0005-Override-=
root-filesystem-access-restriction.patch b/recipes-browser/chromium/chromiu=
m/chromium-48/0005-Override-root-filesystem-access-restriction.patch
> new file mode 100644
> index 0000000..ceb6c6c
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium/chromium-48/0005-Override-root-fi=
lesystem-access-restriction.patch
> @@ -0,0 +1,30 @@
> +From ef3aaa58be440c1845e60432a498501088da07fe Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
> +Date: Thu, 28 Apr 2016 09:29:59 +0200
> +Subject: [PATCH] Override root filesystem access restriction
> +
> +Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> +---
> + sandbox/linux/suid/client/setuid_sandbox_client.cc | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/sandbox/linux/suid/client/setuid_sandbox_client.cc b/sandbo=
x/linux/suid/client/setuid_sandbox_client.cc
> +index 12ef7f9..b59908a 100644
> +--- a/sandbox/linux/suid/client/setuid_sandbox_client.cc
> ++++ b/sandbox/linux/suid/client/setuid_sandbox_client.cc
> +@@ -21,8 +21,12 @@
> + namespace {
> +=20
> + bool IsFileSystemAccessDenied() {
> ++#if 0
> +   base::ScopedFD root_dir(HANDLE_EINTR(open("/", O_RDONLY)));
> +   return !root_dir.is_valid();
> ++#else
> ++  return true;
> ++#endif
> + }
> +=20
> + int GetHelperApi(base::Environment* env) {
> +--=20
> +2.5.0
> +
> diff --git a/recipes-browser/chromium/chromium/chromium-48/0006-Remove-GB=
M-support-from-wayland.gyp.patch b/recipes-browser/chromium/chromium/chromi=
um-48/0006-Remove-GBM-support-from-wayland.gyp.patch
> new file mode 100644
> index 0000000..63cc1ee
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium/chromium-48/0006-Remove-GBM-suppo=
rt-from-wayland.gyp.patch
> @@ -0,0 +1,66 @@
> +From 77384aa0d93ed6d5f91ada40971f6825e1b9dd69 Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
> +Date: Thu, 28 Apr 2016 22:02:39 +0200
> +Subject: [PATCH] Remove GBM support from wayland.gyp
> +
> +Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> +---
> + ozone/wayland/wayland.gyp | 20 --------------------
> + 1 file changed, 20 deletions(-)
> +
> +diff --git a/wayland/wayland.gyp b/wayland/wayland.gyp
> +index ff2e210..32f13bc 100644
> +--- a/ozone/wayland/wayland.gyp
> ++++ b/ozone/wayland/wayland.gyp
> +@@ -5,10 +5,6 @@
> +=20
> + {
> +   'variables': {
> +-    'variables': {
> +-      'enable_drm_support%': 0,
> +-    },
> +-    'enable_drm_support%': '<(enable_drm_support)',
> +     'conditions': [
> +       ['sysroot!=3D""', {
> +         'pkg-config': '../../build/linux/pkg-config-wrapper "<(sysroot)=
" "<(target_arch)"',
> +@@ -42,17 +38,14 @@
> +       'direct_dependent_settings': {
> +         'cflags': [
> +           '<!@(<(pkg-config) --cflags <(wayland_packages))',
> +-          '<!@(<(pkg-config) --cflags gbm)',
> +         ],
> +       },
> +       'link_settings': {
> +         'ldflags': [
> +           '<!@(<(pkg-config) --libs-only-L --libs-only-other <(wayland_=
packages))',
> +-          '<!@(<(pkg-config) --libs-only-L --libs-only-other gbm)',
> +         ],
> +         'libraries': [
> +           '<!@(<(pkg-config) --libs-only-l <(wayland_packages))',
> +-          '<!@(<(pkg-config) --libs-only-l gbm)',
> +         ],
> +       },
> +       'dependencies': [
> +@@ -65,19 +58,6 @@
> +         '../..',
> +         '<(DEPTH)/third_party/khronos',
> +       ],
> +-      'conditions': [
> +-        ['<(enable_drm_support)=3D=3D1', {
> +-          'defines': [
> +-          'ENABLE_DRM_SUPPORT',
> +-          ],
> +-          'sources': [
> +-            'egl/wayland_pixmap.cc',
> +-            'egl/wayland_pixmap.h',
> +-            'protocol/wayland-drm-protocol.cc',
> +-            'protocol/wayland-drm-protocol.h',
> +-          ],
> +-        }],
> +-      ],
> +       'sources': [
> +         'data_device.cc',
> +         'data_device.h',
> +--=20
> +2.5.0
> +
> diff --git a/recipes-browser/chromium/chromium/chromium-48/0007-Workaroun=
d-for-glib-related-build-error-with-ozone-w.patch b/recipes-browser/chromiu=
m/chromium/chromium-48/0007-Workaround-for-glib-related-build-error-with-oz=
one-w.patch
> new file mode 100644
> index 0000000..baa8dd2
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium/chromium-48/0007-Workaround-for-g=
lib-related-build-error-with-ozone-w.patch
> @@ -0,0 +1,31 @@
> +From 36a6b35b5eb2874a85b5bc1caf111213c0bee04b Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
> +Date: Fri, 29 Apr 2016 08:52:12 +0200
> +Subject: [PATCH] Workaround for glib-related build error with ozone-wayl=
and
> +
> +This fixes the following compilation error:
> +
> +../../third_party/libsecret/secret.h:18:18: fatal error: glib.h: No such=
 file or directory
> +
> +Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> +---
> + chrome/chrome_browser.gypi | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/chrome/chrome_browser.gypi b/chrome/chrome_browser.gypi
> +index d964fec..daccacb 100644
> +--- a/chrome/chrome_browser.gypi
> ++++ b/chrome/chrome_browser.gypi
> +@@ -3543,6 +3543,9 @@
> +           ],
> +         }],
> +         ['OS=3D=3D"linux" and chromeos!=3D1', {
> ++          'dependencies': [
> ++            '../build/linux/system.gyp:glib',
> ++          ],
> +           'sources': [ '<@(chrome_browser_libsecret_sources)' ],
> +           'defines': [
> +             'USE_LIBSECRET',
> +--=20
> +2.5.0
> +
> diff --git a/recipes-browser/chromium/chromium/chromium-48/0008-Fix-GCC-u=
ninitialized-warning.patch b/recipes-browser/chromium/chromium/chromium-48/=
0008-Fix-GCC-uninitialized-warning.patch
> new file mode 100644
> index 0000000..3bf6d96
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium/chromium-48/0008-Fix-GCC-uninitia=
lized-warning.patch
> @@ -0,0 +1,26 @@
> +From 12d7fb643188ea5033aaf70ffe64b4c58eefc5eb Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
> +Date: Fri, 29 Apr 2016 14:02:44 +0200
> +Subject: [PATCH] Fix GCC uninitialized warning
> +
> +Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> +---
> + third_party/ots/src/name.cc | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/third_party/ots/src/name.cc b/third_party/ots/src/name.cc
> +index a0dd1ea..070ddae 100644
> +--- a/third_party/ots/src/name.cc
> ++++ b/third_party/ots/src/name.cc
> +@@ -79,7 +79,7 @@ bool ots_name_parse(Font *font, const uint8_t* data, s=
ize_t length) {
> +   const char* string_base =3D reinterpret_cast<const char*>(data) +
> +       string_offset;
> +=20
> +-  NameRecord prev_record;
> ++  NameRecord prev_record(0, 0, 0, 0);
> +   bool sort_required =3D false;
> +=20
> +   // Read all the names, discarding any with invalid IDs,
> +--=20
> +2.5.0
> +
> diff --git a/recipes-browser/chromium/chromium/chromium-48/0009-Fix-build=
-errors-with-GCC-in-Debug-mode.patch b/recipes-browser/chromium/chromium/ch=
romium-48/0009-Fix-build-errors-with-GCC-in-Debug-mode.patch
> new file mode 100644
> index 0000000..f5f7889
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium/chromium-48/0009-Fix-build-errors=
-with-GCC-in-Debug-mode.patch
> @@ -0,0 +1,46 @@
> +From 2d7143090fdfd82950be352078daa5019279d81f Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
> +Date: Fri, 29 Apr 2016 17:14:15 +0200
> +Subject: [PATCH] Fix build errors with GCC in Debug mode
> +
> +Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> +---
> + third_party/WebKit/Source/wtf/dtoa/utils.h                         | 7 =
+++++++
> + .../cacheinvalidation/src/google/cacheinvalidation/include/types.h | 2 =
+-
> + 2 files changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/third_party/WebKit/Source/wtf/dtoa/utils.h b/third_party/We=
bKit/Source/wtf/dtoa/utils.h
> +index 0a61c01..7738e9a 100644
> +--- a/third_party/WebKit/Source/wtf/dtoa/utils.h
> ++++ b/third_party/WebKit/Source/wtf/dtoa/utils.h
> +@@ -165,7 +165,14 @@ namespace double_conversion {
> +=20
> +         // Access individual vector elements - checks bounds in debug m=
ode.
> +         T& operator[](int index) const {
> ++#if !defined(NDEBUG)
> ++#pragma GCC diagnostic push
> ++#pragma GCC diagnostic ignored "-Wstrict-overflow"
> ++#endif // !defined(NDEBUG)
> +             ASSERT(0 <=3D index && index < length_);
> ++#if !defined(NDEBUG)
> ++#pragma GCC diagnostic pop
> ++#endif // !defined(NDEBUG)
> +             return start_[index];
> +         }
> +=20
> +diff --git a/third_party/cacheinvalidation/src/google/cacheinvalidation/=
include/types.h b/third_party/cacheinvalidation/src/google/cacheinvalidatio=
n/include/types.h
> +index 4e3be27..835e956 100644
> +--- a/third_party/cacheinvalidation/src/google/cacheinvalidation/include=
/types.h
> ++++ b/third_party/cacheinvalidation/src/google/cacheinvalidation/include=
/types.h
> +@@ -172,7 +172,7 @@ class ErrorInfo {
> +  */
> + class ObjectId {
> +  public:
> +-  ObjectId() : is_initialized_(false) {}
> ++  ObjectId() : is_initialized_(false), source_(0) {}
> +=20
> +   /* Creates an object id for the given source and name (the name is co=
pied). */
> +   ObjectId(int source, const string& name)
> +--=20
> +2.5.0
> +
> diff --git a/recipes-browser/chromium/chromium/chromium-48/0010-Fix-rv-ma=
y-be-used-uninitialized-in-this-function-wa.patch b/recipes-browser/chromiu=
m/chromium/chromium-48/0010-Fix-rv-may-be-used-uninitialized-in-this-functi=
on-wa.patch
> new file mode 100644
> index 0000000..30cd511
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium/chromium-48/0010-Fix-rv-may-be-us=
ed-uninitialized-in-this-function-wa.patch
> @@ -0,0 +1,25 @@
> +From 135debdc4613d5d323d1659166466f74f2e75284 Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
> +Date: Fri, 6 May 2016 12:44:36 +0200
> +Subject: [PATCH] Fix "'rv' may be used uninitialized in this function" w=
arning
> +
> +Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> +---
> + third_party/mojo/src/mojo/edk/system/unique_identifier.cc | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/third_party/mojo/src/mojo/edk/system/unique_identifier.cc b=
/third_party/mojo/src/mojo/edk/system/unique_identifier.cc
> +index 22abf22..6f9a761 100644
> +--- a/third_party/mojo/src/mojo/edk/system/unique_identifier.cc
> ++++ b/third_party/mojo/src/mojo/edk/system/unique_identifier.cc
> +@@ -31,6 +31,7 @@ UniqueIdentifier UniqueIdentifier::FromString(const st=
d::string& s,
> +     memcpy(rv.data_, &bytes[0], sizeof(rv.data_));
> +     *success =3D true;
> +   } else {
> ++    memset(rv.data_, 0, sizeof(rv.data_));
> +     *success =3D false;
> +   }
> +   return rv;
> +--=20
> +2.7.4
> +
> diff --git a/recipes-browser/chromium/chromium/chromium-40/add_missing_st=
at_h_include.patch b/recipes-browser/chromium/chromium/chromium-48/add_miss=
ing_stat_h_include.patch
> similarity index 90%
> rename from recipes-browser/chromium/chromium/chromium-40/add_missing_sta=
t_h_include.patch
> rename to recipes-browser/chromium/chromium/chromium-48/add_missing_stat_=
h_include.patch
> index 90e7827..4620db2 100644
> --- a/recipes-browser/chromium/chromium/chromium-40/add_missing_stat_h_in=
clude.patch
> +++ b/recipes-browser/chromium/chromium/chromium-48/add_missing_stat_h_in=
clude.patch
> @@ -27,8 +27,8 @@ Tested with ARCH armv7.
>  Signed-off-by: Max Krummenacher <max.oss.09 at gmail.com>
>  Upstream-Status: Pending
> =20
> ---- chromium-40.0.2214.91/components/storage_monitor/storage_monitor_lin=
ux.cc~	2015-01-21 21:28:16.000000000 +0100
> -+++ chromium-40.0.2214.91/components/storage_monitor/storage_monitor_lin=
ux.cc	2015-10-27 13:21:08.405655894 +0100
> +--- a/components/storage_monitor/storage_monitor_linux.cc~	2015-01-21 21=
:28:16.000000000 +0100
> ++++ b/components/storage_monitor/storage_monitor_linux.cc	2015-10-27 13:=
21:08.405655894 +0100
>  @@ -8,6 +8,7 @@
>  =20
>   #include <mntent.h>
> diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-=
browser/chromium/chromium_40.0.2214.91.bb
> deleted file mode 100644
> index 3966548..0000000
> --- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -include chromium-browser.inc
> -
> -SRC_URI +=3D "\
> -        file://unistd-2.patch \
> -        file://chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch \
> -        file://chromium-40/add_missing_stat_h_include.patch \
> -        file://chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.pat=
ch \
> -        file://chromium-40/0002-image_util.cc-disable-warning-from-gcc-5=
=2Epatch \
> -        file://chromium-40/0003-disable-uninitialized-warning.patch \
> -        file://chromium-40/0004-Remove-hard-coded-values-for-CC-and-CXX.=
patch \
> -        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'fi=
le://chromium-40/0001-Remove-accelerated-Canvas-support-from-blacklist.patc=
h', '', d)} \
> -        ${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', 'fil=
e://chromium-40/0002-Add-Linux-to-impl-side-painting-whitelist.patch', '', =
d)} \
> -        ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar=
', 'file://chromium-40/0003-Disable-API-keys-info-bar.patch', '', d)} \
> -"
> -
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D537e0b52077bf0a616d0a0c8a79bc=
9d5"
> -SRC_URI[md5sum] =3D "1f5093bd7e435fdebad070e74bfb3438"
> -SRC_URI[sha256sum] =3D "f72fda9ff1ea256ab911610ee532eadf8303137d431f2481=
d01d3d60e5e64149"
> -
> -OZONE_WAYLAND_GIT_BRANCH =3D "Milestone-ThanksGiving"
> -OZONE_WAYLAND_GIT_SRCREV =3D "5d7baa9bc3b8c88e9b7e476e3d6bc8cd44a887fe"
> -
> -OZONE_WAYLAND_EXTRA_PATCHES =3D " \
> -        file://chromium-40/0005-Remove-X-libraries-from-GYP-files.patch \
> -        file://chromium-40/0010-systemd-218.patch \
> -"
> -# using 00*.patch to skip the WebRTC patches in ozone-wayland ThanksGivi=
ng milestone.
> -# The WebRTC patches remove X11 libraries from the linker flags, which is
> -# already done by another patch (see above). Furthermore, to be able to =
use
> -# these patches, it is necessary to update the git repository in third_p=
arty/webrtc,
> -# which would further complicate this recipe.
> -OZONE_WAYLAND_PATCH_FILE_GLOB =3D "00*.patch"
> -
> -# Component build is broken in ozone-wayland for Chromium 40,
> -# and is not planned to work again before version 41
> -python() {
> -    if (d.getVar('CHROMIUM_ENABLE_WAYLAND', True) =3D=3D '1'):
> -        if bb.utils.contains('PACKAGECONFIG', 'component-build', True, F=
alse, d):
> -            bb.fatal("Chromium 40 Wayland version cannot be built in com=
ponent-mode")
> -}
> -
> -CHROMIUM_X11_DEPENDS =3D "xextproto gtk+ libxi libxss"
> -CHROMIUM_X11_GYP_DEFINES =3D ""
> -CHROMIUM_WAYLAND_DEPENDS =3D "wayland libxkbcommon"
> -CHROMIUM_WAYLAND_GYP_DEFINES =3D "use_ash=3D1 use_aura=3D1 chromeos=3D0 =
use_ozone=3D1"
> diff --git a/recipes-browser/chromium/chromium_48.0.2548.0.bb b/recipes-b=
rowser/chromium/chromium_48.0.2548.0.bb
> new file mode 100644
> index 0000000..369d6fa
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium_48.0.2548.0.bb
> @@ -0,0 +1,43 @@
> +include chromium-browser.inc
> +
> +SRC_URI +=3D "\
> +        file://chromium-48/add_missing_stat_h_include.patch \
> +        file://chromium-48/0001-bignum.cc-disable-warning-from-gcc-5.pat=
ch \
> +        file://chromium-48/0002-image_util.cc-disable-warning-from-gcc-5=
=2Epatch \
> +        file://chromium-48/0003-Remove-hard-coded-values-for-CC-and-CXX.=
patch \
> +        file://chromium-48/0004-Create-empty-i18n_process_css_test.html-=
file-to-avoi.patch \
> +        file://chromium-48/0005-Override-root-filesystem-access-restrict=
ion.patch \
> +        file://chromium-48/0008-Fix-GCC-uninitialized-warning.patch \
> +        file://chromium-48/0009-Fix-build-errors-with-GCC-in-Debug-mode.=
patch \
> +        file://chromium-48/0010-Fix-rv-may-be-used-uninitialized-in-this=
-function-wa.patch \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'fi=
le://chromium-48/0001-Remove-accelerated-Canvas-support-from-blacklist.patc=
h', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar=
', 'file://chromium-48/0002-Disable-API-keys-info-bar.patch', '', d)} \
> +"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fca02217a5d49a14dfe2d11837bb=
34d"
> +SRC_URI[md5sum] =3D "0534981cc21efcd11e64b67b85854420"
> +SRC_URI[sha256sum] =3D "4ca4e2adb340b3fb4d502266ad7d6bda45fa3519906dbf63=
cce11a63f680dbc8"
> +
> +EXTRA_OEGYP +=3D " \
> +	-Dv8_use_external_startup_data=3D0 \
> +"
> +
> +OZONE_WAYLAND_GIT_BRANCH =3D "Milestone-SouthSister"
> +OZONE_WAYLAND_GIT_SRCREV =3D "c605505044af3345a276abbd7c29fd53db1dea40"
> +
> +OZONE_WAYLAND_EXTRA_PATCHES =3D " \
> +	file://chromium-48/0006-Remove-GBM-support-from-wayland.gyp.patch \
> +	file://chromium-48/0007-Workaround-for-glib-related-build-error-with-oz=
one-w.patch \
> +"
> +
> +# Component build is unsupported in ozone-wayland for Chromium 48
> +python() {
> +    if (d.getVar('CHROMIUM_ENABLE_WAYLAND', True) =3D=3D '1'):
> +        if bb.utils.contains('PACKAGECONFIG', 'component-build', True, F=
alse, d):
> +            bb.fatal("Chromium 48 Wayland version cannot be built in com=
ponent-mode")
> +}
> +
> +CHROMIUM_X11_DEPENDS =3D "xextproto gtk+ libxi libxss"
> +CHROMIUM_X11_GYP_DEFINES =3D ""
> +CHROMIUM_WAYLAND_DEPENDS =3D "wayland libxkbcommon"
> +CHROMIUM_WAYLAND_GYP_DEFINES =3D "use_ash=3D1 use_aura=3D1 chromeos=3D0 =
use_ozone=3D1 use_xkbcommon=3D1"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TybLhxa8M7aNoW+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlc8hG4ACgkQN1Ujt2V2gByrxwCeIw/Tn04ALKD/pcTm7HP6qX1i
/+YAniSZsGkknQ/Qei+KlJP/p83DY+PD
=Jrz6
-----END PGP SIGNATURE-----

--TybLhxa8M7aNoW+V--
