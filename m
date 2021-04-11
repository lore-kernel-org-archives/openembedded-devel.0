Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web09.12598.1618104743904498975
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Apr 2021 18:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=izahneXg;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id l131so4863394oih.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Apr 2021 18:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lYkxI4WTHcyqkz9aWj6O+JVsz/Gk7YTRTVZbTRPqwuY=;
        b=izahneXg//Ge9h3YIM8uqr8cX8os28LHoE1MOKKxlTBGxhXwDABnqzjCL5mhrCHoh9
         MNw8zvK3vOC1iJI7bT+9ud0DKF4f447/cJ2WZsZPd9xSNqmlDnQCLYbCE4ZtZwe5ajBy
         Z2nn9OzvnWlqkfZg/VAYyM6kzQ6f+RT2yASqPOyuSPVl9E6bmzCXLAntUihEox2bpA9p
         BVj/2ruGcf0cXfsnShRRX49xIJo8YGRImO2pfVs2hxFfO0cqhlpkmkdgM9F1yP1InBzN
         7OrCRHzNOGzHuKL1ldw8VkoIZ8s57HIQkh8Z3++zpbPSVo7SdOCRvgXy+42k3cCarnvx
         7MWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=lYkxI4WTHcyqkz9aWj6O+JVsz/Gk7YTRTVZbTRPqwuY=;
        b=jfXvKwxI51C+THMG4cgkD/h0XB4c6usyiaSufINXKOnvwpyooiQPXKXNaNR/9r0nMc
         KzReCbnRiBlmQYJkbKBcxoIPaX6V94xSAoCjig9Cz7UExpdmmoRVAH/jUW+S/IWaSl26
         jibFzfwixVcCtUEAS7gyLzywnwRi0e7mGmzuMPxooVBOyVQSYy2e94sQhL9LHC5T5Pes
         ycnV3NwXJ5xRKR7euXKLXMk0qenhheSr8ptNBfz+rop/UaDO5KVnGuN3ZiewIj8biUbC
         r+XtcYrrMaddddlxm2yVU3W13/O98aeh8rCww+j+aYHCoNywIdF4JF6jkX32g/kWLItC
         xvaw==
X-Gm-Message-State: AOAM532qG9AyiEE2BIk5cCXlmaXmNdLZ1P50Wwdb3hMtL0TZOA7sV6OS
	7J9b9y5n8B4tLWwQrTVrqbjsgCWUYPBwKw==
X-Google-Smtp-Source: ABdhPJy3MI6oRqa3ZvPIp2vbFq7wmC3H3UAiiAXjsPXPhuiQIrBI6TGmp2O0UZvOje/OVYlv3pvtRw==
X-Received: by 2002:a17:90b:302:: with SMTP id ay2mr2078671pjb.84.1618103967390;
        Sat, 10 Apr 2021 18:19:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:8500:1970:1c49:17c4:8453:96da? ([2601:646:8500:1970:1c49:17c4:8453:96da])
        by smtp.gmail.com with ESMTPSA id y66sm6765905pgb.78.2021.04.10.18.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Apr 2021 18:19:26 -0700 (PDT)
