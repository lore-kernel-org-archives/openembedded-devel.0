Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id E1DAB60FD5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 21:29:08 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id to1so3765249ieb.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 14:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=KJsds2MDBqlSCBOVVZKx6TUa7vXefULPxWIkT8Kf8Bs=;
	b=cT+mxl6UvwB/hvU+xF0xUDK/5oIOQ6wWxSQlMe0QYyYHFG71gSK0V4jTypHzt65Aj5
	Qi/yQDpszV/zDW15ZkiMT/sm9PsBHSw84qjObYZ1xetUskwpBcDLcZmavywbqDc7zLiu
	rcunLpHLp8woiVFp0y/5Moqt2z1ytOfhfDOhWdmp3hzseOTlKJHulsFhVh1fpDuIkSM0
	DsLssHQ+pbyA8RdhiAhrT7ZyIZ6FX0TExrAS3++C0HBZTD0sF9zsetjlP08tclfjSXY2
	QOSS8+zUBDh05xnfqR6HnaES4pZJuzEiH+y42l+E+NitfyldYevhIeuzsoaYGvFzTVwM
	FHAQ==
MIME-Version: 1.0
X-Received: by 10.42.54.13 with SMTP id p13mr3623004icg.6.1379107750772; Fri,
	13 Sep 2013 14:29:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.20.229 with HTTP; Fri, 13 Sep 2013 14:29:10 -0700 (PDT)
In-Reply-To: <1379078395-23592-1-git-send-email-ml@communistcode.co.uk>
References: <1379078395-23592-1-git-send-email-ml@communistcode.co.uk>
Date: Fri, 13 Sep 2013 18:29:10 -0300
X-Google-Sender-Auth: GU4qb4u9KNrk0JgI9seAzeHsroc
Message-ID: <CAP9ODKonACidq+Yk-vqnM5=N94kbvJLArDu7_U3Co1v3TCHcXg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: Re: [meta-oe][PATCH] libsoc: new recipe
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
X-List-Received-Date: Fri, 13 Sep 2013 21:29:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 13, 2013 at 10:19 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> From: Jack Mitchell <jack@embed.me.uk>
...
> +DEPENDS = "libgcc"

Does this is really need?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

