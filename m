Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id 80B407EF4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 00:32:41 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id s145so27391507qke.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 17:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3gDAABJkMh51t5ly/ylwlvHw0IB0EMcsrJNEkz/f7lw=;
	b=bYowCva3RpVKTPOflQtAWOp4tJTU7HL+fE0JU+wU916lmhWr20wV8LHfTlch0dnJFi
	JmPmY5g1BIJkN1m1lRZj9gDWUudc6k5d2d+zqo+4rDSXo6Wi65981JrN3zyRvWqFjhJW
	AHk5MGg+2oUblRAiRlbwGXwgnhyDz8gyuSABHUL2I6k1hzwabLdfi4WDeUBOHCiGe47S
	02x+LR9cda2vlojJg5MYjWyUYIMC358v5+m9PiPENSOuVd0LeP9lHjoQB5to7JnnO3Qb
	l34CNxfKFblOqOoNX09xFtjLuykhbuGEabjeOcqdWAbyLrhGriX5lQJyzQgopRztm9PX
	6nJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3gDAABJkMh51t5ly/ylwlvHw0IB0EMcsrJNEkz/f7lw=;
	b=k9L1N7qoZ81mC7da9ecB3YVK0Qr7JyJINRxWWFIR/ZnUBxkwJXPuVfHOG8aFhhKF5y
	QGxmhIsfWDU+lCMzfv0TpgPA1dV38mK5Y9q6/I5kAuGI/Cz/TTAkUb2vd40hfY/I7OIe
	8DDlkdiLamN68+dddDhUKHhgFlP0CDUewiJPq0ooGYN/R2M2QSxhxAiW1FPDGHbjb34l
	MvRLxuDKDXtRFrTy2R0JRAM7zvZVyP+tMtFyRiGGZQ47J3Not8TH3cEUV44j67zJllul
	2vA4kTDJZ2SOI0l7Wtsf5SmMfpEvbAie2l1/graD3vSiuQntyQ8W8U6XgX8BzLj8mXMJ
	QqSA==
X-Gm-Message-State: APjAAAWmQqlDfAhbsXojb8YwNlVzj5wctGFGMoB2GKwnx6zUe4K9Q4oG
	rR1dKaYJY2JH5bHPrk67o5TRIasjAo0tiWZUoIUmY2Jc
X-Google-Smtp-Source: APXvYqxFYQQtz+NkAtzID2NEs36MjvumnWvVZrvROXI7zblx3vlgA83M+tcPY6r2wMU6VKm0lg9uuh23tUsGJijtG6I=
X-Received: by 2002:a37:a20f:: with SMTP id l15mr44794192qke.212.1563755561942;
	Sun, 21 Jul 2019 17:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190721233802.32193-1-open.source@oleksandr-kravchuk.com>
	<c9ce95b6-ddd4-a290-c7d7-04fd9fea116d@gmail.com>
	<1a5062db-50dc-76cf-3d71-f796a2e5da9b@oleksandr-kravchuk.com>
In-Reply-To: <1a5062db-50dc-76cf-3d71-f796a2e5da9b@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Jul 2019 17:32:25 -0700
Message-ID: <CAMKF1sqnGQ6YvaBQSsOa8vb2OqWp--3TSnEBHaQruvoJ-bwfjg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] blueman: update to 2.1.1
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
X-List-Received-Date: Mon, 22 Jul 2019 00:32:41 -0000
Content-Type: text/plain; charset="UTF-8"

Ok, thanks.  I will queue it up shortly.

