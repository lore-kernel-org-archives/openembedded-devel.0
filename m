Return-Path: <f.forstmayr@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 162846FFC8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 06:27:39 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id w7-v6so11466776wrn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 May 2018 23:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Z50VyT9X1LyXRpgb7vcW2lQbaPOanIXLu3bZAmC/mUo=;
	b=EBN0RUMO79s1Kk/EVxio3Xprg195T17VjwkymSkMrxBV9eei0AgFTUJoXz5PJRT7cT
	GYwdBAhVZPf2lkRCfrd9K0aq14zMUzlhnZCQ7PCiKW+qTVb9JvIefAKf24mAxYlcbwg8
	W43jfNEEi2SVoXRZhnZjtb4miQHOwaxniHphHFOJciWpaj8DjUWto3EfSLAo079meJZf
	YrmHYi7MhuA5ByUNDLhIq8IAyJQLI6Y0prSv7kduuDplNBuzjjtb4peHD8fg4lrxTsQY
	/ZRNC9ZK7qqZ59OIRqK5aH1oSnKXmt3RcmXLUZvwQ7eD5nh3w+rk4b9KAXhzKIszz7yF
	uTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Z50VyT9X1LyXRpgb7vcW2lQbaPOanIXLu3bZAmC/mUo=;
	b=Gc0gm//fu6RbjO3n48Cc1AtlcGOHmgbjZ1/+Pgf8B9iN37f4FOPTl2je/i35+/hZTy
	j8Cirp2t825kMe/xmTqQIZrT3sANx30DJobhm74xpqDhxv6t5IMNBxalFT8t/Pn5c0R5
	DaypSe4XFoIcSylhKXDHyli/tNab+KVsqal/6I6aIiABPKBSHWN+Uo/pRUWj6cmw0gEP
	bo03+NvFDVOfr21O9H1SEFeYeEZUCWcBp3O8D4eUUTX1tp3nzGkFJcuTQ9z4HmzVdred
	TlnD6+vwGmruQMYv9N7VZ8LMsodpARYne2etbYWl4ll2jLSSkqsNK1uauDrjPjwyRYkQ
	F7zQ==
X-Gm-Message-State: ALKqPwfiIa9YX44LCBCy+0xzrsbgz1AiyEN0z4Qgw9wPU2kOQsiZnETG
	oyNZ+8QsTtFhD2d+GcWYG11ZJ77vCLVqtpyx/fEPNw==
X-Google-Smtp-Source: ADUXVKLiI1ltE/GhHN+BuIDA0o0GpCliJbsCBXoNZTxFpWhIqg+JIsVik4Dt6CYjtklEy1DUBH2lQzxeB7fb8+Pjdqk=
X-Received: by 2002:a19:178d:: with SMTP id 13-v6mr8385740lfx.22.1527575260207;
	Mon, 28 May 2018 23:27:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:f509:0:0:0:0:0 with HTTP; Mon, 28 May 2018 23:27:39
	-0700 (PDT)
From: Franz Forstmayr <f.forstmayr@gmail.com>
Date: Tue, 29 May 2018 08:27:39 +0200
Message-ID: <CAGKTrWL29mq4rugJ0zn4oN7__jqJDTii=XcEoZgmj8YvRF0E8Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python] Added python modules periphery and Flask-Sijax
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
X-List-Received-Date: Tue, 29 May 2018 06:27:40 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,
I created a pull request on Github where i added recipes for python
modules periphery and Flask-Sijax.
https://github.com/openembedded/meta-openembedded/pull/80

Can someone check, if everything is ok?

Thank you
Franz

