Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1B4087F25D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 03:26:29 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id s18so3317892qkj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2019 20:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WCwknw9ez3sg2TsvRyJtEj0yaA5/2NNJN/or1mwgaa4=;
	b=VbVkexZkwfSWoCtOKIEl6Pgaoye8ropP830CONutft1JURjBdFUrNxBf/nslhalxYM
	tmHEVr+PCzcX3QaOXyVhvgDOaLBwsAzwhjMEj0DFzrnE3UQOvK1LppZVX9vzb3cgF2J4
	p5ld6P2POOPqPZ6L048tHHAmErBMQpKE5La9VJUyr0RTcEsWLv4JvcWcovT8RWv4Gv87
	UFsb1EdUwC87/s8NP6Vk3mbkjni0+/I/vBo8HJG/pOOMV5HrVsK5O5qdRTusc9Hnf1cC
	tpvHnCwiyKYZrIAHBc+OueuaOK3gAl+kwwv9oDdGWg1UWqZSGCX1Qqk94R6VvGU4Y7Ij
	84Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WCwknw9ez3sg2TsvRyJtEj0yaA5/2NNJN/or1mwgaa4=;
	b=LG0kjnWGp6Xe3AeRpBdTFV7pNxlW38UU4Ft0dMT2bmxm16zHJRO2wmCnjO1Axb8+FM
	36ZO030xL14nyScty4JkWnzOL/jBVK0lZstR6hEUN7KMozZqJyQeNLcz+0kU7bTBt/OL
	SH6fF5t74uI6G5l+l0mLvFThrV3WY2KNUzEfN+gBR/9ne1IVpBWBgOYYioHx6O5Iyl0K
	CmMLle8MGXbghPnNRMDait3EkvlZekd5Kl95iQluCfvepxMLPfS91hd4nHTgALrd1OG0
	qPaKLi/eDcEnvOrpHIYXTV/MCiHtbuDQUi5NXo6p1Pv26mxwWeNM0D5zpgZlfdot9MJq
	541w==
X-Gm-Message-State: APjAAAVU4U5KkUzS/2wwmSAnjkLPpDd8ZfNradsl0auOrMoWgD84ceZx
	DAAQx7v8BsvU15PKDA8GAKcj8Ak65PQDfiD680Q=
X-Google-Smtp-Source: APXvYqxJE8S3ITi05W7bJcA2ijX3Ht4TM+Va0bHGj9C0DNC78LfXu1KALeT1kYv/OcEqrK2gngNNenzZ0f+u6f+cD34=
X-Received: by 2002:a37:b002:: with SMTP id z2mr12758043qke.71.1567481190308; 
	Mon, 02 Sep 2019 20:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <fe511106-68be-88ad-8cfd-572a1858f440@gmail.com>
In-Reply-To: <fe511106-68be-88ad-8cfd-572a1858f440@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Sep 2019 20:26:04 -0700
Message-ID: <CAMKF1soRK9CDPJHmN=siKz1-odY4gzWukzK98s8a3EhaMJDiYQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: pull request for warrior
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
X-List-Received-Date: Tue, 03 Sep 2019 03:26:30 -0000
Content-Type: text/plain; charset="UTF-8"

merged thanks

