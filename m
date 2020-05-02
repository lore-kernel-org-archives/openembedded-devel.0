Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web12.2427.1588412399301882966
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 May 2020 02:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fLR4X6N0;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id 19so7162465ioz.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2020 02:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=0rKJY+FTwJf0Fg8+jpGaO4dnHUTX3aQHHBVq/KEbEhg=;
        b=fLR4X6N0A74ct3Zzf6gr89zUC/t+G13l1Qq1ZuD5XuwQlN6YnM+6+28tI3myUpyjEv
         enRRK8/Ex8SNWopgi+agNT3kMo9llsUSd02pNf3cDgm5gKRnnXwaIYUBMH7mWThVx54c
         LpFwrEvUGi1sVhyd+ayGxtyfeAbrLE5SecJ7T8tHMQoZnzVHXekYy+UfBdaCFcVqyKB0
         soW7C5W9cWHCoUzH6gfBPgBHYFZhnyY8rOiD8zplZhCK+nnuF0Hb2sKhk1NYlWU+4r5t
         H2YBwx9zQ9MCwCNVRJOSR3uA3N9ljSYFhhlOXz4GgpIfApDAxxVg5B/j2vjkOcRuvL0n
         RINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=0rKJY+FTwJf0Fg8+jpGaO4dnHUTX3aQHHBVq/KEbEhg=;
        b=L/H1Fdqazg2czE4NzEveYjNk4klefDizVD+uTImYyPeuBQ5gsEeae+pMSi6TZfixq6
         ygd+1RKj18o6mT/R+oYO5VRQM43iIPOfHacJYoGEM6i9Y+440RM+xR7GbIbiI5qG9q68
         aWA8PazKA9WB+S6MnN1fF6Xo01BwZ40RtYsgj503pzY3dDQ92ilEmPEZRPiXJ6hcG/GL
         T6d1q20etVhNGFWPLNbAqbjBNzUuH5JogjuuAqvY84/jaNHLG4UPJRn1FQ1tH8l+m0hl
         J+33nuv66dsOrvc4hNYVC7vbrsgCSd7MBDDtfPwujbYX3RgUNueqa+d4QvqyIG+O8eH4
         Dh5Q==
X-Gm-Message-State: AGi0PuYB80DN6ZhA3VuyrRtqxyJC/PdF5tSCHF3WireqgdVWP23pOhoM
	5LvH/Lf212c1YQgqd65U1H5XwCX0nsx7lu3h59OSxZNV
X-Google-Smtp-Source: APiQypLkOqQ9TjV/vblGNrBRFtLDMzjAWdhQCpKa+dbgj0uMs/fRxbv1RCIh1RNbYcDXdaSUoQcEyFcgxkrqFR9DskU=
X-Received: by 2002:a02:5184:: with SMTP id s126mr6696346jaa.81.1588412398420;
 Sat, 02 May 2020 02:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200501113534.16030-1-schnitzeltony@gmail.com>
 <20200501113534.16030-2-schnitzeltony@gmail.com> <CAMKF1sqAMsnsTqMrn_EGnL8J5qYrzD6N2rdnJcPY_uNhmS8pfA@mail.gmail.com>
In-Reply-To: <CAMKF1sqAMsnsTqMrn_EGnL8J5qYrzD6N2rdnJcPY_uNhmS8pfA@mail.gmail.com>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Sat, 2 May 2020 11:39:46 +0200
Message-ID: <CALbNGRRB65WxnSv6UkVk=PodhyjM8ETJJq2xmVZwPhu852Ofsg@mail.gmail.com>
Subject: Re: [oe] [PATCH 02/10] file-roller: upgrade 3.32.4 -> 3.32.5
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, May 2, 2020 at 7:27 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> fails in fetch
>
> https://errors.yoctoproject.org/Errors/Details/409857/
Oops - and I thought I had built it - now got same - V2 is coming soon

Andreas
