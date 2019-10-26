Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id A43767FC4E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 09:39:52 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id o25so7162628qtr.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 02:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fYL8IexElH2ApJMex+6PJOcx8yecpqsf8hv6hHEa5tw=;
	b=E/2WBjy5iZLa4CjcLviQ9VObm5kP1Ir/t0ZuBkgwp0WtQDpt27uKYtA5Oe5/6C1cKR
	EPZuhlE7huBnljQ778cnmMSrZ9PtVk2zkLamnXeJxLpXeML+CJhUk0JFvjxCtwKBDDtn
	zkXxuKqyetXX5ESyT+brbqbex/lTb5dbKaDW1GBBAUbhql97no5Jr/JDpJ0JL+VcE33v
	XzTWDX063IXbyvy05LWto7rVJdeHZtM2v/q+9Y4yo/EkCYo8FvQNGnQeIb/Ktm6/WaXO
	qukbMUQmwhh+zu0OaM8gxGPYRz4JO7sTyH1Rkek2ArYWNmyXfmYP1DAQ8rmDCsRTduEL
	Yzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fYL8IexElH2ApJMex+6PJOcx8yecpqsf8hv6hHEa5tw=;
	b=mmVMTuwGQESnfneB4dGarDTr7C6AgjPCsJhNIxjkI1DwEW+V7sTQ/KF5hV52eloeRW
	oKXC9C8jPzpktW/GwNXpc6u+Ed3oQ3GH77++7sUztlleYKFPY7B+VXjbKg32wcGXfcrY
	KcAImBHzQCeBGRDAspMZbfr3Z6H5SDbciJT8fTmUHMqXEkxQELVQtAxuDq1SXwNAFfX4
	ea4AZ2Er+pSMcAL5b/NzXxpqM+bjDiXO4YWWdc6A4+DOQGiLwV7rUv3I0PLJspp+wSNU
	aowohvCZFaZ8DKx9tNbJD6+TVnsY6Pjqpo2y62lIWjwZGDIP0xgqknKILa12qQ3Qnp5M
	5pww==
X-Gm-Message-State: APjAAAVnwkBP2CEhZiVKk13lBAxQ53pbeXIhmeOC00HYmVh9qH0u07F8
	PnZoCXCis614mRWz+5wfbs5WtotaP09Z2yce/1o=
X-Google-Smtp-Source: APXvYqw+OhDKi2rNXQWalrBSS32AOmKixiRVFit3YndRWt204+TFVs5MTZmKtfgpwe5ht+KpZWRHj2Gp5rRlrJ67DdY=
X-Received: by 2002:ac8:7617:: with SMTP id t23mr7686875qtq.88.1572082793233; 
	Sat, 26 Oct 2019 02:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <7dcc70b4-c510-c20d-4afc-8f6d53b82589@gmail.com>
In-Reply-To: <7dcc70b4-c510-c20d-4afc-8f6d53b82589@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Oct 2019 10:39:26 +0100
Message-ID: <CAMKF1soV6WVYh=gymxX2N9NTJN6HMuTc+Cf2kXHxEGoAsvOWUw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: warrior pull request
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
X-List-Received-Date: Sat, 26 Oct 2019 09:39:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged thanks

On Sat, Oct 26, 2019 at 9:43 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit f4ccdf2bc3fe4f00778629088baab840c868e3=
6b:
>
>   mariadb: update SRC_URI to use archive.mariadb.org (2019-10-09
> 11:26:58 -0700)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/meta-openembedded warrior-next
>
> for you to fetch changes up to a24acf94d48d635eca668ea34598c6e5c857e3f8:
>
>   tcpdump: Delete unused patch (2019-10-19 08:25:27 -0700)
>
> ----------------------------------------------------------------
> Andreas M=C3=BCller (3):
>       xfce4-panel: Draw icons/background properly when compositing is
> disabled
>       polkit-group-rules: Fix error in do_rootfs for rpm package-manager
>       vlc: rework qt PACKAGECONFIG
>
> Khem Raj (1):
>       xorg-fonts-100dpi: Change License Custom -> MIT
>
> Martin Jansa (1):
>       python3-twofish: Fix missing return statements in module stubs
>
> Pavel Modilaynen (1):
>       jsoncpp: add native BBCLASSEXTEND
>
> Peiran Hong (2):
>       tcpdump: upgrade 4.9.2 -> 4.9.3
>       tcpdump: Delete unused patch
>
> Peter Kjellerstedt (1):
>       kconfig-frontends: Retrieve the Git repository from GitLab
>
> Qi.Chen@windriver.com (1):
>       protobuf-c: fix race condition
>
>  meta-multimedia/recipes-multimedia/vlc/vlc.inc     | 24 ++++---
>  ...2017-16808-AoE-Add-a-missing-bounds-check.patch | 61 ----------------=
-
>  .../tcpdump/tcpdump/add-ptest.patch                |  9 +--
>  ...-absolute-path-when-searching-for-libdlpi.patch | 19 ++---
>  .../recipes-support/tcpdump/tcpdump/run-ptest      |  4 +-
>  .../tcpdump/unnecessary-to-check-libpcap.patch     | 15 ++--
>  .../tcpdump/{tcpdump_4.9.2.bb =3D> tcpdump_4.9.3.bb} | 12 +++-
>  meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb  |  2 +
>  .../kconfig-frontends_4.11.0.1.bb                  |  4 +-
>  .../protobuf-c/0001-avoid-race-condition.patch     | 36 ++++++++++
>  .../recipes-devtools/protobuf/protobuf-c_1.3.1.bb  |  3 +-
>  .../recipes-extended/polkit/polkit-group-rule.inc  |  2 +-
>  .../xorg-font/xorg-fonts-100dpi.bb                 |  2 +-
>  ...missing-return-statements-in-module-stubs.patch | 38 ++++++++++
>  .../python/python3-twofish_0.3.0.bb                |  2 +
>  ...y-Fix-icons-without-compositing-Bug-14577.patch | 80
> ++++++++++++++++++++++
>  .../recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb |  1 +
>  17 files changed, 214 insertions(+), 100 deletions(-)
>  delete mode 100644
> meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-A=
dd-a-missing-bounds-check.patch
>  rename meta-networking/recipes-support/tcpdump/{tcpdump_4.9.2.bb =3D>
> tcpdump_4.9.3.bb} (74%)
>  create mode 100644
> meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-retu=
rn-statements-in-module-stubs.patch
>  create mode 100644
> meta-xfce/recipes-xfce/xfce4-panel/files/0002-systray-Fix-icons-without-c=
ompositing-Bug-14577.patch
>
>

