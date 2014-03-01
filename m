Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 344876E9A3
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Mar 2014 20:31:33 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id b6so1793728yha.30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Mar 2014 12:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=qQDBqcW5MdCV4haHv0vx5W03HnEq0jfvzzXKBvS2wxc=;
	b=r8j/+/M9LGilrBbvpxkE1UFaampb/yWarjVEFuir/iIPI6Lpf2LNU/+p4JtmbfH5EU
	JyuNI9CTbHCGuzcnS7QSyA/wf7zvK1Xtb5NYfPThcVecxoWQVku8tSGcJ4wavqtWRExg
	xhvv10yutV9Ei+9i7dnbsjs/6tNt3D7oZuU8O6Xoxd2SMJnPrcen7ufXfe6JZztmN+Bj
	r3OKI6uFdEyxweHPhNb3zBWCM49nrHB9WsjkKgmemqJbX8pnxkdxlI2VNK4rgt7g91Pd
	JAH6Vub2H4iMTylyHknuXruEnNVYb5NXqswUf1J2sGfB4JgPEOGb1Zdu1nYeSMVr1AmK
	MmRg==
MIME-Version: 1.0
X-Received: by 10.236.60.68 with SMTP id t44mr10381028yhc.47.1393705894191;
	Sat, 01 Mar 2014 12:31:34 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Sat, 1 Mar 2014 12:31:33 -0800 (PST)
In-Reply-To: <1393640395-9737-1-git-send-email-net147@gmail.com>
References: <1393640395-9737-1-git-send-email-net147@gmail.com>
Date: Sat, 1 Mar 2014 17:31:33 -0300
X-Google-Sender-Auth: mo4RUgZN54qdqLJ0se3C0U7fjuY
Message-ID: <CAP9ODKqEVL3g6+70CtbtaRia3XRrzYSX+vZfg2b+udw9AGZZBw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH 1/2] qtimageformats: allow empty qtimageformats package
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
X-List-Received-Date: Sat, 01 Mar 2014 20:31:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 28, 2014 at 11:19 PM, Jonathan Liu <net147@gmail.com> wrote:

> This fixes installing qtimageformats-dev with opkg as it depends on the
> qtimageformats package which wasn't created.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
>

Could you extend the commit log to make it clear why it is not created?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

