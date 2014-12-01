Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9E37972435
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 15:27:13 +0000 (UTC)
Received: by mail-yk0-f179.google.com with SMTP id 19so4805607ykq.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 07:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=+sqX6WW05Qv7XHoSdOvOtEO9dGG7PT7+4SW/jHDdeVI=;
	b=YN7hmASGGTR5WJKR4BhAbVeApiT2zQI6PquiIDl+WMWt4EJSjESan5eQTxWgVL8ysj
	jLGmRVimfQi26Yc6vT2zVVJMKrEFSQTYea9dY7Wovxg6QI6LPAcDoCucAn45sWDz4Sx0
	/o61y8tKWlksyiQFBxHMbEXwIlHbEIPTZZh2tjy5i48VRjXgLphwjxdNjYN92Q2ivjtd
	b7Xhm/2t72IQaz8TC8ixP6FeViAD9MH+X9qmqEkzrdmwPws0y/SxhbpJXA4POEejVxUy
	FvgtHovFi9p9EYWHjESCK6x1r6ljFdLJYB9XSSYJ9eDk1mKsCc5Uj+PZAZSisNshUoOY
	bBwQ==
MIME-Version: 1.0
X-Received: by 10.170.47.210 with SMTP id 201mr68712595ykp.30.1417447633642;
	Mon, 01 Dec 2014 07:27:13 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Mon, 1 Dec 2014 07:27:13 -0800 (PST)
In-Reply-To: <9a0b3d2f7e1ac7e854430fe1e93271c71f574083.1414409458.git.anders@chargestorm.se>
References: <cover.1414409458.git.anders@chargestorm.se>
	<9a0b3d2f7e1ac7e854430fe1e93271c71f574083.1414409458.git.anders@chargestorm.se>
Date: Mon, 1 Dec 2014 13:27:13 -0200
X-Google-Sender-Auth: CQqkKiaZzDYxMHe65wFwi6aPgdQ
Message-ID: <CAP9ODKq6Un6sHUQH0iPagHx-PUrY8d7FwsOh7D3uCkX2fWkSKA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [meta-qt5][PATCH 1/1] qmake5: set OE_QMAKE_INCDIR_QT
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
X-List-Received-Date: Mon, 01 Dec 2014 15:27:13 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 27, 2014 at 9:31 AM, Anders Darander <anders@chargestorm.se> wrote:
> This is set when generation an SDK, and thus would be usefull to have also
> when bitbaking. That allows us to use this in *.prf files which is used
> both when bitbaking as well as when using the SDK.
>
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> (cherry picked from commit 96e8d29fdbdf6fa656c854d9b55c5b0c213166a7)

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

