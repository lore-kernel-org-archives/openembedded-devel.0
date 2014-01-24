Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 54364600AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2014 02:05:53 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id wn1so2974218obc.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 18:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=ia9Ii7C7dMMB1A9rl6zPN/sGZP1CEQrZqXpN0brRF+s=;
	b=n+zp4P4cO3PlzD6ux92ei+gpH1E52MnB4zovgT6bR9/8cY0ULe2iZYTVzIbhAO+RWU
	cvOotcpEnAJVCKc9EU8AVWwK3RITc/+2oEmBheC99CJ+Pe9JnZ8yFZZWG+fhUZP7yWFd
	OnOJDrOEt5KiM4EiLVOxOQcUqVtcoXhYIHU+L2DoXUaiUtyJkdTfiEQVSEuVDHhzm5yN
	7CLqElQZ7fTqTWWGDeDZw6HwKijIi/6auxlJkDexRJzuFDCVuFHD59B+AVWUloLFprpI
	u3PytgxQLliGMAZV5AM3jVuZgatHsdgGAm3X7mVj2Q82H13cpCdrhzNY2WBEPB5v4KBU
	b8ew==
MIME-Version: 1.0
X-Received: by 10.60.159.133 with SMTP id xc5mr554132oeb.37.1390529154327;
	Thu, 23 Jan 2014 18:05:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 23 Jan 2014 18:05:54 -0800 (PST)
In-Reply-To: <1390492533-56999-1-git-send-email-javier.viguera@digi.com>
References: <1390492533-56999-1-git-send-email-javier.viguera@digi.com>
Date: Fri, 24 Jan 2014 00:05:54 -0200
X-Google-Sender-Auth: wVEAAsJRltO5Q5AccmRg2uDAHu0
Message-ID: <CAP9ODKozMozNUZ_LDvrYAN+yLNQ1Weuxaw_WE000Z4A041Gk0w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][master/dora][PATCH] networkmanager: fix incorrect configure option
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
X-List-Received-Date: Fri, 24 Jan 2014 02:05:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 23, 2014 at 1:55 PM, Javier Viguera <javier.viguera@digi.com> wrote:
> The wrong option was breaking the build with:
>
> configure: error: invalid package name: systemdsystemunitdir=
>
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

