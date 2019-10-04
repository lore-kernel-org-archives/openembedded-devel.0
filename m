Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id E89557DB51
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 09:18:19 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id q64so5716179ljb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2019 02:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=NoeoFdwxfihOe91O7rbhDqGg1i5Z7J0WkKEUGTov73Q=;
	b=BZLRwzIwrS1rrQzJO29GTXVnVXSToG1lG4PnkQtj8I+QIituMgdV6L7H6Pb9DQJ57K
	3qqQ8PDrX0IaQOAEJTljSr1Kwj5mbFTuyq50LF/X3L0kREm/zUccLW4EwFf/IRf4fYcH
	FZOPhybnKOSnAMlwEzVT8H0H+blBA4IaLrnlait/YiZfUShaCd6r2DHPQs7srsIoOdiC
	UHcrFME1haOi6z8a+bdVbx2FUpZD7vvD+8jUwGr4zQ/xJyo8oi1DH5zXymmMT8NhKh7J
	hhAKb8sC00G9/rgrX9FCzLOcE1HbZ5fQ690YyFrCmaPbB2fcMBlcF+iARqP2gI1ml12E
	vA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=NoeoFdwxfihOe91O7rbhDqGg1i5Z7J0WkKEUGTov73Q=;
	b=SMt6U4XrtBXZHP+0JKEIV56jV+gGyDwBK0f1iDlF9zMAyCYuRvEKMtKBGXwlrNYuOy
	t5/pzccao4etI+C5IheCH18m9WNlosMD6GaZot0/LXtjvI+zSyR8rdD1eUtfypDtsIoN
	wWbDlmIako0y7P3LZ7UP5TGM2/2ne7P+W1HZuchldX/WyQ8NSFXfYX0p8q5bN3YUb1Wy
	wtho43A4vPFiC0eDFa7/C5ucROyZWmzl1lNASQfU3xE0oSBRr7PbmJCI15rb1KI4eYpZ
	bMYws9cXA+qXjfM+7lBiEM7PWmzL03L0JGzx/EnTvSQYPvP8GoDApUpA2LZ6+fx/K7K2
	MCCQ==
X-Gm-Message-State: APjAAAWuGYO+OCbzvgNZvG9x81i0MCORFaeauivBPihqFbxYU7j8je32
	Nn+xfNhk4lmDZCmzLPM+Ez81PC7BDZcrcoLAkXFxrg==
X-Google-Smtp-Source: APXvYqywrcp88+JfL4A9LnwweXS/oG+Rki5v5cH3EM275FatX7mL/HdJ6luxZho1gCW7WTx1AV+2k5aM2X8/H58Gd5U=
X-Received: by 2002:a2e:5b9a:: with SMTP id m26mr5409897lje.90.1570180700298; 
	Fri, 04 Oct 2019 02:18:20 -0700 (PDT)
MIME-Version: 1.0
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 4 Oct 2019 11:18:09 +0200
Message-ID: <CAP71Wjz5v_vkc4pMo2tyZ7GrH=YoXrgvrw+Nsq2Dtm95XQweFg@mail.gmail.com>
To: Yocto list discussion <yocto@yoctoproject.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: "Volosincu, Andreea S" <andreea.volosincu@windriver.com>
Subject: Demos for the Yocto Project booth at ELCE in Lyon
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
X-List-Received-Date: Fri, 04 Oct 2019 09:18:20 -0000
Content-Type: text/plain; charset="UTF-8"

Dear all,

As usual, the Yocto Project will have a booth at the ELCE conference
in Lyon later this month. While the booth is a great opportunity for
everyone to get a new sticker of your favorite project ;-) we are also
very excited when developers from our community get a chance to show
off the fun and cool things they build thanks to the Yocto Project!

If you want to bring any of your cool demo on the YP booth, please
reply to Andreea (cc'd) and I so that we can plan and discuss any of
the logistics!

Also, don't forget that right after ELCE we are having our first Yocto
Project Summit, with a very exciting schedule and great set of
speakers. If you haven't done so already, please check out:

https://www.yoctoproject.org/yocto-project-summit-2019/

cheers
nico

