Return-Path: <piyush.mohabansi@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id CEB1460616
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jul 2016 11:00:49 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id m127so200090538vkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jul 2016 04:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=YU8m+0CSfn3C0Dv45LmxfFYsPa/U56TgD3ptz2aLcck=;
	b=bJOOorGFJMvIWEcqTJUDFLGsI60f0op4Xaddk1x1b72jObHleDjy7CZ8Fh0+orpFAX
	aGX6Q9kt/ikdAwajV/lW1qcj5vDj7drXVPgzNYvJl+LAv++nEhJ5A0QTYF79+f1kukpb
	1IQrc6z15vdKWsVKP5bQXTeGdnRhRqjX41f//TEQJl7B58Zr5O55AEuh0q+A8MIeLxRc
	QXhj3BH3CB2jToiC+9+P13gYB5AESkIdIXabFAf0wltryrQhcZV3mxpANBPzLjgjhT7M
	3CpwrkQeFnEBMKKL0MKb29L4p8gc0wvDDZ2HohuNyAOm4XpqmEEDzGWWNjwepwEyaX59
	ULVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=YU8m+0CSfn3C0Dv45LmxfFYsPa/U56TgD3ptz2aLcck=;
	b=dMbBUOZsWBa3xAGiis6h2YTDpe/0S7qF5v0WZEL+h9D2W/VFEUHPiURnAZlqBrjgFo
	PTIM8KJl2+2JTNM7hazNp9moKY4pQuHSdmxelhEjCPU2gYJLjDTgULffjQ/QWBjmY3Kw
	hxh2XN+lk3p01DI2kOMh4bmk+zJBngHmZ1RAqdA3yWSFO8YzxOcWsKPaMVv4nJfXEJ2Z
	X0gDzDlEoPnin+7c5zUOTQdsdW/QVErw6OJopLXaMy8BkTIYZOGeabB/5D6DpFyh4UWW
	XuN6Fn08zs2m5FTgBr5U4JP+hhEF0g20Y91DvG02lmdioJxrtVLiSV/fog5UibTuHoyz
	fqNg==
X-Gm-Message-State: ALyK8tLKjCZCI54Smq3fWYtagwuwRrGTjRycGo+knO1RCFTchATmxiRWh8Ok5jo0gw5kiGgqUly8RygjvfesRw==
MIME-Version: 1.0
X-Received: by 10.31.63.67 with SMTP id m64mr1371389vka.150.1467716449629;
	Tue, 05 Jul 2016 04:00:49 -0700 (PDT)
Received: by 10.103.71.1 with HTTP; Tue, 5 Jul 2016 04:00:49 -0700 (PDT)
Date: Tue, 5 Jul 2016 07:00:49 -0400
Message-ID: <CA+1cOABoTBGLSVkMV5eWTxgfTQOgyqRYb32VVEyp9NxLUvXu9Q@mail.gmail.com>
From: Piyush Mohabansi <piyush.mohabansi@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] how to enable WebGL or Canvas3D
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
X-List-Received-Date: Tue, 05 Jul 2016 11:00:50 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Need help in enabling the webgl or canvas3D support.

Thank you!!!

Kind regards,
Piyush

