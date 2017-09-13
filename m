Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id DDEDE78647
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 14:20:06 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id l24so102902uaa.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5VLTu/oqgAoNf0QTsm2cfEUPdKJeGIGRgjOqwdH83q0=;
	b=rcZpOqt5mXlSaOr31ruk38gWZFAlSyY10m53sVvHtCYFkVtA4Ay13X6h+pL7oGZD5S
	bpXHuya4gPCE+DxJgS53c6ilBYOwSnVpjQ3bwMJ/2bV24Lys7JGRJqX46bb9kOjfK+Io
	SjzSjMQDGgaTNB5F464evt17a4qr+j6ifvowjJMbVWLxJH2XCSd9er3EX7PiBm+lflKA
	6VhOEtbhVhoTG2GxvwCpDXeih1+pz43vhekFRGCokmUbQMroEBZp/KJo9QV7/rN4xPvy
	16eVBxffkx4SjUNUiwRNKr5E8MRPwi4kAE+27VdwdOO6Dfc2MbEsXoxvBdCJnUPdXstW
	WlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5VLTu/oqgAoNf0QTsm2cfEUPdKJeGIGRgjOqwdH83q0=;
	b=jv+3WwaOKFaUAJp5WqWh0WjBC4Oqd7OnvxCkneDQoTHKtQZiqHRCMYm7FidBoe7gW/
	WUcsKjWbr0boHOpXEehscA2EOtoUjpv/gBKWXX67cr4gs3YjW8Vz3ThuidogBOUXM+oz
	AwR5qhUhicXOOtZGXQXLcrNvUedSMIxJvTXLsEk6w+duyv6sJDANJew2f8UYW2+2t9gK
	Yqz5YLdPzM1oQe+TbtZns19Mh8KeaZE1glICA+zOLNyMEk07rgYFKkm5hu8y9+NqxZZ3
	Iv+udpnqrJgQBSnAbKRd+UYjRqhC7kqLoucTAkZjVTl+rbyosaG4T2naQwZ5/vup7XJ+
	0FhQ==
X-Gm-Message-State: AHPjjUiYmrf3tqIiuXc39k1EmHuR8idaP9uK0zdug4Uo1jz2418mFU2l
	vrMC92MBhq0A/bHu3649RMQiyd/EK/NNIHrrQaH8fw==
X-Google-Smtp-Source: AOwi7QAme0map3zTN8pjN8M8k4jp+iZLF9ggAulTb+adDSj6dlyxONbOXZTz2pkpfydoBLkaVjIPYRxCIXHMmLtNcvk=
X-Received: by 10.176.2.5 with SMTP id 5mr15418923uas.160.1505312407701; Wed,
	13 Sep 2017 07:20:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Wed, 13 Sep 2017 07:20:07 -0700 (PDT)
In-Reply-To: <CA+chaQdYaQa1-D9tRvvRksdv0vhudTaeUKKgRwwRte-PVLRCcg@mail.gmail.com>
References: <20170911125009.9837-1-fabien.lahoudere@collabora.co.uk>
	<CA+chaQdYaQa1-D9tRvvRksdv0vhudTaeUKKgRwwRte-PVLRCcg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Sep 2017 16:20:07 +0200
Message-ID: <CA+chaQdHXzf+u5dAjWXsUU_wBf+hG6hi+VsOKosF+AEHb1kXMg@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v2] libupnp: Bump to version 1.8.2
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
X-List-Received-Date: Wed, 13 Sep 2017 14:20:07 -0000
Content-Type: text/plain; charset="UTF-8"

Please fix this ASAP, because I've already merged gerbera recipe (tested
together with this libupnp change), but now with libupnp upgrade dropped
from master-next because of this issue gerbera fails as well in master due
to old upnp:

-- Found UPnP:
gerbera/1.0+gitAUTOINC+4435b165d1-r0/recipe-sysroot/usr/lib/libupnp.so
(found version "1.6.21")
CMake Error at CMakeLists.txt:380 (message):
  gerbera requires libupnp 1.8.0 or above.