On Sun, Jul 21, 2019 at 5:23 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Hi,
>
> Hm... It applies cleanly on the top of master-next and resulted patch is
> identical.
>
> On 22/07/2019 02:20, Khem Raj wrote:
> > HI Oleksandr
> >
> > Can you rebase this on top of master-next and resend ?
> >
> > On 7/21/19 4:38 PM, Oleksandr Kravchuk wrote:
> >> Removed patch was upstreamed.
> >>
> >> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> >> ---
> >>   .../blueman/blueman_2.1.1.bb                  | 58 +++++++++++++++++++
> >>   .../blueman/blueman_git.bb                    | 42 --------------
> >>   2 files changed, 58 insertions(+), 42 deletions(-)
> >>   create mode 100644
> >> meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
> >>   delete mode 100644
> >> meta-networking/recipes-connectivity/blueman/blueman_git.bb
> >>
> >> diff --git
> >> a/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
> >> b/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
> >> new file mode 100644
> >> index 000000000..36de2af1d
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
> >> @@ -0,0 +1,58 @@
> >> +DESCRIPTION = "Blueman is a GTK+ Bluetooth Manager"
> >> +LICENSE = "GPLv3"
> >> +LIC_FILES_CHKSUM =
> >> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> >> +
> >> +DEPENDS = "bluez5 python3-pygobject python3-cython-native
> >> python3-setuptools-native intltool-native"
> >> +
> >> +inherit autotools systemd gsettings python3native gtk-icon-cache
> >> +
> >> +SRC_URI = " \
> >> +
> >> https://github.com/blueman-project/blueman/releases/download/${PV}/blueman-${PV}.tar.xz
> >> \
> >> +    file://0001-Search-for-cython3.patch \
> >> +"
> >> +SRC_URI[md5sum] = "9de89abb31be45bdbf11f7884764a2dc"
> >> +SRC_URI[sha256sum] =
> >> "f1eab2334e5a1587defa80900901048d14c2e8ffa8c0cff7240bc9937a61dbc3"
> >> +
> >> +EXTRA_OECONF = " \
> >> +    --disable-runtime-deps-check \
> >> +    --disable-schemas-compile \
> >> +"
> >> +
> >> +SYSTEMD_SERVICE_${PN} = "${BPN}-mechanism.service"
> >> +SYSTEMD_AUTO_ENABLE_${PN} = "disable"
> >> +
> >> +RRECOMENDS_${PN} += "adwaita-icon-theme"
> >> +RDEPENDS_${PN} += " \
> >> +    python3-core \
> >> +    python3-dbus \
> >> +    packagegroup-tools-bluetooth \
> >> +"
> >> +
> >> +PACKAGECONFIG ??= "thunar"
> >> +PACKAGECONFIG[thunar] =
> >> "--enable-thunar-sendto,--disable-thunar-sendto"
> >> +
> >> +FILES_${PN} += " \
> >> +    ${datadir}/dbus-1 \
> >> +    ${datadir}/Thunar \
> >> +    ${systemd_user_unitdir} \
> >> +    ${exec_prefix}${systemd_system_unitdir} \
> >> +    ${PYTHON_SITEPACKAGES_DIR} \
> >> +"
> >> +
> >> +FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_blueman.a"
> >> +
> >> +# In code, path to python is a variable that is replaced with path
> >> to native version of it
> >> +# during the configure stage, e.g
> >> ../recipe-sysroot-native/usr/bin/python3-native/python3.
> >> +# Replace it with #!/usr/bin/env python3
> >> +do_install_append() {
> >> +    sed -i "1s/.*/#!\/usr\/bin\/env python3/"
> >> ${D}${prefix}/libexec/blueman-rfcomm-watcher \
> >> +
> >> ${D}${prefix}/libexec/blueman-mechanism \
> >> +
> >> ${D}${bindir}/blueman-tray \
> >> +
> >> ${D}${bindir}/blueman-services \
> >> +
> >> ${D}${bindir}/blueman-sendto \
> >> +
> >> ${D}${bindir}/blueman-report \
> >> +
> >> ${D}${bindir}/blueman-manager \
> >> +
> >> ${D}${bindir}/blueman-assistant \
> >> +
> >> ${D}${bindir}/blueman-applet \
> >> +
> >> ${D}${bindir}/blueman-adapters
> >> +}
> >> diff --git
> >> a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> >> b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> >> deleted file mode 100644
> >> index 91b64a36b..000000000
> >> --- a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> >> +++ /dev/null
> >> @@ -1,42 +0,0 @@
> >> -DESCRIPTION = "Blueman is a GTK+ Bluetooth Manager"
> >> -LICENSE = "GPLv3"
> >> -LIC_FILES_CHKSUM =
> >> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> >> -
> >> -DEPENDS = "bluez5 python3-pygobject python3-cython-native
> >> python3-setuptools-native intltool-native"
> >> -
> >> -inherit autotools systemd gsettings python3native gtk-icon-cache
> >> -
> >> -SRC_URI = " \
> >> -    git://github.com/blueman-project/blueman.git \
> >> -    file://0001-Search-for-cython3.patch \
> >> -"
> >> -SRCREV = "c4a03417e81e21543d4568e8e7f7de307582eb50"
> >> -PV = "2.0.5+git${SRCPV}"
> >> -S = "${WORKDIR}/git"
> >> -
> >> -EXTRA_OECONF = " \
> >> -    --disable-runtime-deps-check \
> >> -    --disable-schemas-compile \
> >> -"
> >> -
> >> -SYSTEMD_SERVICE_${PN} = "${BPN}-mechanism.service"
> >> -SYSTEMD_AUTO_ENABLE_${PN} = "disable"
> >> -
> >> -RRECOMENDS_${PN} += "adwaita-icon-theme"
> >> -RDEPENDS_${PN} += " \
> >> -    python3-dbus \
> >> -    packagegroup-tools-bluetooth \
> >> -"
> >> -
> >> -PACKAGECONFIG ??= "thunar"
> >> -PACKAGECONFIG[thunar] =
> >> "--enable-thunar-sendto,--disable-thunar-sendto"
> >> -
> >> -FILES_${PN} += " \
> >> -    ${datadir}/dbus-1 \
> >> -    ${datadir}/Thunar \
> >> -    ${systemd_user_unitdir} \
> >> -    ${exec_prefix}${systemd_system_unitdir} \
> >> -    ${PYTHON_SITEPACKAGES_DIR} \
> >> -"
> >> -
> >> -FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_blueman.a"

