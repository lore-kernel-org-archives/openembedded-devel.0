Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.8572.1625152801430594580
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jul 2021 08:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wg8Hkktb;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id mn20-20020a17090b1894b02901707fc074e8so6057599pjb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jul 2021 08:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P/YX/ZqzGnHMX04ugJ5czAgOenJNwhGjjiRcWOZwUfo=;
        b=Wg8HkktbtdWuaS+zLrx6g3tHuuio57N2Sr/ow8DcWNw+JXDbFVb5LDluGuWrkTDaM3
         3mhnmNpgdjnW6QOB+FK0ODbEpMohh+1JKRTR6kTtagWDyzFr2MTfuhHJ9CmakO1Zdy+B
         uSuCfPolNe0Gl+aiMq1ugviQGomoM1l9qXypleXorZshpZPVA3I9h3Cy0xiG5EkHq+Sh
         V+l60qZ+kW8DdwXwGIs856K24dKQL09/Xlrhgp26D8vImdh03lXRb69VJgdFmeYLSKgw
         Lc3AkyJTfpBkVRsgVeTSLqnPBU9DdE0F9XEMYRXizCDUoEepVhGEhrTRZkcuxjs2XwkC
         KnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=P/YX/ZqzGnHMX04ugJ5czAgOenJNwhGjjiRcWOZwUfo=;
        b=R6PteoTu+AEnUZlF/xWeyo8uvwAo2B2D7IIk4wZDInjpr9YdNPhr99WL9C59HnKJS/
         ea5w9iccEm1w4oCQVeXt2oASg2C6w5dBLyClWwkW5Jgfl4Ty3yJpKkSL2/A/lp681dSj
         nA9EtnPPikoMrxUn8C+qceD0o0mRX0iW3NQSQrzb6JyXIY6yftBeyXE3CEusYwau86LA
         BDsVQQ5+S3uENx5DIUzOBJz8Nhg0K7OIInBdkl3goBIYaCSRK9jlA31UOjI6Zlp29DAD
         TE4ODFKHB4RfCxVFQZqqTmOAcysdnFGRdd9xZYZy2ggW8MiLCMKSTUi9qRLSyJu2zlHr
         3FmQ==
X-Gm-Message-State: AOAM530TVx+fGAzzOI0CwUcjuYELYIUcGnjD+XuuGA8ZeCmSx4UkAamM
	emUGGOboOzv9Oweycpy303Ee0qwAQRV3nA==
X-Google-Smtp-Source: ABdhPJxjk8uXEMHYW6aqICE0eBWGdiVbImVSicbS2sPb/VpeidPbUPV+VA1S4GaVFMoaFEu9qMzDLg==
X-Received: by 2002:a17:90a:2f66:: with SMTP id s93mr236901pjd.19.1625152800622;
        Thu, 01 Jul 2021 08:20:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:bda3:c742:f39c:c543? ([2601:646:9200:a0f0:bda3:c742:f39c:c543])
        by smtp.gmail.com with ESMTPSA id z3sm330625pfa.67.2021.07.01.08.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jul 2021 08:20:00 -0700 (PDT)
