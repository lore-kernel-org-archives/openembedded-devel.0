Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5D85162132
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 May 2016 18:32:07 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id yl2so16205289pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2016 11:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=3/1wn9xj+3DP2a4gsanXzShURmeyC5EeHrj9hDGbW7E=;
	b=cV2OJPLyjlStaHQPHOry7L7ohraL+f5Fvs6w3MihjeekLsdEWSo8cvkfNtBqJMrEGb
	uElUzPv65hcQyjgAQcGqG3G7BBhBPAOCSxXUo6ewEK81Hi/f/1dEJjVe7s3S8gw8vr2Z
	wYmXORV1b/C59bZzQvg2LQCRu/rN+TUUIiALg3LLXoGVTj4NK32JjmvdnlTKkTJWlAk0
	UuAkSZYUYWiQwsq+nmUUbpsk9A5RXHhwzAFNQ4QxS5CKA2V2jvQCcE3UliIByBaL+VFq
	MKZjpNnUZ7z6ABi47KXHZ3PDJjpM+TUr3yqYkqI2LGDK3AOy83LiTzBsA7Q8Eq+QKDC5
	bGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=3/1wn9xj+3DP2a4gsanXzShURmeyC5EeHrj9hDGbW7E=;
	b=SW4bKNbaXn87ou0LNjZOULSsJGR0tHv7WyqAstQdMXN7jJvDre6JvbNUEgr+aFf6sv
	xnZhNeN28QjzabQqhUUwZ16reR76KCAanKJUByWCir7VLMxdQWBXVqsZVkBZi9VIj5Hz
	/rniLc3UPCB6f9c70gdqOtJAwc2KBh6HO76K0aFe51dp055xbhZVWk+id59Y/WHrUgdI
	TY1el9vbJpp7iCc8N4HIdjSO6ncPzYGpsEko70vJoH6Q9CRJMB4GgJ8KZPh7It50FjXB
	rz2UC1DwPNdQXXACm4IeZdjrGIh4owriCoucCYjWFIYDT0pmZsoFdU5nq3iGc5XLbQPe
	22xg==
X-Gm-Message-State: AOPr4FWMk3pzbUaO+MNs6MBznxmLq5vUgTPuD5McdxveVjTDLeVJwFyyYS00mtti/7cNVg==
X-Received: by 10.66.148.42 with SMTP id tp10mr52663762pab.159.1462818727740; 
	Mon, 09 May 2016 11:32:07 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:202:4000:1239:997:4c37:16ae:9400])
	by smtp.googlemail.com with ESMTPSA id
	i75sm18822232pfj.51.2016.05.09.11.32.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2016 11:32:06 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>
References: <1462545324-27232-1-git-send-email-Martin.Jansa@gmail.com>
	<572E2F5C.1080702@gmail.com>
	<CA+chaQeo3zZk2ekNVBm_Kfx6PDTrVqce+noRwgmq3WUebPk=Jw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5730D7A4.2060406@gmail.com>
Date: Mon, 9 May 2016 11:32:04 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CA+chaQeo3zZk2ekNVBm_Kfx6PDTrVqce+noRwgmq3WUebPk=Jw@mail.gmail.com>
Subject: Re: [PATCH][krogoth][meta-oe 1/3] pidgin: Update to 2.10.12
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
X-List-Received-Date: Mon, 09 May 2016 18:32:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 5/7/16 2:33 PM, Martin Jansa wrote:
> For me the imporant part is already in commit message, old version doesn't
> build at all, new does, so it's improvement in itself.
>
> Security fixes are good bonus, but in this case older version wasn't really
> affected because it couldn't be even built with corresponding gnutls from
> oe-core release.

I see you got  impatient and pushed the changes in. I have those staged.

the "llvm3.3: Disable auto -dbg packages" commit to krogoth-next, is
that needed in Master?

