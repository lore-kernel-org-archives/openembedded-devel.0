Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
	[209.85.167.171])
	by mail.openembedded.org (Postfix) with ESMTP id E94D0600BB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2018 20:54:20 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id u74-v6so6549484oia.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2018 13:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6OqnollnCDTlCiXAF5+O/bXHwbAtAAsX9H5ERmdZl+g=;
	b=hMREi06jpiHijL7kVX/3DLgK3iuM4c7MLu3QL2fYRuo3cGSJeFXjt9+Rn3KxYV0a8Z
	mt7vioXOO1mYz9JcxVFuinR64eYxZsTEY/yb1fiUzPwZxvMBZYga+gBrc03c6pedN+TC
	qn2bYPVOD59PE8sPfToDXlasDvxAmuHiVk7GQB6Giagdj8mp7UUgz62C/ClQqVVeCsHf
	AtzXjCMKNRbl5BIUB7UwttF8V/Zo2XHEyeCRsPwLOueL0OM0Eo4NvQJoopkVmPLPqSDr
	ZhYiv0YGHGsvHKBN8vVd/5YH0ki0WsmiMi95pj0/Xa0gUP8j68Mj5alSa8THIcEoRUMr
	UDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6OqnollnCDTlCiXAF5+O/bXHwbAtAAsX9H5ERmdZl+g=;
	b=ButRp1heuhDrY9T0/CQlDjB+Di0O+5trydNe1DJj7EeUlze8k+n4PxMAgdHl3lfR8r
	mKwlNg/6A5NZbbWraA7M4cXrQfKSYWA0dyT5u0A7g95E6yvVGrNvAigVoEOwarK6NoOn
	YQjjaJZQG62x+zrJvub306/kvIlKLS4cuWGXXI8Rqx0LIyrbccffeKogJWwy0+wKPXls
	fK/KUKVn4wgOA2YtWMWXF+wvQfyL4w3dMPUJDNlVQ6/kMf3A0vmyAphHOQSuQNgIzKUF
	mW0xxWMK4EKugMpCk27EEjctRrCtC7Ix58GBIPpcMyH0kwdjtrYiVJwKV+jvsBTvj25O
	FDlg==
X-Gm-Message-State: ABuFfoimnORDz6OG0rZoK6cq1Xi/htePNNg6IfdeNuaWfLxv5H891kTj
	dqBnXsKM7A8e0R97UW/at1zR8XxulpvNNO/DJck=
X-Google-Smtp-Source: ACcGV62j5vfZXcTOYe2ShmGispXVuo/2BRZFM38e6aLHbzujsALZ18RC3jNMxXu9RzzBgIMQg8jty6k8Kgq+o5rDTIE=
X-Received: by 2002:aca:2112:: with SMTP id 18-v6mr184386oiz.368.1538168061923;
	Fri, 28 Sep 2018 13:54:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:684a:0:0:0:0:0 with HTTP; Fri, 28 Sep 2018 13:54:21
	-0700 (PDT)
In-Reply-To: <3e6aade1-e371-07b3-dd56-13a5d887ece3@gmail.com>
References: <5bae4634.1c69fb81.9e934.4f05@mx.google.com>
	<CALbNGRRzTMgObShEYvhePn2gCSA7CmgiZ3wCEpcov6ssnJLJgw@mail.gmail.com>
	<3e6aade1-e371-07b3-dd56-13a5d887ece3@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 28 Sep 2018 22:54:21 +0200
Message-ID: <CALbNGRSYKMYc-YSM8gc08Xu+2+b4iAgmn3DASRWFACRkujjo4g@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-oe sumo-next pull reatest
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2018 20:54:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 28, 2018 at 7:56 PM, akuster808 <akuster808@gmail.com> wrote:
>>>       poppler: Update to 0.64
>> ^ Why this update in stable release?
>
> It fixes the build issue sumo has had since it released.
Was not aware. I update recipes of my interest in my working  branches
so it did not catch me.

Thanks

Andreas

