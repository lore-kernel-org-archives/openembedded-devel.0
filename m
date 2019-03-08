Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id B4B707CB8A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 14:02:26 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id z84so12509050wmg.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Mar 2019 06:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ahtAz+pyeWuKipmwg7gT5rpNLnoIMhSz7IyKk4Y0hgc=;
	b=U4nRXXwr4dkDZHS0maBGsg/Ze/9+bLBfdkBgVXd1kTD9/FIZgTqhz12wl5t78E8lSt
	DbyWDO1vCouw1TxAVSIMGUkNOIuvocgXQe7/SMqy+HwVx9UXffpFljQGHQXzxTCYVCOK
	pxn4rbZkl7w48g6dYq7ALIiW/A9j+D7gLr9un4a+MbTnr9S6ueFaaV0p8sDLOnPAipNt
	43Sf31QFcZ+dtvS4Nh6gmxKLazbfNkXjbsQatVM7VnET5hNq7QsDBqtWByw/9UMgwyOB
	oqY+RaUAY/h489RzcMvoUwSSWmuZWtb2Qx6ahL0W5HHWPoB4ctjsQlg/kWTalIwSbdVE
	1/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ahtAz+pyeWuKipmwg7gT5rpNLnoIMhSz7IyKk4Y0hgc=;
	b=IYdmIpbiNAHM4T4cuwEhi26PdZtdX2vwFjkTU+jMZRJL+R7yMLeAo+pRRLUAL1K1uq
	SK5KDezYL9nNXO3hF7V+L+EMcWdqbkG4OE5mbdDw30Vy/O/Ppf5OOJSctwNpCgl+Yt2Q
	ysI+8nAdU8MenLLI6aWAIp8NWz6+mTt6xFLktJkaDCdzaiXbUNlIrJ3JUpUXJDzkJxG+
	aYBOVxomZPP94vJWNBkB/wU1dyLvaMVmWUGvGpo/STVdLJr0iVUoQYzA+/V5i32CQq6a
	0xc+Jy+Q/9jie3Ik00MwngUFKqywRNVnpIxUj7dTlJLK0W5Qbfut7FKkMUqEV0GL5UiL
	DdQA==
X-Gm-Message-State: APjAAAXdWPellFkqGXyhxh7lvjVxsPkrXEJNruu4d5L9BCDrSIviyeKP
	rpwyi6MewL/cR8s9kdJM2hgm5n0/mPdL6xH5sFfYVg==
X-Google-Smtp-Source: APXvYqwZA06uuqB6GoGLapwyNLC4MyTCt07Larb0eznRrCFyLtEWnn5Nf6bQ7sUCcs8LGnoQkDMVybjwqH6QGWHvkms=
X-Received: by 2002:a1c:4946:: with SMTP id w67mr8780946wma.20.1552053747187; 
	Fri, 08 Mar 2019 06:02:27 -0800 (PST)
MIME-Version: 1.0
References: <trinity-c0b64e17-7878-4cf2-b46c-881a1b38055e-1552051786391@3c-app-webde-bs44>
In-Reply-To: <trinity-c0b64e17-7878-4cf2-b46c-881a1b38055e-1552051786391@3c-app-webde-bs44>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 8 Mar 2019 15:02:17 +0100
Message-ID: <CA+chaQePK29qJaYxfkkaYTs4S5z+i=bdFQSe8npP0f6HY=3Y-Q@mail.gmail.com>
To: JK.Behnke@web.de
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-qt5 - support for QT 5.12.1?
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
X-List-Received-Date: Fri, 08 Mar 2019 14:02:27 -0000
Content-Type: text/plain; charset="UTF-8"

not yet

On Fri, Mar 8, 2019 at 2:34 PM <JK.Behnke@web.de> wrote:

>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

