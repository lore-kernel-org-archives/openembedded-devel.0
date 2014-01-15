Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 08CFB6E362
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:43:01 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id wp4so1027407obc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=fA0IWPw/yYQe8FeitKocWnuJZ5j6x2IMhWwVu8JUS90=;
	b=rjlZjn3ypPwjg7eZ4+96r4negAqyETOz8TlqSF6yp7tg9vM03U7rtPX0uiL+G/LIxN
	eleErbhupwmmDcf04nQ8nuDrrRkKhPGkV3Bk77687pudkArgize/XXti3Vi+vMEo1Ghk
	MEahm+oMzl1lN7qhXkzfwsu7Wxm7J2S1/CSj4erklqGjc/Jz1faGqnlabb2SVxdIAyt4
	ynYHQVm59dCk8jJ6IWHRNkslkPYU3JXTlPN0pfStcailWX7vcV8MaFdf0T81z8z8GacS
	lllU6Sfw95LTvfMS6Ivzrc2xSeVPqPVyDeb/uh2vDHOvPM07veIue0EuVswHOVCZaxEG
	AMCw==
MIME-Version: 1.0
X-Received: by 10.182.28.134 with SMTP id b6mr1342046obh.27.1389786182903;
	Wed, 15 Jan 2014 03:43:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 15 Jan 2014 03:43:02 -0800 (PST)
In-Reply-To: <1389785832-3120-2-git-send-email-ross.burton@intel.com>
References: <1389785832-3120-1-git-send-email-ross.burton@intel.com>
	<1389785832-3120-2-git-send-email-ross.burton@intel.com>
Date: Wed, 15 Jan 2014 09:43:02 -0200
X-Google-Sender-Auth: t7-Bej1iWPP_TpsWWEFnt-1UYxI
Message-ID: <CAP9ODKr8yTSX346VLXnCSy8kKtczjE0XOA0+tbf=HYvKj9PK7A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 2/5] llvm: don't do out-of-tree builds manually
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
X-List-Received-Date: Wed, 15 Jan 2014 11:43:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 15, 2014 at 9:37 AM, Ross Burton <ross.burton@intel.com> wrote:

> cmake.bbclass as of oe-core 783fb88 defaults to out-of-tree builds.  Use
> that
> functionality directly to clean up the recipe.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

