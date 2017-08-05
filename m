Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id B310771A32
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Aug 2017 16:04:54 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id v189so18822316pgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Aug 2017 09:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=gozsAMs0J634YHR9yeIyF+sHFyIjg+otvlaWhIcM7oo=;
	b=Y79lS46lIyA1NJq2IszJzS7WSrKWdTR8LB2/R0u73zzjvnwcHcTb8r4QQLGZUHvR1l
	m9NyqvPo+ujfq5ZCnIgFsw7NI/ZKPZjcyeWM4H2b/q1gOB7tAvkPeDO+wxL6k9SfuSdy
	VYTPSLIEYD8Eu9oLOhHa89eBSHpD4VA8+H8zBfVuZTbSy/6b2MjbopLjdSCVF4BsIRz+
	db7B/FzIba74icY0HCDB6KZkeWmy5ZvNYGt5+EnlPABbQcxQTSn138V1dQ7yS4v3vofy
	p7MrxkxpsnujrHdlduwfrGmfR+fYwS4Ni3FZgFoOzYNL6ZIgHV4HM9TMtOixHnMAVz7Q
	hzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=gozsAMs0J634YHR9yeIyF+sHFyIjg+otvlaWhIcM7oo=;
	b=cor6+PHQ1Bj06jx5nNvqtMympVqdCZVSjUYHIyV4Fwy264/SUQRlPaZEfbAv/gZIfU
	kObjxIdJQVc/kf3sgbVIE/yo+ihC+KL6aogb3FNAM5G2/uhLKCAlz4XSntNvpgi+8HDz
	4RtTgRNdS1XCumuHG58O3XuElynno9+BbGf0vukCHcwZqJcwIfeYxmycQU0gbwt8kc8n
	A4pDrV/yRv0m7qx1Gn8jutOodD6nkFQt8iLkPuMoi/0Canb6wBfacsh5QKdixdBP+OsR
	l7foUXiQjjRSlQLbsajJRmzYAwGawtTr7mWx4eqppVXM+zzhd9oMMJCa7NtvWF4O32Nc
	V6bw==
X-Gm-Message-State: AIVw113b10ubVMVVDvoAT87yl7OZ+aAFOsUBRSB6y2pLFAHfDJUL/m4z
	L/VikGs7KA/knqgb
X-Received: by 10.84.133.37 with SMTP id 34mr7415142plf.221.1501949095627;
	Sat, 05 Aug 2017 09:04:55 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:a184:9868:f119:54ba?
	([2601:202:4001:9ea0:a184:9868:f119:54ba])
	by smtp.gmail.com with ESMTPSA id
	e198sm7954493pfh.36.2017.08.05.09.04.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 Aug 2017 09:04:55 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <cover.1501630307.git.akuster808@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <0a85c821-7a9b-c811-2657-1111a72503f2@gmail.com>
Date: Sat, 5 Aug 2017 09:04:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <cover.1501630307.git.akuster808@gmail.com>
Subject: Re: [PATCH 00/19] Morty-next: pull request
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
X-List-Received-Date: Sat, 05 Aug 2017 16:04:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 08/01/2017 04:36 PM, Armin Kuster wrote:

ignore, superseded by "Morty-next #2"

> Please concider the follow for Morty.
>
> The following changes since commit a44baf37d8bec492f00c08a3eb8b6a295ee80260:
>
>    libdnet: update SRC_URI (2017-02-24 19:33:29 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/meta-openembedded-contrib akuster/morty-next
>    http://cgit.openembedded.org/meta-openembedded/log/?h=akuster/morty-next
>
> Alejandro Mery (4):
>    gitver: fix try/except syntax for python3 support
>    gitver: extend class to use EXTERNALSRC if set
>    gitver: fix broken ${GITSHA} and recursion in S when PV="${GITVER}"
>    gitver: skip packages instead of panic()ing if ${GITVER} fails to
>      expand
>
> Andreas Müller (1):
>    lmsensors: fix fetch and unblacklist
>
> Armin Kuster (4):
>    python-sqlalchemy: fix SRC_URI
>    lm_sensors: update SRC_URI
>    exfat-utils: update SRC_URI
>    libdnet: Update SRC_URI to fix checksum errors
>
> Denys Dmytriyenko (1):
>    devmem2: use different filename to avoid checksum conflicts
>
> Derek Straka (1):
>    apache2: always use the archive.apache.org to ensure older releases
>      are always available
>
> Joe Slater (1):
>    chrony: fix build failure for arma9
>
> Khem Raj (1):
>    alsa-equal: Update SRC_URI to something valid
>
> Martin Jansa (5):
>    mailcap: use pagure.org instead of retired fedorahosted.org
>    libqb: use github.com instead of retired fedorahosted.org
>    libqb: inherit autotools-brokensep
>    ttf-liberation-sans-narrow: use pagure.org instead of retired
>      fedorahosted.org
>    hwdata: use github instead of fedorahosted.org
>
> Nicolas Ferre (1):
>    devmem2: Change source URL to regain access to it
>
>   .../recipes-utils/exfat-utils/exfat-utils_1.2.3.bb |  5 +-
>   .../alsa-equal/alsa-equal_0.6.bb                   |  4 +-
>   .../recipes-connectivity/libdnet/libdnet_1.12.bb   |  2 +-
>   .../recipes-support/chrony/chrony/arm_eabi.patch   | 57 ++++++++++++++++++++++
>   .../recipes-support/chrony/chrony_2.4.bb           |  5 +-
>   meta-oe/classes/gitver.bbclass                     | 49 +++++++++++--------
>   meta-oe/recipes-extended/libqb/libqb_0.17.2.bb     | 15 +++---
>   .../ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb |  2 +-
>   meta-oe/recipes-support/devmem2/devmem2.bb         | 12 +++--
>   .../hwdata/{hwdata_0.291.bb => hwdata_git.bb}      | 10 ++--
>   .../recipes-support/lm_sensors/lmsensors_3.4.0.bb  |  8 +--
>   meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb  | 10 ++--
>   .../python/python-sqlalchemy_0.7.9.bb              |  5 +-
>   .../recipes-httpd/apache2/apache2-native_2.4.23.bb |  2 +-
>   .../recipes-httpd/apache2/apache2_2.4.23.bb        |  2 +-
>   15 files changed, 133 insertions(+), 55 deletions(-)
>   create mode 100644 meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
>   rename meta-oe/recipes-support/hwdata/{hwdata_0.291.bb => hwdata_git.bb} (57%)
>


