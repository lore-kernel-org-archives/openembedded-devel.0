Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web09.3520.1616032646952291805
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 18:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n8TFPvZk;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id a11so2991491qto.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Mar 2021 18:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Ckq8zL0Mbl1BD7CbNBRUHOZ+EdRmoJG75Vpscxka0/U=;
        b=n8TFPvZk8O7O7LhQ7stnsHiS9vlFOVjN7tDh3SfHnI1dTyq3pOHEV1xMb7B15R7PHZ
         5Y5+51r5b7oj0UpO09+oB7bTj2Uf/BEIXodZ+Yz71XviooHNri/PrGXAtQ6D/UKx7eU2
         YgwZsYHDOS34Nd/yhtEhXtLw17asW4ZjIDyFHTwOpak+zshS6Rn2/3fRYtyG5hR2yAgU
         LIPSG4s3TlYGHq8Fp3+zE+qs0zqHAXQqKoRO2h+lS5VyJhQm4NQxdwYcnXkf+5suyZ1r
         LFc45w8zlroSChAVzqvmmJ0aIjloTpPwS2eC6IENiK/0WS/N6U8M8JxQL1CY/fFNMQHj
         M4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Ckq8zL0Mbl1BD7CbNBRUHOZ+EdRmoJG75Vpscxka0/U=;
        b=hxCN+EM9N5EMac39JZDmAOwjoBtgSqk6XGYMcew2i6vfj3tKJ/f4WVrD/XB+4BcBr0
         ftWlwg6jIwb+I+y5oBQPCXb1WgZ/BuTg5TomT5n/ItTj3+QOIFdHjWfKOU9eFznFDVcr
         SHa/NpgsGq7HdMSq/3YduVqm6anSQBoufzDVzsXeZlBx1Uv4Wu8es0bPsMf2a4OBAgcg
         8DN6ecLBcRgtlbOdla+5SWBOIt++8VY2nsABP367pfvpmOKnVhEMzGyuEdYxgOIN0q2L
         j1Trcga09DvPLJ7EKHbTBuKRueFeL8eZvG2VlUUN1mLfKI5i7a/My0UcwTzsNqCntN+9
         iq4A==
X-Gm-Message-State: AOAM532pNXlyNYg8MDz+aKjHoJmzbRpYytuPdciOB6orUbRFEvwYBi6c
	W7w3FAOXRrQ5jAilhbNlYDrT7/HXrzCSlRf5rnI=
X-Google-Smtp-Source: ABdhPJzbbP9dRW9d0mH5p6iBpuUhmsNSi8Krwug1pqdUIO3z4VL9LsdyLuz1/0idsRFbes7xjhL0ILsCEhRvttKnB8s=
X-Received: by 2002:ac8:6e85:: with SMTP id c5mr1706425qtv.299.1616032645931;
 Wed, 17 Mar 2021 18:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210318011858.dunybp2sgidoj76r@vctlabs.com>
In-Reply-To: <20210318011858.dunybp2sgidoj76r@vctlabs.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 17 Mar 2021 18:56:58 -0700
Message-ID: <CAMKF1srFGPC1fh1xdbc=5SFg3GxoP++ztvsipHJN4EAvchuO-w@mail.gmail.com>
Subject: Re: [oe] Patchwork service is wedged?
To: "S. Lockwood-Childs" <sjl@vctlabs.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 17, 2021 at 6:19 PM S. Lockwood-Childs <sjl@vctlabs.com> wrote:
>
> I can't find anything more recent than early feb on patchwork; is there a known
> issue with the patchwork server?
>

yes it is not functional at present. It needs a major overhaul which
is under works, I don't have
any ETA but perhaps Michael has.

> https://patches.openembedded.org/project/oe/series/?ordering=-last_updated
>



> 
>