On Mon, Sep 11, 2017 at 6:51 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> This probably break mpd build:
> http://errors.yoctoproject.org/Errors/Details/155531/
>
> On Mon, Sep 11, 2017 at 2:50 PM, Fabien Lahoudere <
> fabien.lahoudere@collabora.co.uk> wrote:
>
>> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
>> ---
>>  .../libupnp/libupnp/sepbuildfix.patch              | 34
>> ----------------------
>>  .../{libupnp_1.6.21.bb => libupnp_1.8.2.bb}        | 12 ++++----
>>  2 files changed, 7 insertions(+), 39 deletions(-)
>>  delete mode 100644 meta-multimedia/recipes-connec
>> tivity/libupnp/libupnp/sepbuildfix.patch
>>  rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.6.21.bb
>> => libupnp_1.8.2.bb} (66%)
>>
>> diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch
>> b/meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch
>> deleted file mode 100644
>> index 0493cea0e..000000000
>> --- a/meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbu
>> ildfix.patch
>> +++ /dev/null
>> @@ -1,34 +0,0 @@
>> -From e198f0a87660a048164ca0e16d18517d0aee846e Mon Sep 17 00:00:00 2001
>> -From: Andre McCurdy <armccurdy@gmail.com>
>> -Date: Tue, 9 Jun 2015 12:20:45 -0700
>> -Subject: [PATCH] Fix builds when using separate source and build
>> directories.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ----
>> - configure.ac           | 10 +++++-----
>> - 1 files changed, 5 insertions(+), 5 deletions(-)
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index a8731b5..54a3c3d 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -744,9 +744,9 @@ AC_OUTPUT
>> - #
>> - # Files copied for windows compilation.
>> - #
>> --echo "configure: copying \"autoconfig.h\"          to
>> \"build/inc/autoconfig.h\""
>> --test -d build/inc || mkdir -p build/inc
>> --cp autoconfig.h build/inc/autoconfig.h
>> --echo "configure: copying \"upnp/inc/upnpconfig.h\" to
>> \"build/inc/upnpconfig.h\""
>> --cp upnp/inc/upnpconfig.h build/inc/upnpconfig.h
>> -+echo "configure: copying \"autoconfig.h\"          to
>> \"\$srcdir/build/inc/autoconfig.h\""
>> -+test -d $srcdir/build/inc || mkdir -p $srcdir/build/inc
>> -+cp autoconfig.h $srcdir/build/inc/autoconfig.h
>> -+echo "configure: copying \"upnp/inc/upnpconfig.h\" to
>> \"\$srcdir/build/inc/upnpconfig.h\""
>> -+cp upnp/inc/upnpconfig.h $srcdir/build/inc/upnpconfig.h
>> -
>> ---
>> -1.9.1
>> -
>> diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.
>> 21.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
>> similarity index 66%
>> rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.21.
>> bb
>> rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
>> index a1988295a..61b209ab8 100644
>> --- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.21.bb
>> +++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
>> @@ -8,11 +8,13 @@ HOMEPAGE = "http://pupnp.sourceforge.net/"
>>  LICENSE = "BSD"
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=b3190d5244e08e78e4c8ee78544f4863"
>>
>> -SRC_URI = "${SOURCEFORGE_MIRROR}/pupnp/${BP}.tar.bz2 \
>> -           file://sepbuildfix.patch \
>> -"
>> +SRC_URI = "https://github.com/mrjimenez/pupnp/archive/release-${PV}.ta
>> r.gz "
>>
>> -SRC_URI[md5sum] = "513adadb07fa039a8aeb0ceb7b7b0f6e"
>> -SRC_URI[sha256sum] = "af3f3c0846a1d75baeadae4aa5a2b
>> da427567e2a1fb4559bf73ccff0a4f9a39b"
>> +SRC_URI[md5sum] = "db8061f7cbd7f9af993ac4e87ad084cb"
>> +SRC_URI[sha256sum] = "438ad86bfd933cb1e9be1c41bf3bd
>> 69f049daba11d71bbb5d715336e00106cb4"
>> +
>> +S="${WORKDIR}/pupnp-release-${PV}"
>>
>>  inherit autotools
>> +
>> +EXTRA_OECONF += "--enable-reuseaddr"
>> \ No newline at end of file
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

