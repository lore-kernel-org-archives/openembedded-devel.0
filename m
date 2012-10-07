Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TKu4r-0006VQ-KD
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Oct 2012 18:51:42 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so3043821pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Oct 2012 09:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=imSBQFkKe4f1BgW0mamGH5NNi0NTVzJVINSSDi0Vzfo=;
	b=zUpbs3Hq2fmfiGdi8pxN8EQcLK9s0mouadp+V5thZ0e87ZDAskehopkEkFzVDvl8OM
	mepYPVTKNM70Z7eN0pUi/cAg1iJzNhQakiXUvi2CBcTWw7RStkAQ3AS8xVxkXIpacNxR
	ErUZ40oOZ5IqW/IgLr4U+OugarElsSs0AlkjsSjGcP5uZKEXiENE+J6a1Rak7Qghu/qY
	mKnT/6Abzae+GpMqqkwRZP7INm5LTqYutASb2jRv7ScLbuSzDwgouZ6GXmLuBXeqjb0S
	SxaqKlN+vDfrKCIOxSa02angaBN89gpyQH15SgYh6xHjDxN7GXKfkRTyAofnx+A4JB+4
	RzbA==
MIME-Version: 1.0
Received: by 10.68.197.70 with SMTP id is6mr34513730pbc.64.1349627915648; Sun,
	07 Oct 2012 09:38:35 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Sun, 7 Oct 2012 09:38:35 -0700 (PDT)
In-Reply-To: <1349580035-28194-1-git-send-email-otavio@ossystems.com.br>
References: <1349580035-28194-1-git-send-email-otavio@ossystems.com.br>
Date: Sun, 7 Oct 2012 13:38:35 -0300
X-Google-Sender-Auth: jTy1E_Tey6KKZEa9xVP6stsrNKY
Message-ID: <CAP9ODKp0MX+dKfCThJXEJY8AtkHSSYcyfKgCmi-vHj8F=FbVmw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] xbmc: Fix serveral build errors and install missing dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Oct 2012 16:51:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Oct 7, 2012 at 12:20 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> This allow the package to build fine. On the test board it didn't show
> anything in display but it seems to be hardware specific issue.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>


I found an error, will send v2 soon.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


