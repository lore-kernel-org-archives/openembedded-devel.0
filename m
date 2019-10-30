Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9389B6C1C3
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 10:49:06 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id t26so2548554qtr.5
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 03:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uZOmqV4rW1R/v8yV1mq1fCkzvgcO9Lhr9zpkCyVExgU=;
	b=OT/ZjDizQxbYqtsGx8iaucs+HrTTEGHfjH5dAu0ExDBa5pUHXmMGxsjPdIJl/Le9SL
	7GXXrBo5PklkX7fIswUk9DmOoBIaMMYikxZgkBFjrZfMRmrWpsAzyVXllMhmVc8pAF6J
	/lONcX+USoNFaTMVaPvDFShgdnIxhBKHZCFbxReXDwp4gy5/PM3rI9zMOhqu6mFsLjBg
	ZUjwygl8jeHdvHOwOSpyQ+QWq+jw4tRJhz0rFrd7Wzzxz3d97bGEJjteifaTWy1T/IGH
	FCdweHo8WTdUYh5nAeaI6f6YZ98xQO3q03R1qPZF7CVPKKiaIxEv4lUEMNCTftO5uhZF
	L4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uZOmqV4rW1R/v8yV1mq1fCkzvgcO9Lhr9zpkCyVExgU=;
	b=ZIXkODDxw+4tZHGd8jJde5hkuvxrsqh7kg33p0hdI2dZDzwLqiotjqdxRsM+cwQwri
	F/QebooRiY8gaqNl+POuQGuIwQ+Qb62CkKbVaO4IyHhmw+uQqavY8cDBWpYZrCJpPQBd
	H3FoTHzbl4jF1V7lqt3Y2KisfJECnWj8I5X4W3l+ZhKL/y6GaPjNjeG69dTR06ikHb81
	XWLojvpHxcoHRi9rWYO1uNTcHCttmhqWm6rbYu12FhVDxwWUdaxzd8C+yxnz/4Mj//V6
	PGxRyNr4OIKl7dGr/sJf1wa8zdu6bSQuktAI+EFxluj6E8u+fKMl8FHMWwGVCvP5bAaz
	bD9A==
X-Gm-Message-State: APjAAAUtygAZ9uvuq5kybsQhkPtsb9ILyS0Kk8c6ZEf/mUqrJ86+WgAw
	x0WcZfnYM5kfHg7m8V1OXZUuMpEc6GsS14pMW8w=
X-Google-Smtp-Source: APXvYqwqnA5JJUmVrCfVupt/gnkpW3K3VI7dqFFtbL8ECFRiiCB34yTkz+Zs2PvDXi13sPUFBLVUxJ/qijYL8ymOsk4=
X-Received: by 2002:aed:2724:: with SMTP id n33mr4116971qtd.194.1572432547123; 
	Wed, 30 Oct 2019 03:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1srmXmw+HPsDvzcTRovE36OfcGsXW9vXmJ_WbMV8Zv2rxg@mail.gmail.com>
	<a1be52fa-3f61-549a-51c9-59eed525f1e0@gmail.com>
In-Reply-To: <a1be52fa-3f61-549a-51c9-59eed525f1e0@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Oct 2019 11:48:55 +0100
Message-ID: <CAMKF1soH1vXNCrw9e38U6Mmwo25kXwwFVO88hx8pXOYFPSwYaQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: Seeking volunteers for zeus release maintainer for meta-openembedded layers
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
X-List-Received-Date: Wed, 30 Oct 2019 10:49:06 -0000
Content-Type: text/plain; charset="UTF-8"

Awesome, thanks!

On Wed, Oct 30, 2019 at 6:32 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 10/26/19 10:42 AM, Khem Raj wrote:
> > Hi All
> >
> > We have branched out zeus/yocto-3.0 branch for all meta-openembedded
> > layers and currently
> > looking for some volunteers to chime in and help with maintaining zeus
> branch.
>
> Well since you bought me a beer, I will through my hat in again.  Ill
> send out  a README patch later.
>
> - armin
> >
> > Thanks
> > -Khem
>
>

