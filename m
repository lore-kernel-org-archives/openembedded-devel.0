Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4C69F70313
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Jul 2014 22:08:08 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id wp18so3064702obc.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jul 2014 15:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=DOEft8HR9/eVrkw+YCtW8qNlpoDKSZE9acvJFOWFeJo=;
	b=uiJSk/ISuVOilT+7Txws9JvncyRqfdvrnjS7azRz6/xpfaboxs+YJafaomZVPWXIhx
	cv9ubu0jlU5AeMnwwWe+m+bjXoyP/2dkhTL7ZJUpPZT5oCS/Zfu1xH/9V9BHW15E5GVQ
	KI6dFw5Z2qXQDCETsWU5bXSQgXwYxgnvAlMkQHM9bFibGxNT7YT02bPhe7V0YBbjUpul
	xuUxrFTSZfA4f1oqs5Tk+TazFknaYJIhYQpDI6mOqz9VX93dquLtsrOekDhTnN4qZ08B
	+oK3DW6Fy1c4JZfxMuERS4AEqs6YENq0IZkOoIG1u58b+U4KhiYYkrrxeqdN36/Es+JY
	EPBw==
MIME-Version: 1.0
X-Received: by 10.60.118.38 with SMTP id kj6mr21449949oeb.68.1404598090062;
	Sat, 05 Jul 2014 15:08:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.84.164 with HTTP; Sat, 5 Jul 2014 15:08:10 -0700 (PDT)
In-Reply-To: <1403706635-12134-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403706635-12134-1-git-send-email-Martin.Jansa@gmail.com>
Date: Sat, 5 Jul 2014 19:08:10 -0300
X-Google-Sender-Auth: vVLsjI2V7pDLsWndiUYOFVBWVD0
Message-ID: <CAP9ODKpqRO9Gc7uakKrY8Us8XLE2N4uV061dQiN7WLGBtHYc2A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [meta-browser][PATCHv2] firefox-{l10n, addon}: Drop runtime dependency on TUNE_PKGARCH firefox and keep allarch
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
X-List-Received-Date: Sat, 05 Jul 2014 22:08:09 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 25, 2014 at 11:30 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I think we need to have a better way to address this kind of thing in
OE. Couldn't the package to 'tell' it is ABI safe?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

