Return-Path: <akuster808@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8FE1A724DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 00:55:40 +0000 (UTC)
Received: by iedm5 with SMTP id m5so31033134ied.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 17:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=PZDBcTjanrbcL4RQuK6MZWilXxcJdddf/63aPZJKcHA=;
	b=k8yIp6f4UKgTdKsmqu9dnbpN1lobLgd/zbVVSOs/jo2kqGm6yp55OGQgAfxSBtcFCi
	T5xy3HYVQRSB+6UjUrUwwayOkpCRLeR3yzNdVexMXi1E4lEGeXdRpvQyGFbWQwXZYs/H
	1NNrhqW5WjIMAbBg+QQq2OXYpWWKwG3vxUHW6F4YfhSEQrLTUPfBVQvDPlmTNtNURk+5
	ik+Dku3QjIpARcY01ve+q1MdV17xorXnP9yWGFzDCzG2zod/epL3uqyAMQkyRbhKSowF
	mD/VWocISj+swii6wFHIj0JC6b75g2l8A+VT+kfYdKbLopaK5Dc67bbQPUutN2iGO8SQ
	25yg==
X-Received: by 10.107.159.84 with SMTP id i81mr20666722ioe.32.1427849741356;
	Tue, 31 Mar 2015 17:55:41 -0700 (PDT)
Received: from [10.22.11.55] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id mw1sm478871igb.18.2015.03.31.17.55.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Mar 2015 17:55:40 -0700 (PDT)
Message-ID: <551B4202.2020405@gmail.com>
Date: Tue, 31 Mar 2015 17:55:30 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br
References: <cover.1427426569.git.akuster808@gmail.com>
	<551B0538.3080209@balister.org>
In-Reply-To: <551B0538.3080209@balister.org>
Subject: Re: [PATCH 00/18] Dizzy pull request
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Apr 2015 00:55:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/31/2015 01:36 PM, Philip Balister wrote:
> Did you skip the last commit in this branch for a reason?

I did, didn't I.  what the ...

I need to redo the request anyway. will get the missing commit.

- armin

>
> https://github.com/balister/meta-oe/commits/pyqt-dizzy
>
> Philip
>
> On 03/26/2015 08:26 PM, Armin Kuster wrote:
>> Please consider this changes for meta-openembedded dizzy-next
>>
>> The following changes since commit 853dcfa0d618dc26bd27b3a1b49494b98d6eee97:
>>
>>    rsyslog: fix name of syslogd ua group (2015-03-03 21:13:17 +0100)
>>
>> are available in the git repository at:
>>
>>    https://github.com/akuster/meta-openembedded akuster/dizzy-next
>>    https://github.com//tree/akuster/dizzy-next
>>
>> Andre McCurdy (1):
>>    log4c: fix undeclared dependency on expat
>>
>> Andreas Müller (1):
>>    samba: add mirrors
>>
>> Armin Kuster (4):
>>    wireshark: update to 1.12.3
>>    wireshark: fix rdepends issue
>>    wireshark: fix pcap-config issue
>>    wireshark: update to 12.4
>>
>> Ash Charles (2):
>>    xfce4-xkb-plugin: Specify GPLv2 license
>>    xfce4-diskperf-plugin: Specify BSD license
>>
>> Bian Naimeng (1):
>>    xbitmaps: fix build warning.
>>
>> Dan McGregor (1):
>>    lxdm: RDEPEND on libsvg-gtk
>>
>> Paul Eggleton (1):
>>    tmux: remove sed-native from DEPENDS
>>
>> Philip Balister (4):
>>    python-pyqt: Update to 4.11.3.
>>    sip: Update to 4.14.2.
>>    anki: python-sip package replaces with just sip.
>>    sip: Split python into a new package for runtime support.
>>
>> Sven Ebenfeld (2):
>>    claws-mail: Fix SRC_URI
>>    pxaregs: Add source file and fix SRC_URI
>>
>> Zhenhua Luo (1):
>>    python-pip: add python-distribute in RDEPENDS
>>
>>   .../{wireshark_1.12.2.bb => wireshark_1.12.4.bb}   |   19 +-
>>   meta-oe/recipes-connectivity/samba/samba.inc       |    9 +-
>>   .../python/python-pyqt-4.9.6/pyqt-generated.patch  |   12 -
>>   .../python-pyqt-4.9.6/qreal_float_support.diff     |  248 ---
>>   .../recipes-devtools/python/python-pyqt_4.11.3.bb  |   54 +
>>   .../recipes-devtools/python/python-pyqt_4.9.6.bb   |  103 -
>>   .../recipes-devtools/python/python-sip_4.14.2.bb   |   46 -
>>   meta-oe/recipes-extended/anki/anki_0.4.3.bb        |    2 +-
>>   meta-oe/recipes-extended/sip/sip-native_4.14.2.bb  |   35 -
>>   meta-oe/recipes-extended/sip/sip_4.16.4.bb         |   52 +
>>   meta-oe/recipes-extended/tmux/tmux_1.6.bb          |    2 +-
>>   meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |    2 +-
>>   .../recipes-graphics/xorg-data/xbitmaps_1.1.1.bb   |    1 +
>>   .../recipes-sato/claws-mail/claws-mail_3.9.0.bb    |    2 +-
>>   .../log4c/log4c/fix_configure_with-expat.patch     |   21 +
>>   meta-oe/recipes-support/log4c/log4c_1.2.4.bb       |   13 +-
>>   .../recipes-support/pxaregs/pxaregs-1.14/pxaregs.c | 1975 ++++++++++++++++++++
>>   meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb    |    4 +-
>>   .../recipes-devtools/python/python-pip_1.3.1.bb    |    2 +-
>>   .../diskperf/xfce4-diskperf-plugin_2.5.4.bb        |    2 +-
>>   .../xkb/xfce4-xkb-plugin_0.7.0.bb                  |    2 +-
>>   21 files changed, 2140 insertions(+), 466 deletions(-)
>>   rename meta-networking/recipes-support/wireshark/{wireshark_1.12.2.bb => wireshark_1.12.4.bb} (63%)
>>   delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-generated.patch
>>   delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_float_support.diff
>>   create mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
>>   delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
>>   delete mode 100644 meta-oe/recipes-devtools/python/python-sip_4.14.2.bb
>>   delete mode 100644 meta-oe/recipes-extended/sip/sip-native_4.14.2.bb
>>   create mode 100644 meta-oe/recipes-extended/sip/sip_4.16.4.bb
>>   create mode 100644 meta-oe/recipes-support/log4c/log4c/fix_configure_with-expat.patch
>>   create mode 100644 meta-oe/recipes-support/pxaregs/pxaregs-1.14/pxaregs.c
>>

