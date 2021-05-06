Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.1659.1620317593234579682
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 May 2021 09:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kNmtarKg;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id m11so5443791pfc.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 May 2021 09:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jOSjjEeEnt6KMko/dF93x7ygPt+n4kp/CYGyDXl9Jxs=;
        b=kNmtarKgMpw9GROCooCOJWQkiPOanrBRv8BpF85/nkE5MrBg0as7YxGxaBaqmTeUCK
         hKFirgIhsjRHkSOav4nDBUQqyBXgrw18PLZ/Ll34B3zmS+Kgcre1Le4oFc1tN2iKjcJo
         fMDKz2A2RPFJyiFmwRP2kmExwG/mxrCT/ZiHgFxNauFpczUmhGrm0xhsJ4oy7pCqhDw5
         9DWvHIV5mqWrvX4qzcIA3F89U8bJVjVr86Zfy2PCN8gHXCIek8RY1QRWC5CKEadUb2CI
         PtPRkUNIOgb7RYTmPZLkprpNL/4MQ7YPTp6fp69yfSraqf9m6ErG98ftWX+uSjWMXo47
         O7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jOSjjEeEnt6KMko/dF93x7ygPt+n4kp/CYGyDXl9Jxs=;
        b=m6KJRBFPSaKM1SK/0kvl6AgMk/f6syEqqbcJBmoLHAWjldwgsWTzbZvB/0ZVCxxnV5
         SAcplw4Hjju70idUQGzxA1JJOICt8eDYk9e/c7HS59u6v+cs3YCDywJSYkD3WMIl5kfa
         8mc9jAk8rrxdY/mAH7guZ57FaoAg7BFYrjqwRzgzGhve1QJNNqIPaoBW3vdH+ev2QG3m
         flqnk8IR+N9qDpZqZgFc1GwVNWn5Ir/ApgMCtEXH4eUz2DAiQXRvcdNhL0Ln+wsOS0wc
         3qvC2htgT+mHVAqZQZVzE2m78fQc1Y5WRrSaZsKgpbHIjixgSsw4+UCibbuwye5ym1KG
         14/w==
X-Gm-Message-State: AOAM5314Zm5CUMKGoMdW6IdgwtPbqBBkXwYGUyplAxqgC+hfEW8s1bxc
	tjmjMMiUyc//3oYV/V601E2xygIS4ZlyAg==
X-Google-Smtp-Source: ABdhPJxKNrnJ67i8WLsAnGniw7GZuZd/4OWZOCLZtNmnONQuetwBRd0p9LOVfg03dAm9heepNPBCTA==
X-Received: by 2002:a63:d47:: with SMTP id 7mr5226397pgn.400.1620317592347;
        Thu, 06 May 2021 09:13:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:4c88:9139:83c4:7426? ([2601:646:9200:a0f0:4c88:9139:83c4:7426])
        by smtp.gmail.com with ESMTPSA id q21sm2527017pfl.152.2021.05.06.09.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 09:13:11 -0700 (PDT)
Subject: Re: hardknott-next merge request
To: akuster808 <akuster808@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <e2bc5e89-5b18-177d-a0f2-75cc6d0b0774@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <9fdeabb4-9ce4-dbf1-a0ab-07fb3153c3a9@gmail.com>
Date: Thu, 6 May 2021 09:13:09 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e2bc5e89-5b18-177d-a0f2-75cc6d0b0774@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

merged thanks

On 5/6/21 6:23 AM, akuster808 wrote:
> The following changes since commit 71b546ed8595b14d29efc1e8b951f8c845ad10c4:
> 
>    python3-cryptography: Upgrade to 3.3.2 (2021-04-23 19:09:56 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.openembedded.org/meta-openembedded hardknott-next
> 
> for you to fetch changes up to c3a36263f91e42302ad7c347e051cf1cd83e39f6:
> 
>    packagegroup-meta-webserver: remove nostromo from pkg grp (2021-04-29
> 18:57:25 -0700)
> 
> ----------------------------------------------------------------
> Armin Kuster (2):
>        nostromo: Blacklist and exclude from world builds
>        packagegroup-meta-webserver: remove nostromo from pkg grp
> 
> Kai Kang (1):
>        freeradius: check existence of openssl's commands in bootstrap
> 
> Khem Raj (2):
>        tbb: Re-introduce PE
>        gimp: Disable vector icons on musl/x86
> 
> Leon Anavi (3):
>        python3-pysonos: Upgrade 0.0.42 -> 0.0.43
>        python3-asttokens: Upgrade 2.0.4 -> 2.0.5
>        python3-hyperframe: Upgrade 6.0.0 -> 6.0.1
> 
> Sinan Kaya (1):
>        zram: add support for mem_limit
> 
> Yi Zhao (1):
>        gvfs: rdepend on gsettings-desktop-schemas
> 
> zangrc (4):
>        networkmanager: upgrade 1.30.2 -> 1.30.4
>        libdvdread: upgrade 6.1.1 -> 6.1.2
>        redis: upgrade 6.2.1 -> 6.2.2
>        nss: upgrade 3.63 -> 3.64
> 
>   meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb       |  1 +
>   meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb       |  2 ++
>   .../check-openssl-cmds-in-script-bootstrap.patch   | 38
> ++++++++++++++++++++++
>   .../freeradius/freeradius_3.0.21.bb                |  1 +
>   ...kmanager_1.30.2.bb => networkmanager_1.30.4.bb} |  2 +-
>   .../redis/{redis_6.2.1.bb => redis_6.2.2.bb}       |  2 +-
>   meta-oe/recipes-extended/zram/zram/zram-swap-init  |  5 +++
>   .../{libdvdread_6.1.1.bb => libdvdread_6.1.2.bb}   |  4 +--
>   .../nss/{nss_3.63.bb => nss_3.64.bb}               |  7 ++--
>   meta-oe/recipes-support/tbb/tbb_2021.2.0.bb        |  2 ++
>   ...rframe_6.0.0.bb => python3-hyperframe_6.0.1.bb} |  3 +-
>   ...ttokens_2.0.4.bb => python3-asttokens_2.0.5.bb} |  2 +-
>   ...pysonos_0.0.42.bb => python3-pysonos_0.0.43.bb} |  2 +-
>   .../packagesgroups/packagegroup-meta-webserver.bb  |  1 -
>   .../recipes-httpd/nostromo/nostromo_1.9.9.bb       |  3 ++
>   15 files changed, 63 insertions(+), 12 deletions(-)
>   create mode 100644
> meta-networking/recipes-connectivity/freeradius/files/check-openssl-cmds-in-script-bootstrap.patch
>   rename
> meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.30.2.bb
> => networkmanager_1.30.4.bb} (98%)
>   rename meta-oe/recipes-extended/redis/{redis_6.2.1.bb =>
> redis_6.2.2.bb} (96%)
>   rename meta-oe/recipes-multimedia/libdvdread/{libdvdread_6.1.1.bb =>
> libdvdread_6.1.2.bb} (71%)
>   rename meta-oe/recipes-support/nss/{nss_3.63.bb => nss_3.64.bb} (96%)
>   rename
> meta-python/recipes-connectivity/python-hyperframe/{python3-hyperframe_6.0.0.bb
> => python3-hyperframe_6.0.1.bb} (61%)
>   rename meta-python/recipes-devtools/python/{python3-asttokens_2.0.4.bb
> => python3-asttokens_2.0.5.bb} (81%)
>   rename meta-python/recipes-devtools/python/{python3-pysonos_0.0.42.bb
> => python3-pysonos_0.0.43.bb} (79%)
> 
