Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.10951.1610835870786497578
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Jan 2021 14:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m2+xSWLA;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id z21so8509316pgj.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Jan 2021 14:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5UClXXWqkdr+fJFbPwJaQqDSPPs/JwcMjXpa3F1YedY=;
        b=m2+xSWLABt7pmOfrtIdRh//AXNjsbLVqpFqmrnv103kxCIj5c8CkTnoRrDyqYLPUhP
         EKfV4yZKEZOcOpfK/RRSzmqOd3JMgcYuQMSoeCK3B7PFbLc2wBL+Mg1WLa7hnZkKHB5C
         8TszZvcN0eucbMHAqLlCx770ivYCxvSMO9ypDHdrQlyhC4qGCutqPd4F1Bv+86JOpAew
         o4sTfVU0lOG+xn9BSCCYo9GPEX4bZzMldzpknqh2iWe1yjLBGFApf+2DiBsi+b2wlD2G
         1v35PdqfP+RPloU/W7sdhtphI7QSwUhTKdLtJjrjbyvO1LTGXs3+DIYqokLSWeSt1b51
         XiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5UClXXWqkdr+fJFbPwJaQqDSPPs/JwcMjXpa3F1YedY=;
        b=t7noAIRf1Qqm8GoEE8Ic9a2IU5TbOZfIuHzoRvKw2RCWpM/HpktVcorSu7GWBo8r/j
         5W/fMXme5d4N9ZWD+cVscUJrqWJPeBS0N9mo1Y7MCrt4jT16XhpXl1bvYe4y2Hq5MbRj
         G9z1uwuphaKi6ENfd++fDSM/fd1Na7dxTzfY396MaruizRbtKb+/KisLxJVbn9pyeR1l
         CuEDFgXA0sQpkA/3rsS0Ndk51rljCO7iUXbl5hhFPK4SGcVV8+g4qjYVA8CA0vzBnuwz
         iV23VTh22f60rxW91sdqzt9lS+xcVKYeXDRQ21b9+SgYrlaHf2iYmzUTVZzqGoIy56HU
         5b2A==
X-Gm-Message-State: AOAM533/uhZ3zXufKnQifKalUtANMQ6g5w3E6u1SIs6najtuyrpA5LQX
	O4lKYqRt3Tr7yLkjojTX51wOnN1BrTlovsvTdkY=
X-Google-Smtp-Source: ABdhPJxivnxL1Je33b7eCzCcrAmApWE7dJB249UX5Ak7ACBT76fRnQG4O5TAoLfawGoBG8fa0nKFxNilStMAbolYaY0=
X-Received: by 2002:a63:fd01:: with SMTP id d1mr19033215pgh.319.1610835870357;
 Sat, 16 Jan 2021 14:24:30 -0800 (PST)
MIME-Version: 1.0
References: <20210114021010.18900-1-kai.kang@windriver.com>
In-Reply-To: <20210114021010.18900-1-kai.kang@windriver.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sat, 16 Jan 2021 23:24:18 +0100
Message-ID: <CALbNGRSgp4ecK37Bw27EvERSHd8jnXQ2mGHvLM-d3qN0jwr1HQ@mail.gmail.com>
Subject: Re: [meta-xfce][PATCH] xfce4-panel-profiles: fix do install failure with dash
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 14, 2021 at 3:10 AM <kai.kang@windriver.com> wrote:
> +Upstream-Status: Pending [No permission to folk repo and create pull request]
see https://gitlab.xfce.org/apps/xfce4-panel-profiles/-/merge_requests/14

Cheers

Andreas
