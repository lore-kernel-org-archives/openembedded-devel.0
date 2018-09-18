Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5515760269
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 13:29:32 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id 203-v6so1752523ljj.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 06:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=W5aHY7xcUmpt8TzP2LFQWsgPTxzVI5ff21ZprLVu5Es=;
	b=MZlelhxIRjBIO1MqT8pNBZ/1fsd3+uDFKoBmYYcWbLxv5avdSkjzM9PXzpc5zKLkuM
	HekufH1PGwi4UYcfJSpYHeEVT92vNgHWFzNZR+q7Kmm/Itdzf0eHI3mx9BFODcNUvkJP
	rxcZj6MA/WE+ojXwKQD+IIRGcblQrqVDottGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=W5aHY7xcUmpt8TzP2LFQWsgPTxzVI5ff21ZprLVu5Es=;
	b=MQGQIbz33LUkoYwWwl+VLK918/YRS1XdLP45qyVzH5cp6tX8RowNnig7k70rFd9Y4v
	slNBqPVQxXkEmMqYJKrwoSkLcMHG2rWd+d4jxgeC7XQupOtEQIsvJO8WHu+A8qsR3v9s
	5hsDk06siost1MLvFg+OrTz4w6IEvjPc6TnmccTQ18plfP3CJrEkDi/sfR1vTQOK20Aa
	1mQfQNJnJKjaCljg6vlb3AW4AE6/C5JMPvR8vzaocbU0MkX2nJkrU9Oa05oSfQwNpHjt
	FlNQUccdQh9jTYyaJ7pK9YX3RINpEYjl66tA82MWbcxZVP4N0yfDEqj3vZzn4hZQO7J7
	XQMA==
X-Gm-Message-State: APzg51BzZBDOvFWkrN4DmZIXiNEh7CPHav30uZY5alqMkW7Jlu3migHC
	QrFzzo5AiC2jlEoEckmom0Ch9/N7LuHNT3F2HLPu4Q==
X-Google-Smtp-Source: ANB0VdaWU6LvbK8zAv9eg9FGMs72Q6eOOD3luy+6dxdIXOImGfGUsS1KPMQ5iOUYvzLZCmLnyI7yjitCV8GqiwWV38M=
X-Received: by 2002:a2e:9198:: with SMTP id
	f24-v6mr17862528ljg.64.1537277372543; 
	Tue, 18 Sep 2018 06:29:32 -0700 (PDT)
MIME-Version: 1.0
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 18 Sep 2018 15:29:21 +0200
Message-ID: <CAP71WjzxZy4AXfRnMT6Jt6Tf18RfA6goy6qi9E6N5eR_AGM1eg@mail.gmail.com>
To: Yocto list discussion <yocto@yoctoproject.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Demos for the Yocto Project booth at ELCE in Edinburgh
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
X-List-Received-Date: Tue, 18 Sep 2018 13:29:32 -0000
Content-Type: text/plain; charset="UTF-8"

Dear all,

As usual, the Yocto Project will have a booth at the ELCE conference
in Edinburgh next month. While the booth is a great opportunity for
everyone to get a new sticker of your favorite project ;-) we are also
very excited when developers from our community get a chance to show
off the fun and cool things they build thanks to the Yocto Project!

If you want to bring any of your cool demo on the YP booth, please
send me an email so that we can plan and discuss any of the logistics!

Also, don't forget the YP Dev Day Europe, which is right after ELCE,
in Edinburgh, more information can be found here:
https://www.yoctoproject.org/yocto-project-dev-day-europe-2018/

cheers
nico

