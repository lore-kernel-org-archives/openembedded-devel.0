Return-Path: <zoltan.kuscsik@linaro.org>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6101D73CBD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Oct 2015 11:31:20 +0000 (UTC)
Received: by iofl186 with SMTP id l186so6237474iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Oct 2015 04:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=D/VT7SX9J//5JacwbJgHfIAY7h2PpcOrA77ie+eHQ4A=;
	b=Dky0qxD+qxCwshfnFlq7PAQ7WVv3BF7DTJV5QViDB8/leligverfved8aqzDtUCfPU
	TjBxsoEmwRvxqRHFTRwh+Bd8hjfiTKnVv6fgaezqIoF9/3TBnyLQV0rhmi3655yAmFAh
	y8BPTHLb4XExg+YEkO7wpyMnV4nZnqbvbCIGVPhGh+iqBwN6RO63yY49b+qf43WrVyUi
	FNP0XEhUXI3WpOr0yetDbZ55lfFe0OTiZj0xyySV54D9Y2wbUbuRnf3PYubCff8krpGS
	ErpQTzFF0aotcz4OABYuRpRFT+GSmTnmd5l5brzJTDE780MSSrETAs2f/w6g6XgxGKLG
	KMZg==
X-Gm-Message-State: ALoCoQlt88FGvOdaTB0tCb4ny1lrQfXKhyPfhIkKgn0GS3bADYwkysLL99w+kIyOzxR5eEtqZlM+
X-Received: by 10.107.31.135 with SMTP id f129mr16983966iof.8.1444390280500;
	Fri, 09 Oct 2015 04:31:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.76.9 with HTTP; Fri, 9 Oct 2015 04:31:01 -0700 (PDT)
From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
Date: Fri, 9 Oct 2015 13:31:01 +0200
Message-ID: <CAAzKXnjdUYmLrXX4bCT9wmcH9nc3c1OL7eRsdTXXD-T70RDZmA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-browser] Recipes draft for Chromium V45 and V47
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Oct 2015 11:31:23 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'm working on updating the Chromium recipes to version 45.

So far it is tested on Wayland builds (ARM 32bit and ARM 64bit):

https://github.com/linaro-home/meta-browser

It still needs some cleanup before upstream, comments are welcome.
Br,

Zoltan

-- 
Zoltan Kuscsik

Senior Software Developer, Linaro Digital Home Group
email: zoltan.kuscsik@linaro.org
IRC: zoli_ on irc.linaro.org

