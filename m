Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9812C7D5B9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2019 11:22:17 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id u8so46863583iom.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2019 04:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=aL/VX/KWdj72RHiwy/T5oH27bHoHXoEylRFWzIeT21s=;
	b=ubF5r+Z5qIXLpyZbQ1g0cGGvBea0xcbKzyQmYnp3SMdNJtuCPDVxDDD0VyLD7xt0Ll
	d8S5mQ4mF3tuD3CNDGX1poc0fAtWkALr2gIxMHGDwxlsWUrr/5jN+S5y+OgNVTXgobWA
	7NWOwAvaLwkF72zTKlIcM6RCTwMLX5zIL8i6Xki/3ABUYWxXgvRjXRZwdmGsLqjb1zd5
	SU9lFLHjYb92PR3ok03ZvcbbbSp78Z85TwvGzBucWHzZtIkVDUjct98yEFO5P+8zmmBD
	x3DmU6Qmgw5AkkqvzJfBhcUD8t/qBnxi18I8Gc7BZ2nKxjgpGUN9jjJMA1hDcnWRzzjR
	hhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=aL/VX/KWdj72RHiwy/T5oH27bHoHXoEylRFWzIeT21s=;
	b=kw4Sq8DrVbYLkUg5gIhkN/xRToSoDVozDS6eLN9A47e+HVDnbNNMVjOArVjnStD4PX
	ejHkgrNf1XbjiJR8BrxrnM/oOwnf9WsSvsgHYlnQfz5dRbU/h/lKad5R3bUHgCcOqvgF
	GJK5MDDQ8JAk+Pb5uFGrzWnGm3OaJQoy47kcgu6JtoyFkb90/znUOKefGdcgHpFOKEZU
	OQHN9EfdphTaEVBOdz/QfoP3Hjj3BTOki6ZoyT9Y8PcZQhmSaqia1GcPbspvJx3Nh6po
	buxSdPLbzQfUJk7gDs1vNjDakIx/2vlZUEgBTbIm9GQeEEV74moZHNE+iFhMuTeckIvP
	A1PA==
X-Gm-Message-State: APjAAAXFVTgTOOItD1QjzKUhrWAo34lusOlj0Vf1jHNAIVLSPMa74wwo
	joX9RHBg5WYCWbZHnhqXqwekEkigz5iiX4aZOGk28mFS
X-Google-Smtp-Source: APXvYqwhPOru+KkHCa7z4ah0mk/8ormtuprezQfT9C89ZLsmH9EvD0AX9s1YhhQVeL7j9jtWEcrbsO/CJsYJOGgWLO4=
X-Received: by 2002:a05:6638:73d:: with SMTP id
	j29mr24497510jad.21.1569928938392; 
	Tue, 01 Oct 2019 04:22:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP;
	Tue, 1 Oct 2019 04:22:17 -0700 (PDT)
From: JH <jupiter.hce@gmail.com>
Date: Tue, 1 Oct 2019 21:22:17 +1000
Message-ID: <CAA=hcWTEWCO=5CvTR8idSAGq=1LQgFpZxTSE3da8M4YgmLzpPA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Kernel 5.3 fails to compile No rules to make zImage
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
X-List-Received-Date: Tue, 01 Oct 2019 11:22:17 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I am building kernel 5.3 on imx6 but failed in do_compile, is anyone
able to compile kernel 5.3?

Thank you.

Kind regards.

-jh

