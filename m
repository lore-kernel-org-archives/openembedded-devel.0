Received: from mail-ob0-f179.google.com ([209.85.214.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U4Eej-0006AS-92
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Feb 2013 18:56:05 +0100
Received: by mail-ob0-f179.google.com with SMTP id un3so4861780obb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Feb 2013 09:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=YSh32m2lZx1DDEI8liWKYW9e/ZQOc66id5X43wmu5Ds=;
	b=bP0XkXM3CJl9xy6l/hqh2AuR5WlXU+tMegXKCye4DR4Tw7rwF0Ypk375yOiCOvjQf/
	eqRQRRZALL4bvfSuOdCU6egUanayUi7YVTYrB4CmFFJqtqLMapK3sjH5PdoICBcOcejx
	cagPk4VMHse+iRbtS0myW2/dw06/1XFotv8S3BRWG5W6Lmu+IoHpoCdNnn3c3Cwu22m+
	mv8ATiq16aKDmQoVB4eWrmlZcKAAoM+gu8TbHyprHPBip6j9els+IbjqI/tK8UAjZkSZ
	BlU7lMMvWOtvG6uOeDinGbbYzgS29D0wToavn4Ke8crRS847cf++/86xwtzpygtdplPL
	sakA==
MIME-Version: 1.0
X-Received: by 10.60.20.7 with SMTP id j7mr7052768oee.40.1360431609397; Sat,
	09 Feb 2013 09:40:09 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Sat, 9 Feb 2013 09:40:09 -0800 (PST)
In-Reply-To: <CAP9ODKpr-Hg6h5mANx0s-p=TUzfaKhwmrKQMRK1wRpDdEHCXeA@mail.gmail.com>
References: <CAP9ODKpr-Hg6h5mANx0s-p=TUzfaKhwmrKQMRK1wRpDdEHCXeA@mail.gmail.com>
Date: Sat, 9 Feb 2013 15:40:09 -0200
X-Google-Sender-Auth: -w1FAr_n4JeqX9NVJNrzD6NGyZ0
Message-ID: <CAP9ODKoiG+bjZgXZvOkvYTiFqr0HEQWrevdn8PVkP3ZnzXC0zA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	=?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: [for-danny] Changes for cherry-pick
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
X-List-Received-Date: Sat, 09 Feb 2013 17:56:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 5, 2013 at 12:29 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello Eric,
>
> Please evaluate following changes for backport to danny (in order):
>
> * 430922f xf86-video-geode: Update to 2.11.14
>
> * 6956575 samba: split winbind into winbind and libwinbind
>
> * 47e9480 samba: remove empty /sbin
>
> * 1ec00cd samba: added gnu-configize for AArch64 support
>
> * 86c8f45 samba: Fix build on Fedora 17
>
> * a623fd9 samba: disable avahi and build without acl
>
> * 18e5661 samba: add new package libwbclient to avoid libsmbclient
> dragging in samba

ping?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


