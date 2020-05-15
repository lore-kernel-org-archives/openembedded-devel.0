Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web12.16518.1589558749690759670
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 09:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=i3fe2osW;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: daniel.diaz@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id e25so2822309ljg.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 09:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uPAUg1hqRcRY5R6N+giZ/EdWLpEifRyjheSZH9bmjT8=;
        b=i3fe2osWMy51Q58EjaC3CSaoBXxXn3+wH3c4jhJcdFbb0EQAjYibVs4CnCn0X0gSjj
         COBQjig99lPsI6hSL82K+VpCvxnVmqd4AmYNTsS4A2iWYFYXUaiaGyN2Pk9RtDMikoP8
         ZZfMT2bn1S8vW/mPQkmMLdH6KYKN+QJ0bA+K5IOJJmLn2FlMqV5oiQ66MmlIX/51WrL9
         m73zrRiAKY1w+skmlGkTfR9LrHGgBKJnbO66RU2H5j3leVeR2+CoeX4PJcpa9UhCnaRk
         tVIs6B1wkyaI2P35ZeDsFgbz/rO5z5gHo/Crc37xBdjqgySb1yUhH3jvwnCyxCrbDkJo
         DYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uPAUg1hqRcRY5R6N+giZ/EdWLpEifRyjheSZH9bmjT8=;
        b=kZl1J05BD38cUEwiZOWavgYqGSCvv9z5gkZZ73w3jlzVyynAFi4iGxgktOX+EuOo5H
         MRoY1HaCzupFWJTZRVX7ZBz+727HNeUVT33dFn3Yfpr4Ti89Y2ckcv2wBTKOETEbdlKS
         PSDtTzDaz32eehWE3jdEYtYhOcJrXLoZ0jZBljOgh67wylnOyN3YWDMnjStIO2QlpcKD
         d9lvCvyhHcwDBbs6WUHJbpYmFA5gpXdYqIrpCUCK36xIActHx3JEri6RMRliNjc0dPMc
         7FihdOMx1fNIYbs7O6/5LgHYEOWcebTMxjWb6dMR8uqZB6HCwc446NSuj0hkm7gtpqBt
         qv1Q==
X-Gm-Message-State: AOAM533XmVsAOoQRsAn38Gg/3oM7fb3AzbjUGmlXwEkjd9Zi40ZJeBXa
	sigSTdf9PkYrQ4TkqTX3C7e6TroiHHCLFVbRMfAugg==
X-Google-Smtp-Source: ABdhPJyCFW8wuyPVAAtPpR6XFyr23wRHYDs/NEkcGl4iJ5cn6VgAH9xG0UuRa6EGtMD6wCEtCtrxq0klLp4e2dX2lkk=
X-Received: by 2002:a2e:6c08:: with SMTP id h8mr2656036ljc.48.1589558747511;
 Fri, 15 May 2020 09:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <f756b087-c3e3-3a47-171e-bc72421ff48a@balister.org>
In-Reply-To: <f756b087-c3e3-3a47-171e-bc72421ff48a@balister.org>
From: "Daniel D?az" <daniel.diaz@linaro.org>
Date: Fri, 15 May 2020 11:05:36 -0500
Message-ID: <CAEUSe783rDYWD6we-OLpU2=eM1HTJ0=zars+RJOBYW0c8NFveQ@mail.gmail.com>
Subject: Re: [OE-core] OpenEmbedded Happy Hour
To: Philip Balister <philip@balister.org>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-members@lists.openembedded.org" <openembedded-members@lists.openembedded.org>, 
	Yocto Project <yocto@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Fri, 15 May 2020 at 10:56, Philip Balister <philip@balister.org> wrote:
> I've made a wiki page to track these:
> https://www.openembedded.org/wiki/Happy_Hours
> Then next one is scheduled for 2100 UTC on May 27.

Ah, just in time to watch live SpaceX's launch:
https://blogs.nasa.gov/commercialcrew/

Greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org
