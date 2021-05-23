Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.6044.1621739529850352677
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 May 2021 20:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JVecCYfQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id q15so17482688pgg.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 May 2021 20:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FcKAmJyFl++EfewcJkj40ewp0TPbLtm9Lkn73fBGRj4=;
        b=JVecCYfQqkS5JqQq6xess8uRZGw7/B1ER+/k0xPQUzmGLbIWF0vfcLmm7oaWsBFXhM
         QVDfOIt/t3ReEkrwfLsJLE1hPXtF2w4LZxxSb3wHRXToaG1HXTlDj6Dl3d2WVsgrPfMM
         mmkZsxKa8sfxVs1xSN6g54h7bSLoZ71qBLQ8+6jm0imDPtGcml4BD/ldrYdq2YQD/1z8
         xr1UihCvqVco7/i0SibstahWvTcGs8QO+WBKv8av9lQM77dj7mKJWzvSoPj3isWo3oQ5
         tuL6K5CMXpqdjvGHrgSNn8wW/5zwvNnKCmhlybVR9xAbi4d/jFldDnSxIbazqeX9Rztn
         cA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=FcKAmJyFl++EfewcJkj40ewp0TPbLtm9Lkn73fBGRj4=;
        b=l/6+NLoiersODN1hgryWHxx5yrxM1wxaASSenFjvGOdjiBS+5f4bDF7ruMXxohALx/
         /HLqergJyC/+ZK04ddhkkDeoaM6S583N1BHd2/5bHSjjZYJfgT/N6no05DcFc/YpgesK
         iSY1JeVIs4Mi9X+eTqYsKbc8oCEfsMN8YYhYA/OJ/85DlH7xl8YB9fl0WoFBdqLrOYcb
         sV3kbyLYhxAJ31M28BqUqlp1yqgfS8by3OzdEbYKeHGC40QrrXnOq7b01jdsK+K3HHE9
         HmE8YEE1wbH+7pQoekL5xnKRZboCVU8t00pyyY1MebK2W/r545qggY+9iq3ZCFeun1y0
         uMSA==
X-Gm-Message-State: AOAM533gBTtMcYwv4URJ/EWVoDBEAL+QJNBj+XVHiYISq/XR0gLwD9U1
	DsU5Thyt9isa9TF3Ssmevpfe1r6CZ301wQ==
X-Google-Smtp-Source: ABdhPJyYB9TrKnDYI4llq3rs/H5WdPKn4z1+J/32dffL93mzE57HCmlL/9WwY8x8h8qocUX6XsUkKA==
X-Received: by 2002:a63:f40e:: with SMTP id g14mr6927451pgi.402.1621739529114;
        Sat, 22 May 2021 20:12:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::d04c? ([2601:646:9200:a0f0::d04c])
        by smtp.gmail.com with ESMTPSA id t1sm8029928pgq.47.2021.05.22.20.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 May 2021 20:12:08 -0700 (PDT)
Subject: Re: [oe] Dunfell merge request May 22nd
To: akuster808 <akuster808@gmail.com>,
 Alexander Vickberg <wickbergster@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <21dba787-e5dd-bdac-bcf0-1b0ec84e1e77@gmail.com>
 <CAAxSGfZztRjKVJ5xRSMLY2p1so-L_7tmFdsX1g-4o5hj3qH9-g@mail.gmail.com>
 <5fa692a2-d007-a109-2551-0203f2569b30@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <36733192-0090-0017-4f13-e0a2f427b84f@gmail.com>
Date: Sat, 22 May 2021 20:12:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <5fa692a2-d007-a109-2551-0203f2569b30@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

this is now merged.

On 5/22/21 4:20 PM, akuster808 wrote:
> 
> 
> On 5/22/21 12:43 PM, Alexander Vickberg wrote:
>> Hi,
>>
>> It would be nice if hostapd
>> fix d6ef4170747d6668fa940328334055eef3e1e1d6 from master could be
>> included.
> ah, right. just picked it up for hardknott and dunfell.
> 
> thanks for ponting it out.
> 
> -armin
>>
>> Best regards
>> Alexander Vickberg
>>
>> Den lör 22 maj 2021 kl 21:06 skrev Armin Kuster <akuster808@gmail.com
>> <mailto:akuster808@gmail.com>>:
>>
>>      The following changes since commit
>>      2915810edbb6599051e30efb3b7f805665ddcc23:
>>
>>        ostree: switch from default master branch to main to fix do_fetch
>>      failure (2021-05-13 21:52:34 -0700)
>>
>>      are available in the Git repository at:
>>
>>        https://git.openembedded.org/meta-openembedded dunfell-next
>>
>>      for you to fetch changes up to
>>      11eae114522a6befa06c7f4021a83bc016133543:
>>
>>        linuxptp: Fix cross build (2021-05-14 10:03:51 -0700)
>>
>>      ----------------------------------------------------------------
>>      Armin Kuster (2):
>>            nostromo: Blacklist and exclude from world builds
>>            packagegroup-meta-webserver: remove nostromo from pkg grp
>>
>>      Clément Péron (1):
>>            nodejs: 12.20.2 -> 12.21.0
>>
>>      Khem Raj (1):
>>            linuxptp: Fix cross build
>>
>>      Saloni Jain (1):
>>            fuse: Whitelisted CVE-2019-14860
>>
>>      Sean Nyekjaer (1):
>>            nodejs: 12.20.1 -> 12.20.2
>>
>>       meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
>>      <http://fuse_2.9.9.bb>             |  5 +++++
>>       .../linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch            | 26
>>      ++++++++++++++++++++++++++
>>       .../linuxptp/linuxptp/no-incdefs-using-host-headers.patch       | 29
>>      -----------------------------
>>       meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
>>      <http://linuxptp_2.0.bb>           |  7
>>      ++++---
>>       .../nodejs/{nodejs_12.20.1.bb <http://nodejs_12.20.1.bb> =>
>>      nodejs_12.21.0.bb <http://nodejs_12.21.0.bb>}             |  2 +-
>>       .../recipes-core/packagesgroups/packagegroup-meta-webserver.bb
>>      <http://packagegroup-meta-webserver.bb>  |  2 +-
>>       meta-webserver/recipes-httpd/nostromo/nostromo_1.9.7.bb
>>      <http://nostromo_1.9.7.bb>         |  3 +++
>>       7 files changed, 40 insertions(+), 34 deletions(-)
>>       create mode 100644
>>      meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch
>>       delete mode 100644
>>      meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch
>>       rename meta-oe/recipes-devtools/nodejs/{nodejs_12.20.1.bb
>>      <http://nodejs_12.20.1.bb> =>
>>      nodejs_12.21.0.bb <http://nodejs_12.21.0.bb>} (98%)
>>
>>
>>      
>>
> 