Subject: Re: Hardknott merge request; July 1st
To: akuster808 <akuster808@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <fca61e07-2a18-7777-ac83-1226a079d55c@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <0688f007-39b6-d30b-ae24-d7fd6bcc482c@gmail.com>
Date: Thu, 1 Jul 2021 08:19:58 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fca61e07-2a18-7777-ac83-1226a079d55c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 7/1/21 6:57 AM, akuster808 wrote:
> The following changes since commit aca88908fd329f5cef6f19995b072397fb2d8ec6:
> 
>    thunar: fix CVE-2021-32563 (2021-06-13 12:35:48 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.openembedded.org/meta-openembedded hardknott-next
> 
> for you to fetch changes up to c51e79dd854460c6f6949a187970d05362152e84:
> 
>    python3-django: upgrade 2.2.23 -> 2.2.24 (2021-06-27 07:50:20 -0700)
> 
> ----------------------------------------------------------------
> Andrea Adami (3):
>        initramfs-kexecboot-image: support cases where machines override
> IMAGE_FSTYPES
>        initramfs-debug-image: support cases where machines override
> IMAGE_FSTYPES
>        rapidjson: remove stale LIB_INSTALL_DIR
> 
> Chen Qi (1):
>        minifi-cpp: set CLEANBROKEN to 1
> 
> Geoff Parker (1):
>        cifs-utils: set ROOTSBINDIR to /usr/sbin if DISTRO_FEATURES has
> usrmerge
> 
> Leon Anavi (1):
>        python3-django: Upgrade 3.2.3 -> 3.2.4
> 
> Olivier Georget (1):
>        libpfm4 4.10.1 : enable arm64 host platform
> 
> Ovidiu Panait (1):
>        libeigen: update LICENSE information
> 
> Peter Kjellerstedt (2):
>        net-snmp: A little clean up
>        net-snmp: Support building for native
> 
> Sekine Shigeki (2):
>        add CVE-2011-2411 to allowlist
>        ntp: add CVE-2016-9312 to allowlist
> 
> Trevor Gamblin (3):
>        python3-django: upgrade 2.2.22 -> 2.2.23
>        python3-django: upgrade 3.2.2 -> 3.2.3
>        python3-django: upgrade 2.2.23 -> 2.2.24
> 
> Yi Zhao (1):
>        minifi-cpp: set correct python processor directory in configure file
> 
> ito-yuichi@fujitsu.com (2):
>        cyrus-sasl: add CVE-2020-8032 to allowlist
>        dovecot: add CVE-2016-4983 to allowlist
> 
> zangrc (1):
>        wireshark: upgrade 3.4.5 -> 3.4.6
> 
> zhengruoqin (1):
>        net-snmp: upgrade 5.9 -> 5.9.1
> 
>   meta-initramfs/recipes-core/images/initramfs-debug-image.bb     |  7 +++-
>   meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb |  8 +++--
>   meta-networking/recipes-connectivity/samba/samba_4.10.18.bb     |  4 +++
>   meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb |  3 ++
>   .../net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch        | 19
> ++++++-----
>   .../net-snmp/{net-snmp_5.9.bb => net-snmp_5.9.1.bb}             | 53
> ++++++++++++++++-------------
>   meta-networking/recipes-support/cifs/cifs-utils_6.13.bb         | 17
> +++++++--
>   meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb       |  3 ++
>   meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb             |  3 ++
>   .../wireshark/{wireshark_3.4.5.bb => wireshark_3.4.6.bb}        |  2 +-
>   meta-oe/licenses/MINPACK                                        | 51
> +++++++++++++++++++++++++++
>   meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb             |  2 +-
>   meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb         |  5 +++
>   meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb                 |  3 +-
>   meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb              |  9 +++--
>   meta-python/recipes-devtools/python/python3-django_2.2.22.bb    |  9 -----
>   meta-python/recipes-devtools/python/python3-django_2.2.24.bb    |  9 +++++
>   .../python/{python3-django_3.2.2.bb => python3-django_3.2.4.bb} |  2 +-
>   18 files changed, 156 insertions(+), 53 deletions(-)
>   rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.9.bb =>
> net-snmp_5.9.1.bb} (89%)
>   rename meta-networking/recipes-support/wireshark/{wireshark_3.4.5.bb =>
> wireshark_3.4.6.bb} (97%)
>   create mode 100644 meta-oe/licenses/MINPACK
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-django_2.2.22.bb
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django_2.2.24.bb
>   rename meta-python/recipes-devtools/python/{python3-django_3.2.2.bb =>
> python3-django_3.2.4.bb} (77%)
> 


applied thank you Armin.
