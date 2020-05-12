Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.5470.1589289510438023972
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 06:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pj5sRKZ5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id l17so1781294wrr.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 06:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=hq28x0DYhl9Q8t/jJwr8KHc5CtfuXKkb7w5kl/A63Gk=;
        b=Pj5sRKZ5Yy3u3fBxBKG+bqLodIxvLqbOVv0nNzkMMjmtetp7cLKD1fJ4rSAKW5ihMF
         umnxqViq+9iMdjRLiVTBjHgrrAn6Q92bEdf6Y7aBuy/JsnMAnse49vRN6kQJ1jJx4JWI
         f2xOHNrROPKaoTZHFHGX1q6eiTkTUg2eVRnVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=hq28x0DYhl9Q8t/jJwr8KHc5CtfuXKkb7w5kl/A63Gk=;
        b=F+DnUFNmmJcNfJfioBEXKrsK27vf7xS68Iag+dKGZ774TOLDeX7YamI2Z1+CUD69eT
         6USfdrzXbO/KtofSab4OulI7XMo9XC6HTGt2loood0iiitfs1M5R1njifUm9E+0FFYHj
         4XhX3gkxFRW/19vMApz2SUwiDMtrWeabl2pTAXzzpmWJwXVnLPUk5Mbs+uO5gYCGHaSh
         2OOUKi6XxZR+gOcfHPhE94m/ZyAoCdO8QVa5NRhL6HEuy1LGTCwUXH2EKUw28dwjcY8F
         eLbiEY4GETm6V3M2hfZcbseDfpyQylIHgSQv034cSb/H2Z56bixP8ABESuJ82iETIbgH
         FUPg==
X-Gm-Message-State: AGi0PuZEAL/SCp3pYVxRDLjzZn92W6H8atTm1xGu0gg1Tg3RacCOoSYq
	2Szzz8DQNfkaA7M2UuS+0R0AB3O62Cw=
X-Google-Smtp-Source: APiQypKEN88pDK+lMPbs5uJgSAv5UlVDTXsyO3Qz+AENwTpKlDNIgBCFwf1ZW5A9ceu3vgNCegVszg==
X-Received: by 2002:adf:fe07:: with SMTP id n7mr6846495wrr.259.1589289508476;
        Tue, 12 May 2020 06:18:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id n7sm13770187wro.94.2020.05.12.06.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 06:18:27 -0700 (PDT)
Message-ID: <b7017ef93f45a7a825d42d1ae3f4c5082ea45186.camel@linuxfoundation.org>
Subject: meta-openembedded dunfell maintainer
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
 openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Date: Tue, 12 May 2020 14:18:26 +0100
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The OE TSC would like to ask if there is anyone interested in stepping
up to look after the dunfell branch of meta-openembedded?

dunfell is an LTS release for Yocto Project and it would be good to
have some kind of plan for meta-openembedded as well.

We believe the 'policy' for the branch would be broadly similar to the
one being used for openembedded-core, 
https://wiki.yoctoproject.org/wiki/LTS.

If anyone is interested, please reply here or talk to Khem in the first
instance as the layer maintainer. He can no doubt answer questions if
anyone does want to discuss what the role would involve. Its usually
for the layer maintainer to choose the maintainer but the OE TSC would
be the final decision maker if needed.

Cheers,

Richard
(on behalf of Khem and the OE TSC)