- Armin
>
> On Sat, May 7, 2016 at 8:09 PM, akuster808 <akuster808@gmail.com> wrote:
>
>>
>> On 05/06/2016 07:35 AM, Martin Jansa wrote:
>>> From: Herrie <github.com@herrie.org>
>>>
>>> Which is compatible with GnuTLS that's included in Krogoth.
>> this update includes:
>> Potential information leak from XMPP    CVE-2014-3698
>> Malicious smiley themes could alter arbitrary files     CVE-2014-3697
>> Remote crash parsing malformed Groupwise message        CVE-2014-3696
>> Remote crash parsing malformed MXit emoticon    CVE-2014-3695
>> Insufficient SSL certificate validation         CVE-2014-3694
>>
>> info like this helps in deciding patch inclusion.
>>
>> - armin
>>
>>> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
>>> ---
>>>  .../pidgin/pidgin/pidgin-cross-python-265.patch    | 35
>> ++++++++++++++--------
>>>  .../pidgin/pidgin/pidgin.desktop-set-icon.patch    | 11 -------
>>>  .../pidgin/{pidgin_2.10.9.bb => pidgin_2.10.12.bb} | 10 ++-----
>>>  3 files changed, 26 insertions(+), 30 deletions(-)
>>>  delete mode 100644
>> meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch
>>>  rename meta-oe/recipes-support/pidgin/{pidgin_2.10.9.bb =>
>> pidgin_2.10.12.bb} (91%)
>>> diff --git
>> a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
>> b/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
>>> index 57c4c46..cfc681c 100644
>>> --- a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
>>> +++ b/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
>>> @@ -1,16 +1,27 @@
>>> -Index: pidgin-2.6.5/configure.ac
>>> -===================================================================
>>> ---- pidgin-2.6.5.orig/configure.ac
>>> -+++ pidgin-2.6.5/configure.ac
>>> -@@ -1470,8 +1470,9 @@ if test "_$pythonpath" != _ ; then
>>> -             AC_CHECK_LIB(pthread, pthread_create, )
>>> -             AC_CHECK_LIB(util, openpty, )
>>> -             AC_CHECK_LIB(db, dbopen, )
>>> --            PY_LIBS="-L$PY_EXEC_PREFIX/lib/python$PY_VERSION/config
>> -lpython$PY_VERSION"
>>> --            PY_CFLAGS="-I$PY_PREFIX/include/python$PY_VERSION"
>>> +From 428836ba7f9048970626ef0d6b805107f7c52d33 Mon Sep 17 00:00:00 2001
>>> +From: Herrie <github.com@herrie.org>
>>> +Date: Thu, 5 May 2016 13:33:29 +0200
>>> +Subject: [PATCH] Updated python patch
>>> +
>>> +---
>>> + configure.ac | 6 +++---
>>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>>> +
>>> +diff --git a/configure.ac b/configure.ac
>>> +index 94ea8cf..2285adb 100644
>>> +--- a/configure.ac
>>> ++++ b/configure.ac
>>> +@@ -1587,9 +1587,9 @@ dnl (Thanks to XChat)
>>> + if test "x$enable_consoleui" = "xyes" -a ! -z "$PYTHON" -a x"$PYTHON"
>> != x"no" ; then
>>> +     AC_MSG_CHECKING(for Python compile flags)
>>> +     if test -f ${PYTHON}-config; then
>>> +-            PY_CFLAGS=`${PYTHON}-config --includes`
>>> +-            PY_LIBS=`${PYTHON}-config --libs`
>>> +-            AC_DEFINE(USE_PYTHON, [1], [Define if python headers are
>> available.])
>>>  +            m4_pattern_allow([^PKG_CONFIG_SYSROOT_DIR$])
>>>  +
>> PY_LIBS="-L$PKG_CONFIG_SYSROOT_DIR/usr/lib/python$PY_VERSION/config
>> -lpython$PY_VERSION"
>>> -+
>> PY_CFLAGS="-I$PKG_CONFIG_SYSROOT_DIR/usr/include/python$PY_VERSION"
>>> -             AC_DEFINE(USE_PYTHON, [1], [Define if python headers are
>> available.])
>>> ++
>> PY_CFLAGS="-I$PKG_CONFIG_SYSROOT_DIR/usr/include/python$PY_VERSION"
>>      AC_DEFINE(USE_PYTHON, [1], [Define if python headers are available.])
>>>               AC_MSG_RESULT(ok)
>>>       else
>>> +             AC_MSG_RESULT([Cannot find ${PYTHON}-config])
>>> +
>>> diff --git
>> a/meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch
>> b/meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch
>>> deleted file mode 100644
>>> index 05f7689..0000000
>>> --- a/meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch
>>> +++ /dev/null
>>> @@ -1,11 +0,0 @@
>>> ---- pidgin-2.0.1/pidgin.desktop.in.orig      2007-06-20
>> 23:50:44.000000000 +0000
>>> -+++ pidgin-2.0.1/pidgin.desktop.in   2007-06-20 23:51:05.000000000
>> +0000
>>> -@@ -4,7 +4,7 @@
>>> - _GenericName=Internet Messenger
>>> - _Comment=Send instant messages over multiple protocols
>>> - Exec=pidgin
>>> --Icon=pidgin
>>> -+Icon=/usr/share/icons/hicolor/48x48/apps/pidgin.png
>>> - StartupNotify=true
>>> - Terminal=false
>>> - Type=Application
>>> diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
>> b/meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
>>> similarity index 91%
>>> rename from meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
>>> rename to meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
>>> index 8352110..9133c1c 100644
>>> --- a/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
>>> +++ b/meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
>>> @@ -2,23 +2,19 @@ DESCRIPTION = "multi-protocol instant messaging client"
>>>  SECTION = "x11/network"
>>>  LICENSE = "GPLv2"
>>>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>>> -DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls
>> virtual/libintl gstreamer dbus intltool-native farsight2 libidn"
>>> +DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls
>> virtual/libintl gstreamer dbus intltool-native farsight2 libidn libxml2
>> gconf dbus-glib"
>>>  inherit autotools gettext pkgconfig gconf perlnative
>>>
>>> -# http://errors.yoctoproject.org/Errors/Details/25824/
>>> -PNBLACKLIST[pidgin] ?= "Not compatible with gnutls version 3.4
>> currently in oe-core and also depends on broken libnice through farsight2"
>>> -
>>>  SRC_URI = "\
>>>      ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \
>>>      file://sanitize-configure.ac.patch \
>>> -    file://pidgin.desktop-set-icon.patch \
>>>      file://purple-OE-branding-25.patch \
>>>      file://pidgin-cross-python-265.patch \
>>>  "
>>>
>>> -SRC_URI[md5sum] = "10a4a69d077893f6dd3438cd8af94e81"
>>> -SRC_URI[sha256sum] =
>> "dc362ed8577f623eea4554a79e917073aa726825074fea402f2e515f0f51f319"
>>> +SRC_URI[md5sum] = "14e0f5cfb2ed065e4dc80391a806ac76"
>>> +SRC_URI[sha256sum] =
>> "2c7523f0fefe89749c03b2b738ab9f7bd186da435be4762f1487eee31e77ffdd"
>>>  EXTRA_OECONF = " \
>>>      --enable-vv \
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