On Mon, Sep 2, 2019 at 7:48 PM akuster808 <akuster808@gmail.com> wrote:
>
> he following changes since commit 222cafdcd97549f67c98833721b4f8f33607555e:
>
>   wireless-regdb: Upgrade 2019.03.01 -> 2019.06.03 (2019-07-13 12:43:43
> -0700)
>
> are available in the git repository at:
>
>   https://git.openembedded.org/meta-openembedded
> 0afee3eacfd18a9962013830028f9e54b4973657
>
> for you to fetch changes up to 0afee3eacfd18a9962013830028f9e54b4973657:
>
>   apache2: upgrade 2.4.39 -> 2.4.41 (2019-09-02 19:39:53 -0700)
>
> ----------------------------------------------------------------
> Adrian Bunk (5):
>       zeromq: Upgrade 4.3.1 -> 4.3.2
>       gnome-desktop3: Fix REQUIRED_DISTRO_FEATURES
>       wireshark: Use an upstream URL that stays valid longer
>       libgit2: Upgrade 0.27.8 -> 0.27.9
>       vlc: notify switched to GTK+3 some time ago
>
> Carlos Rafael Giani (1):
>       openh264: Fix armv7ve build
>
> Changqing Li (3):
>       volume-key: fix "Nothing RPROVIDES" when multilib enabled
>       isomd5sum: fix "Nothing RPROVIDES" when multilib enabled
>       satyr: fix "Nothing RPROVIDES" when multilib enabled
>
> Fabian Klemp (1):
>       openvpn: respect pid file in init.d service start
>
> Kai Kang (1):
>       net-snmp: update SRC_URI
>
> Luca Ceresoli (2):
>       fuse-exfat: moved to github
>       exfat-utils: moved to github
>
> Martin Jansa (5):
>       redis: backport a fix for stack trace generation on aarch64
>       ntop: fix missing return from non-void function
>       freeradius: add runtime dependency on perl
>       scsirastools: add runtime dependency on bash
>       scsirastools: add runtime dependency on bash II
>
> Mingli Yu (1):
>       mariadb: Upgrade to 10.3.16
>
> Yi Zhao (2):
>       fuse: upgrade 2.9.8 -> 2.9.9
>       apache2: upgrade 2.4.39 -> 2.4.41
>
>  .../fuse-exfat/fuse-exfat_1.2.3.bb                 |  6 +--
>  .../fuse/{fuse_2.9.8.bb => fuse_2.9.9.bb}          |  4 +-
>  .../recipes-utils/exfat-utils/exfat-utils_1.2.3.bb |  2 +-
>  .../gnome-desktop/gnome-desktop3_3.32.0.bb         |  2 +-
>  .../recipes-multimedia/openh264/openh264_1.7.0.bb  |  1 +
>  meta-multimedia/recipes-multimedia/vlc/vlc.inc     |  2 +-
>  .../freeradius/freeradius_3.0.17.bb                |  2 +-
>  .../recipes-protocols/net-snmp/net-snmp_5.8.bb     |  6 +--
>  ...fix-missing-return-from-non-void-function.patch | 19 +++++++++
>  meta-networking/recipes-support/ntop/ntop_5.0.1.bb |  1 +
>  .../recipes-support/openvpn/openvpn/openvpn        | 12 +++++-
>  .../recipes-support/wireshark/wireshark_3.0.1.bb   |  2 +-
>  .../zeromq/{zeromq_4.3.1.bb => zeromq_4.3.2.bb}    |  4 +-
>  ...native_10.3.15.bb => mariadb-native_10.3.16.bb} |  0
>  meta-oe/recipes-dbs/mysql/mariadb.inc              |  8 ++--
>  .../{mariadb_10.3.15.bb => mariadb_10.3.16.bb}     |  0
>  .../recipes-extended/isomd5sum/isomd5sum_1.2.3.bb  |  8 ++--
>  .../Fixed-stack-trace-generation-on-aarch64.patch  | 45
> ++++++++++++++++++++++
>  meta-oe/recipes-extended/redis/redis_4.0.14.bb     |  1 +
>  .../scsirastools/scsirastools_1.6.6.bb             |  4 +-
>  .../volume_key/volume-key_0.3.12.bb                |  7 ++--
>  .../{libgit2_0.27.8.bb => libgit2_0.27.9.bb}       |  3 +-
>  meta-oe/recipes-support/satyr/satyr_0.27.bb        |  4 +-
>  .../{apache2_2.4.39.bb => apache2_2.4.41.bb}       |  4 +-
>  24 files changed, 110 insertions(+), 37 deletions(-)
>  rename meta-filesystems/recipes-support/fuse/{fuse_2.9.8.bb =>
> fuse_2.9.9.bb} (94%)
>  create mode 100644
> meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch
>  rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.3.1.bb =>
> zeromq_4.3.2.bb} (85%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.15.bb =>
> mariadb-native_10.3.16.bb} (100%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.15.bb =>
> mariadb_10.3.16.bb} (100%)
>  create mode 100644
> meta-oe/recipes-extended/redis/redis/Fixed-stack-trace-generation-on-aarch64.patch
>  rename meta-oe/recipes-support/libgit2/{libgit2_0.27.8.bb =>
> libgit2_0.27.9.bb} (90%)
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.39.bb =>
> apache2_2.4.41.bb} (98%)
>