Subject: Re: Hardknott merge request - April 10
To: akuster808 <akuster808@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <46848cd2-8006-2c56-a21c-b2e90512e04f@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <fff9a07d-08de-35ce-a49e-f77e1b780f89@gmail.com>
Date: Sat, 10 Apr 2021 18:19:25 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <46848cd2-8006-2c56-a21c-b2e90512e04f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 4/10/21 7:25 AM, akuster808 wrote:
> The following changes since commit 4ff36ed798939b20746e5b06a04eadf235cceffa:
> 
>    README: updated Maintainers list for Hardknott (2021-03-31 07:05:07 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.openembedded.org/meta-openembedded hardknott-next
> 
> for you to fetch changes up to 94fe80ce8609d62e51cc190595a9f0c2a4a5a89e:
> 
>    xterm: upgrade 366 -> 367 (2021-04-08 13:13:29 -0700)
> 

merged thanks.

> ----------------------------------------------------------------
> Andreas Müller (6):
>        networkmanager-openvpn: Fix packageing
>        mousepad: upgrade 0.5.3 -> 0.5.4
>        xfce4-battery-plugin: upgrade 1.1.3 -> 1.1.4
>        gigolo: upgrade 0.5.1 -> 0.5.2
>        thunar: upgrade 4.16.4 -> 4.16.6
>        poppler: upgrade 21.03.0 -> 21.04.0
> 
> Andrew Geissler (1):
>        nodejs: ppc64le machine support
> 
> Awais Belal (1):
>        libnet-ssleay-perl: add rdep on perl-module-autoloader
> 
> Hermes Zhang (1):
>        gpsd: backport d-bus message time patch from upstream
> 
> INC@Cisco) (1):
>        bpftool: improve reproducibility
> 
> Kartikey Rameshbhai Parmar (1):
>        fluidsynth: update SRC_URI to remove non-existing 2.1.x branch
> 
> Khem Raj (12):
>        flashrom: Add remaining RISCV support
>        mpd: Check for commercial in LICENSE_FLAGS_WHITELIST
>        mpv: Exclude from world if commercial is not in inclusion list
>        sox: Exclude from world if commercial is not in inclusion list
>        vlc: Exclude from world if commercial is not in inclusion list
>        sox: Remove LICENSE_FLAGS = "commercial"
>        mariadb: Fix build on newer 32bit architectures
>        libmanette: Add recipe
>        pidgin-sipe: Fix build with glib-2.0 >= 2.68
>        gjs: Fix build with gcc11
>        poppler: Backport patches to fix build with glib-2.0 2.68+ and GCC11
>        opencv: Upgrade to 5.4.2
> 
> Leon Anavi (34):
>        python3-sqlalchemy: Upgrade 1.4.3 -> 1.4.4
>        python3-bitarray: Upgrade 1.8.1 -> 1.8.2
>        python3-httplib2: Upgrade 0.19.0 -> 0.19.1
>        python3-parso: Upgrade 0.8.1 -> 0.8.2
>        python3-matplotlib: Upgrade 3.3.4 -> 3.4.1
>        python3-pyroute2: Upgrade 0.5.15 -> 0.5.16
>        python3-h5py: Upgrade 3.1.0 -> 3.2.1
>        python3-cheetah: Upgrade 3.2.6 -> 3.2.6.post1
>        python3-google-api-python-client: Upgrade 2.0.2 -> 2.1.0
>        python3-xlsxwriter: Upgrade 1.3.7 -> 1.3.8
>        python3-pymisp: Upgrade 2.4.140 -> 2.4.141
>        python3-tqdm: Upgrade 4.58.0 -> 4.59.0
>        python3-contextlib2: Upgrade 0.6.0 -> 0.6.0.post1
>        python3-typeguard: Upgrade 2.11.1 -> 2.12.0
>        python3-decorator: Upgrade 4.4.2 -> 5.0.1
>        python3-pillow: Upgrade 8.1.2 -> 8.2.0
>        python3-aiohttp: Upgrade 3.7.4 -> 3.7.4.post0
>        python3-networkx: Upgrade 2.5 -> 2.5.1
>        python3-pysonos: Upgrade 0.0.40 -> 0.0.41
>        python3-docutils: Upgrade 0.16 -> 0.17
>        python3-bitarray: Upgrade 1.8.2 -> 1.9.0
>        python3-regex: Upgrade 2021.3.17 -> 2021.4.4
>        python3-sqlalchemy: Upgrade 1.4.4 -> 1.4.5
>        python3-pychromecast: Upgrade 9.1.1 -> 9.1.2
>        python3-decorator: Upgrade 5.0.1 -> 5.0.5
>        python3-pymisp: Upgrade 2.4.141 -> 2.4.141.1
>        python3-pyroute2: Upgrade 0.5.16 -> 0.5.17
>        python3-transitions: Upgrade 0.8.7 -> 0.8.8
>        python3-sqlalchemy: Upgrade 1.4.5 -> 1.4.6
>        python3-bitarray: Upgrade 1.9.0 -> 1.9.1
>        python3-pysonos: Upgrade 0.0.41 -> 0.0.42
>        python3-django: Upgrade 3.1.7 -> 3.2
>        python3-tqdm: Upgrade 4.59.0 -> 4.60.0
>        python3-xmlschema: Upgrade 1.5.3 -> 1.6.0
> 
> Martin Jansa (13):
>        packagegroup-meta-multimedia: include projucer only with x11 in
> DISTRO_FEATURES
>        packagegroup-meta-multimedia: include vlc only with x11 in
> DISTRO_FEATURES
>        packagegroup-meta-oe: include glfw, icewm, geis only with x11 in
> DISTRO_FEATURES
>        phonet-utils: remove
>        packagegroup-meta-oe: use 4 spaces for identation
>        telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings
>        uml-utilities: fix installed-vs-shipped with usrmerge
>        libsmi: use /bin/sh instead of ${base_bindir}/sh to silence QA
> error with usrmerge
>        libyui: switch to libyui-old repo which still has this SRCREV
>        libyui(-ncurses): upgrade to 4.1.1, libyui repo was rewritten
> completely
>        android-tools: use PN instead of BPN in RDEPENDS
>        pidgin-sipe: fix g_memdup2 changes to be backwards compatible with
> glib-1.67
>        pidgin: upgrade to 2.14.2
> 
> Mingli Yu (2):
>        freeradius: Upgrade to 3.0.21
>        hostapd: fix CVE-2021-0326 and CVE-2021-27803
> 
> Randy MacLeod (1):
>        doxygen: Upgrade 1.8.20 -> 1.9.1
> 
> Ross Burton (2):
>        flashrom: recipe cleanup
>        openjpeg: add native/nativesdk class extension
> 
> Valentin Longchamp (1):
>        libssh: add gcrypt to PACKAGECONFIG
> 
> Vinicius Aquino (1):
>        networkmanager: upgrade 1.28.0 -> 1.30.2
> 
> Yann Dirson (1):
>        mpv: remove explicit LICENSE_FLAGS
> 
> Yi Fan Yu (1):
>        rsyslog: fix some of the ptests
> 
> hasan.men (2):
>        librdkafka: Add initial recipe v1.6.1
>        libcppkafka: Add initial recipe for cppkafka wrapper
> 
> wangmy (1):
>        mariadb: upgrade 10.5.8 -> 10.5.9
> 
> zangrc (14):
>        gnome-autoar: upgrade 0.2.4 -> 0.3.1
>        emacs: upgrade 27.1 -> 27.2
>        fbgrab: upgrade 1.4 -> 1.5
>        ostree: upgrade 2020.8 -> 2021.1
>        zabbix: upgrade 5.2.5 -> 5.2.6
>        libxaw: upgrade 1.0.13 -> 1.0.14
>        mosquitto: upgrade 2.0.9 -> 2.0.10
>        nbdkit: upgrade 1.25.4 -> 1.25.5
>        stunnel: upgrade 5.58 -> 5.59
>        usbredir: upgrade 0.8.0 -> 0.9.0
>        hwdata: upgrade 0.345 -> 0.346
>        live555: upgrade 20210322 -> 20210406
>        rabbitmq-c: upgrade 0.10.0 -> 0.11.0
>        xterm: upgrade 366 -> 367
> 
> zhengruoqin (4):
>        fetchmail: upgrade 6.4.17 -> 6.4.18
>        lldpd: upgrade 1.0.4 -> 1.0.8
>        networkmanager-openvpn: upgrade 1.8.12 -> 1.8.14
>        snort: upgrade 2.9.17 -> 2.9.17.1
> 
> 
> 
> 
